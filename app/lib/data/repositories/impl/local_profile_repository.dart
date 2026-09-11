import '../../local/database.dart';
import '../../local/mappers.dart';
import '../../models/profile.dart';
import '../profile_repository.dart';

/// 用户档案与三栏清单的本地 Drift 实现。
///
/// 期1 单机单用户（Q12-A）：全库恒 1 行，`id` 固定为 1（建库时已插入）。
class LocalProfileRepository implements ProfileRepository {
  LocalProfileRepository(this._db);

  final AppDatabase _db;

  /// 单用户固定主键
  static const int _singleId = 1;

  @override
  Stream<Profile> watch() {
    return (_db.select(_db.profiles)
          ..where((t) => t.id.equals(_singleId)))
        .watchSingleOrNull()
        .map((ProfileRow? row) => row?.toDomain() ?? const Profile());
  }

  @override
  Future<Profile> get() async {
    final ProfileRow? row = await (_db.select(_db.profiles)
          ..where((t) => t.id.equals(_singleId)))
        .getSingleOrNull();
    // 理论上建库时已插入该行；这里兜底返回默认档案，避免页面首启崩溃
    return row?.toDomain() ?? const Profile();
  }

  @override
  Future<void> save(Profile profile) async {
    await _db.into(_db.profiles).insertOnConflictUpdate(
          profile.copyWith(id: _singleId).toCompanion(),
        );
  }

  @override
  Future<void> addXp(int xp, {int mealsDelta = 0}) {
    return _db.transaction(() async {
      final Profile current = await get();
      await save(
        current.copyWith(
          xp: current.xp + xp,
          totalMeals: current.totalMeals + mealsDelta,
        ),
      );
    });
  }

  @override
  Future<bool> toggleFavorite(int recipeId) => _toggle(
        recipeId,
        select: (Profile p) => p.favoriteRecipeIds,
        apply: (Profile p, List<int> ids) =>
            p.copyWith(favoriteRecipeIds: ids),
      );

  @override
  Future<bool> toggleWanted(int recipeId) => _toggle(
        recipeId,
        select: (Profile p) => p.wantedRecipeIds,
        apply: (Profile p, List<int> ids) => p.copyWith(wantedRecipeIds: ids),
      );

  /// 「我做过」打卡：追加并去重（构想 2.6 第 3 点）
  @override
  Future<void> markCooked(int recipeId) {
    return _db.transaction(() async {
      final Profile current = await get();
      if (current.cookedRecipeIds.contains(recipeId)) return;
      final List<int> ids = List<int>.of(current.cookedRecipeIds)
        ..add(recipeId);
      await save(current.copyWith(cookedRecipeIds: ids));
    });
  }

  /// 长按挪移：把菜式从任一栏挪到目标栏（构想 2.6 第 3 点）。
  ///
  /// 三个 bool 表达的是**目标态**而不是"增量"——传 true 即保证在栏内，
  /// 传 false 即保证不在栏内，所以「喜欢 → 想做」这类跨栏挪移
  /// 只需同时传 `favorite: false, wanted: true`。
  @override
  Future<void> moveTo(
    int recipeId, {
    required bool favorite,
    required bool cooked,
    required bool wanted,
  }) {
    return _db.transaction(() async {
      final Profile current = await get();
      await save(
        current.copyWith(
          favoriteRecipeIds:
              _applyFlag(current.favoriteRecipeIds, recipeId, favorite),
          cookedRecipeIds:
              _applyFlag(current.cookedRecipeIds, recipeId, cooked),
          wantedRecipeIds:
              _applyFlag(current.wantedRecipeIds, recipeId, wanted),
        ),
      );
    });
  }

  Future<bool> _toggle(
    int recipeId, {
    required List<int> Function(Profile) select,
    required Profile Function(Profile, List<int>) apply,
  }) {
    return _db.transaction(() async {
      final Profile current = await get();
      final List<int> ids = List<int>.of(select(current));
      final bool nowIn;
      if (ids.contains(recipeId)) {
        ids.remove(recipeId);
        nowIn = false;
      } else {
        ids.add(recipeId);
        nowIn = true;
      }
      await save(apply(current, ids));
      return nowIn;
    });
  }

  /// `flag = true` → 保证在清单内（已在则不重复、保持原顺序，新增追加到末尾）；
  /// `flag = false` → 从清单移除。
  List<int> _applyFlag(List<int> ids, int id, bool flag) {
    final List<int> next = List<int>.of(ids);
    if (flag) {
      if (!next.contains(id)) next.add(id);
    } else {
      next.remove(id);
    }
    return next;
  }
}
