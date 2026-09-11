import 'package:flutter_test/flutter_test.dart';
import 'package:foodbox/data/local/database.dart';
import 'package:foodbox/data/models/profile.dart';
import 'package:foodbox/data/repositories/impl/local_profile_repository.dart';

/// 用户档案与三栏清单本地实现的单元测试（W2 交付物）。
///
/// 重点覆盖：恒 1 行的单用户语义、XP 结算、toggle 返回值，
/// 以及 `moveTo` 的「目标态」语义（跨栏挪移 / 去重 / 保序）。
void main() {
  late AppDatabase db;
  late LocalProfileRepository repo;

  setUp(() {
    db = AppDatabase.memory();
    repo = LocalProfileRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  test('get / watch 首启返回默认档案（恒 1 行，id = 1）', () async {
    final Profile p = await repo.get();
    expect(p.id, 1);
    expect(p.nickname, '食匣用户');
    expect(p.xp, 0);
    expect(p.favoriteRecipeIds, isEmpty);

    expect((await repo.watch().first).id, 1);
  });

  test('save 始终写在同一行，不会新增行', () async {
    await repo.save(const Profile(nickname: '小明'));
    await repo.save(const Profile(nickname: '小红'));

    final List<ProfileRow> rows = await db.select(db.profiles).get();
    expect(rows, hasLength(1));
    expect(rows.single.nickname, '小红');
  });

  test('addXp 累加经验值与顿数', () async {
    await repo.addXp(20, mealsDelta: 1);
    await repo.addXp(10);

    final Profile p = await repo.get();
    expect(p.xp, 30);
    expect(p.totalMeals, 1);
    expect(p.level.title, '见习厨工'); // 30 < 50，仍是 Lv1
  });

  test('toggleFavorite / toggleWanted 返回切换后的状态，可来回切', () async {
    expect(await repo.toggleFavorite(7), isTrue);
    expect((await repo.get()).favoriteRecipeIds, <int>[7]);
    expect(await repo.toggleFavorite(7), isFalse);
    expect((await repo.get()).favoriteRecipeIds, isEmpty);

    expect(await repo.toggleWanted(3), isTrue);
    expect((await repo.get()).wantedRecipeIds, <int>[3]);
    expect(await repo.toggleWanted(3), isFalse);
  });

  test('markCooked 打卡去重', () async {
    await repo.markCooked(3);
    await repo.markCooked(3);
    expect((await repo.get()).cookedRecipeIds, <int>[3]);
  });

  test('moveTo 是「目标态」语义：跨栏挪移并保序追加', () async {
    await repo.save(
      const Profile(
        favoriteRecipeIds: <int>[1, 2],
        wantedRecipeIds: <int>[3],
      ),
    );

    // 把 2 从「喜欢」挪到「想做」
    await repo.moveTo(2, favorite: false, cooked: false, wanted: true);

    final Profile p = await repo.get();
    expect(p.favoriteRecipeIds, <int>[1]);
    expect(p.wantedRecipeIds, <int>[3, 2]); // 追加到末尾，保持原有顺序
  });

  test('moveTo 重复调用不产生重复项', () async {
    await repo.moveTo(5, favorite: false, cooked: false, wanted: true);
    await repo.moveTo(5, favorite: false, cooked: false, wanted: true);

    expect((await repo.get()).wantedRecipeIds, <int>[5]);
  });

  test('moveTo 可同时落在多栏（喜欢 + 做过 + 想做）', () async {
    await repo.moveTo(
      9,
      favorite: true,
      cooked: true,
      wanted: true,
    );

    final Profile p = await repo.get();
    expect(p.favoriteRecipeIds, <int>[9]);
    expect(p.cookedRecipeIds, <int>[9]);
    expect(p.wantedRecipeIds, <int>[9]);
  });

  test('moveTo 三栏全 false 等同于从所有清单移除', () async {
    await repo.moveTo(9, favorite: true, cooked: true, wanted: true);
    await repo.moveTo(9, favorite: false, cooked: false, wanted: false);

    final Profile p = await repo.get();
    expect(p.favoriteRecipeIds, isEmpty);
    expect(p.cookedRecipeIds, isEmpty);
    expect(p.wantedRecipeIds, isEmpty);
  });
}
