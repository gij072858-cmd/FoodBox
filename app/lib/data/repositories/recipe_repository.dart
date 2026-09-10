import '../models/recipe.dart';

/// 菜式数据访问接口
///
/// 实现：`impl/local_recipe_repository.dart`（W2）。
abstract interface class RecipeRepository {
  Stream<List<Recipe>> watchAll();

  Future<List<Recipe>> getAll();

  Future<Recipe?> getById(int id);

  /// 某道菜的步骤（按 orderIndex 升序）—— 详情页步骤流与时序引擎共用
  Future<List<Step>> stepsOf(int recipeId);

  Stream<List<Step>> watchStepsOf(int recipeId);

  /// 一步到位地新建菜式 + 其步骤（详情录入时用，保证事务性）
  Future<int> createWithSteps(Recipe recipe, List<Step> steps);

  Future<void> update(Recipe recipe);

  /// 覆盖式保存某道菜的步骤（按 orderIndex 对齐）
  Future<void> replaceSteps(int recipeId, List<Step> steps);

  Future<void> delete(int id);

  /// 按分类取菜式（菜式页下半区「分类歌单」，构想 2.3.1）
  Future<List<Recipe>> byMainCategory(String category);

  /// 按时令月份取菜式（F12 简易版：按当前月份匹配"适宜月份"标签）
  Future<List<Recipe>> bySeasonMonth(int month);

  /// 关键词搜索（菜名 / 菜系 / 分类）
  Future<List<Recipe>> search(String keyword);
}
