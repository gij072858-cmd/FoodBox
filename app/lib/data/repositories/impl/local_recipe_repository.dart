import 'package:drift/drift.dart';

import '../../local/database.dart';
import '../../local/mappers.dart';
import '../../models/recipe.dart';
import '../recipe_repository.dart';

/// 菜式的本地 Drift 实现。
///
/// 配方明细以 JSON 内嵌在 `recipes.ingredients`（不单独建表，见接口约定 2.7）。
class LocalRecipeRepository implements RecipeRepository {
  LocalRecipeRepository(this._db);

  final AppDatabase _db;

  // ============================ 读 ============================

  @override
  Stream<List<Recipe>> watchAll() {
    return (_db.select(_db.recipes)
          ..orderBy(<OrderClauseGenerator<$RecipesTable>>[
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch()
        .map(_toRecipes);
  }

  @override
  Future<List<Recipe>> getAll() async {
    final List<RecipeRow> rows = await (_db.select(_db.recipes)
          ..orderBy(<OrderClauseGenerator<$RecipesTable>>[
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
    return _toRecipes(rows);
  }

  @override
  Future<Recipe?> getById(int id) async {
    final RecipeRow? row = await (_db.select(_db.recipes)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row?.toDomain();
  }

  @override
  Future<List<Step>> stepsOf(int recipeId) async {
    final List<StepRow> rows = await _stepsQuery(recipeId).get();
    return rows.map((StepRow row) => row.toDomain()).toList();
  }

  @override
  Stream<List<Step>> watchStepsOf(int recipeId) {
    return _stepsQuery(recipeId)
        .watch()
        .map((List<StepRow> rows) =>
            rows.map((StepRow row) => row.toDomain()).toList());
  }

  @override
  Future<List<Recipe>> byMainCategory(String category) async {
    final List<RecipeRow> rows = await (_db.select(_db.recipes)
          ..where((t) => t.mainCategory.equals(category))
          ..orderBy(<OrderClauseGenerator<$RecipesTable>>[
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
    return _toRecipes(rows);
  }

  /// 按时令月份取菜式（F12 简易版）。
  ///
  /// `season_months` 是 JSON 文本列，30–50 道菜式的规模下全量读出后在 Dart 层
  /// 过滤即可 —— 不引入 SQLite JSON 函数依赖，也与未来 `RecipeMatcher` 的口径一致。
  @override
  Future<List<Recipe>> bySeasonMonth(int month) async {
    final List<Recipe> all = await getAll();
    return all
        .where((Recipe r) => r.seasonMonths.contains(month))
        .toList();
  }

  @override
  Future<List<Recipe>> search(String keyword) async {
    final String kw = keyword.trim();
    if (kw.isEmpty) return getAll();
    final String pattern = '%$kw%';
    final List<RecipeRow> rows = await (_db.select(_db.recipes)
          ..where(
            (t) =>
                t.name.like(pattern) |
                t.cuisine.like(pattern) |
                t.mainCategory.like(pattern),
          )
          ..orderBy(<OrderClauseGenerator<$RecipesTable>>[
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
    return _toRecipes(rows);
  }

  // ============================ 写 ============================

  /// 一步到位地新建菜式 + 其步骤（同一事务，保证不会出现"有菜无步骤"）。
  @override
  Future<int> createWithSteps(Recipe recipe, List<Step> steps) {
    return _db.transaction(() async {
      final int recipeId =
          await _db.into(_db.recipes).insert(recipe.toCompanion());
      await _insertSteps(recipeId, steps);
      return recipeId;
    });
  }

  @override
  Future<void> update(Recipe recipe) async {
    final int? id = recipe.id;
    if (id == null) {
      throw ArgumentError('RecipeRepository.update 需要 recipe.id 非空');
    }
    await (_db.update(_db.recipes)..where((t) => t.id.equals(id)))
        .write(recipe.toCompanion());
  }

  /// 覆盖式保存步骤：同事务内先清空该菜式的步骤再按入参顺序重插。
  ///
  /// `steps` 表没有下游外键引用，先删后插是安全的，且天然对齐 `orderIndex`。
  @override
  Future<void> replaceSteps(int recipeId, List<Step> steps) {
    return _db.transaction(() async {
      await (_db.delete(_db.steps)
            ..where((t) => t.recipeId.equals(recipeId)))
          .go();
      await _insertSteps(recipeId, steps);
    });
  }

  /// 删除菜式，并连带清理其步骤（步骤表无外键级联，需手动清理）。
  @override
  Future<void> delete(int id) {
    return _db.transaction(() async {
      await (_db.delete(_db.steps)..where((t) => t.recipeId.equals(id)))
          .go();
      await (_db.delete(_db.recipes)..where((t) => t.id.equals(id)))
          .go();
    });
  }

  // ============================ 内部工具 ============================

  Selectable<StepRow> _stepsQuery(int recipeId) =>
      _db.select(_db.steps)
        ..where((t) => t.recipeId.equals(recipeId))
        ..orderBy(<OrderClauseGenerator<$StepsTable>>[
          (t) => OrderingTerm.asc(t.orderIndex),
        ]);

  /// 按入参顺序重排 `orderIndex`（从 1 开始）并批量写入。
  ///
  /// 强制清掉 `id`：入参可能来自数据库（带 id），直接插入会与自增主键冲突。
  Future<void> _insertSteps(int recipeId, List<Step> steps) async {
    if (steps.isEmpty) return;
    await _db.batch((Batch batch) {
      for (int i = 0; i < steps.length; i++) {
        final Step step = steps[i].copyWith(orderIndex: i + 1);
        final StepsCompanion companion =
            step.toCompanion(recipeId).copyWith(id: const Value<int>.absent());
        batch.insert(_db.steps, companion);
      }
    });
  }

  List<Recipe> _toRecipes(List<RecipeRow> rows) =>
      rows.map((RecipeRow row) => row.toDomain()).toList();
}
