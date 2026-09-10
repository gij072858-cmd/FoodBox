import '../models/enums.dart';
import '../models/item.dart';

/// 库（食材 / 调料）数据访问接口
///
/// 纪律：**页面不得直接操作数据库**，只能经由本接口（总计划第七章）。
/// 实现类：
///   - `impl/local_pantry_repository.dart` —— 本地 Drift 实现（W2 交付）
///   - `impl/supabase_pantry_repository.dart` —— 云端实现（期2 v1.1，接口不变）
abstract interface class PantryRepository {
  /// 库存流：库页面与推荐算法共用（跨模块契约，成员三依赖）
  Stream<List<Item>> watchAll({ItemKind? kind});

  Future<List<Item>> getAll({ItemKind? kind});

  Future<Item?> getById(int id);

  /// 按名称模糊检索（手动录入 / 全局搜索用）
  Future<List<Item>> search(String keyword, {ItemKind? kind});

  /// 新增，返回自增主键
  Future<int> create(Item item);

  Future<void> update(Item item);

  Future<void> delete(int id);

  /// 批量导入（预置食材基础库 JSON 一次性写入，成员二 W2 数据接入用）
  Future<void> insertAll(List<Item> items);

  /// 临期查询：剩余天数 ≤ [days] 且未过期（F3 临期提醒数据源）
  Future<List<Item>> findExpiringWithin(int days, {DateTime? now});

  /// 按条码精确匹配（扫码录入；未命中返回 null，由调用方引导手动选择并回写映射）
  Future<Item?> findByBarcode(String barcode);

  /// 【跨模块契约】时序执行完成后按配方扣减库存。
  ///
  /// 由时序模块调用（构想 2.2.6）；实现需保证同一菜式的多条食材
  /// 在同一事务内扣减，库位归零的条目置灰而非删除。
  /// 详见《接口约定.md》3.3。
  Future<void> consume(int recipeId, {int servings = 2});
}
