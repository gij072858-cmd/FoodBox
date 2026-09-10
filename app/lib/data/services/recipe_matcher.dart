import '../models/item.dart';
import '../models/recipe.dart';

/// 「差一点就能做」的缺失阈值（Q6-A 定稿：缺 ≤ 2 种**必需**食材）
const int kAlmostCanCookThreshold = 2;

/// 库存匹配三态（组长任务书 B）
enum MatchStatus {
  /// 现在就能做：必需食材与调料全部齐活
  canCook('可做'),

  /// 差一点就能做：仅缺 ≤ kAlmostCanCookThreshold 种必需食材
  almost('差一点'),

  /// 差太多：缺失超过阈值
  farAway('差太多');

  const MatchStatus(this.label);

  final String label;
}

/// 单道菜的匹配结果
class MatchResult {
  const MatchResult({
    required this.status,
    this.missing = const <RecipeIngredient>[],
    this.optionalMissing = const <RecipeIngredient>[],
  });

  final MatchStatus status;

  /// 缺失的必需食材/调料（有顺序，用于「一键加入购物清单」F1）
  final List<RecipeIngredient> missing;

  /// 缺失的非必需项（不影响可做判定，仅提示）
  final List<RecipeIngredient> optionalMissing;

  int get missingCount => missing.length;

  /// 蒙版角标文案，如「缺：蒜、料酒」（构想 2.3.1）
  String? get missingLabel =>
      missing.isEmpty ? null : '缺：${missing.map((RecipeIngredient e) => e.name).join('、')}';

  @override
  String toString() => 'MatchResult(${status.name}, missing: $missingCount)';
}

/// 菜式 + 匹配结果的组合（推荐区列表项）
class RecipeMatch {
  const RecipeMatch({required this.recipe, required this.result});

  final Recipe recipe;
  final MatchResult result;

  @override
  String toString() => 'RecipeMatch(${recipe.name}, ${result.status.name})';
}

/// ===========================================================================
/// 库存匹配推荐算法（构想第四章改进 3：MVP 用集合匹配，不追求精确份量计算）
///
/// 【接口冻结】W1 仅冻结签名，实现由组长在 W4 交付（`RecipeMatcherV1`）。
/// 本接口是跨模块契约之一（总计划第七章）：成员三的菜式页只依赖本接口。
/// ===========================================================================
abstract interface class RecipeMatcher {
  /// 单道菜匹配
  ///
  /// - 仅统计**必需**项（`RecipeIngredient.isRequired`）用于三态判定；
  /// - 名称比较必须经 [AliasTable] 归一（西红柿 = 番茄）；
  /// - 库存条目数量为「快没了 / 已用完」时是否算命中：期1 口径为**算命中**
  ///   （只做存在性匹配，不做数量匹配）。详见《接口约定.md》3.1。
  MatchResult match(Recipe recipe, List<Item> items);

  /// 批量匹配并按推荐优先级排序：
  /// 可做（按耗时升序）→ 差一点（按缺失数升序）→ 差太多
  List<RecipeMatch> matchAll(List<Recipe> recipes, List<Item> items);
}

/// 食材别名归一表（西红柿 = 番茄、土豆 = 马铃薯 …）
///
/// 【接口冻结】实现由组长 W4 交付，数据源 `assets/data/alias_map.json`
/// （人工维护，规模可控 —— 构想第四章改进 3）。
abstract interface class AliasTable {
  /// 归一为标准名；无别名时原样返回（去空格、转小写）
  String normalize(String name);

  /// 两个名称是否指同一种食材
  bool sameIngredient(String a, String b);
}
