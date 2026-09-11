import 'package:drift/drift.dart';

import '../../local/database.dart';
import '../../local/mappers.dart';
import '../../models/enums.dart';
import '../../models/item.dart';
import '../../models/recipe.dart';
import '../pantry_repository.dart';

/// 库（食材 / 调料）的本地 Drift 实现 —— 期1 唯一实现。
///
/// 期2 上云时新增 `SupabasePantryRepository` 实现同一接口，本类保留为离线兜底。
/// 纪律：行 ↔ 领域模型的转换一律复用 `local/mappers.dart`，本文件不重复写字段映射。
class LocalPantryRepository implements PantryRepository {
  LocalPantryRepository(this._db);

  final AppDatabase _db;

  // ============================ 读 ============================

  @override
  Stream<List<Item>> watchAll({ItemKind? kind}) {
    final SimpleSelectStatement<$ItemsTable, ItemRow> query =
        _db.select(_db.items);
    if (kind != null) {
      query.where((t) => t.kind.equalsValue(kind));
    }
    query.orderBy(<OrderClauseGenerator<$ItemsTable>>[
      (t) => OrderingTerm.asc(t.name),
    ]);
    return query.watch().map(_toItems);
  }

  @override
  Future<List<Item>> getAll({ItemKind? kind}) async {
    final SimpleSelectStatement<$ItemsTable, ItemRow> query =
        _db.select(_db.items);
    if (kind != null) {
      query.where((t) => t.kind.equalsValue(kind));
    }
    query.orderBy(<OrderClauseGenerator<$ItemsTable>>[
      (t) => OrderingTerm.asc(t.name),
    ]);
    return _toItems(await query.get());
  }

  @override
  Future<Item?> getById(int id) async {
    final ItemRow? row = await (_db.select(_db.items)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row?.toDomain();
  }

  @override
  Future<List<Item>> search(String keyword, {ItemKind? kind}) async {
    final String kw = keyword.trim();
    if (kw.isEmpty) return getAll(kind: kind);

    final SimpleSelectStatement<$ItemsTable, ItemRow> query =
        _db.select(_db.items)
          ..where((t) => t.name.like('%$kw%'));
    if (kind != null) {
      query.where((t) => t.kind.equalsValue(kind));
    }
    query.orderBy(<OrderClauseGenerator<$ItemsTable>>[
      (t) => OrderingTerm.asc(t.name),
    ]);
    return _toItems(await query.get());
  }

  /// 临期查询：剩余天数 ≤ [days] 且未过期（F3 临期提醒数据源）。
  ///
  /// 与 `Item.remainingDays` 的自然日口径保持一致：
  /// 命中区间为 `[今天 00:00, 今天 00:00 + (days + 1) 天)`，
  /// 上界取次日零点是为了容纳 `expireAt` 里带的时分秒，避免漏掉第 [days] 天。
  @override
  Future<List<Item>> findExpiringWithin(int days, {DateTime? now}) async {
    final DateTime today = now ?? DateTime.now();
    final DateTime dayStart = DateTime(today.year, today.month, today.day);
    final DateTime upperBound = dayStart.add(Duration(days: days + 1));

    final List<ItemRow> rows = await (_db.select(_db.items)
          ..where(
            (t) =>
                t.expireAt.isNotNull() &
                t.expireAt.isBiggerOrEqualValue(dayStart) &
                t.expireAt.isSmallerThanValue(upperBound),
          )
          ..orderBy(<OrderClauseGenerator<$ItemsTable>>[
            (t) => OrderingTerm.asc(t.expireAt),
          ]))
        .get();
    return _toItems(rows);
  }

  @override
  Future<Item?> findByBarcode(String barcode) async {
    final String code = barcode.trim();
    if (code.isEmpty) return null;
    final ItemRow? row = await (_db.select(_db.items)
          ..where((t) => t.barcode.equals(code))
          ..limit(1))
        .getSingleOrNull();
    return row?.toDomain();
  }

  // ============================ 写 ============================

  @override
  Future<int> create(Item item) {
    // id 为 null 时 companion 用 Value.absent()，自增主键由 SQLite 分配
    return _db.into(_db.items).insert(item.toCompanion());
  }

  @override
  Future<void> update(Item item) async {
    final int? id = item.id;
    if (id == null) {
      throw ArgumentError('PantryRepository.update 需要 item.id 非空');
    }
    await (_db.update(_db.items)..where((t) => t.id.equals(id)))
        .write(item.toCompanion());
  }

  @override
  Future<void> delete(int id) async {
    await (_db.delete(_db.items)..where((t) => t.id.equals(id))).go();
  }

  /// 批量导入预置食材基础库。
  ///
  /// 调用方（成员二的数据接入流程）负责保证同一批数据内 `name` 不重复；
  /// 重复导入会在库中产生重复条目，如需重灌请先清空自建标记为 false 的条目。
  @override
  Future<void> insertAll(List<Item> items) async {
    if (items.isEmpty) return;
    await _db.batch((Batch batch) {
      batch.insertAll(
        _db.items,
        items.map((Item e) => e.toCompanion()).toList(),
        mode: InsertMode.insert,
      );
    });
  }

  // ============================ 跨模块契约 3.3 ============================

  /// 时序执行完成后按配方扣减库存。
  ///
  /// 同一菜式的全部食材在**同一事务**内扣减（契约 3.3）；数量归零的条目
  /// **置灰不删除**（`is_depleted = true`）。缺失的食材静默跳过 ——
  /// 缺口提示是「推荐算法」的职责，不是扣减的职责。
  @override
  Future<void> consume(int recipeId, {int servings = 2}) {
    return _db.transaction(() async {
      final RecipeRow? recipeRow = await (_db.select(_db.recipes)
            ..where((Recipes t) => t.id.equals(recipeId)))
          .getSingleOrNull();
      if (recipeRow == null) return;

      final Recipe recipe = recipeRow.toDomain();
      if (recipe.ingredients.isEmpty) return;

      final int baseServings =
          recipe.baseServings <= 0 ? 1 : recipe.baseServings;

      // 全表读一次建立「归一名称 → 条目」索引，避免循环内反复查库
      final List<ItemRow> allItems = await _db.select(_db.items).get();
      final Map<String, List<ItemRow>> index = <String, List<ItemRow>>{};
      for (final ItemRow row in allItems) {
        index.putIfAbsent(_normalize(row.name), () => <ItemRow>[]).add(row);
      }

      for (final RecipeIngredient need in recipe.ingredients) {
        final List<ItemRow>? candidates = index[_normalize(need.name)];
        if (candidates == null || candidates.isEmpty) continue;

        // 同名多条时扣最临期的一条（先过期的先用掉）
        final ItemRow target = _pickMostUrgent(candidates);
        final Item next = _consumeOne(
          target.toDomain(),
          need,
          servings: servings,
          baseServings: baseServings,
        );
        await (_db.update(_db.items)
              ..where((t) => t.id.equals(target.id)))
            .write(next.toCompanion());
      }
    });
  }

  /// 按需扣减单条库存。
  ///
  /// - 精确模式：`quantity -= amount × servings / baseServings`；
  ///   仅当**单位一致**（或任一方未填单位）时才做数值扣减，否则只做存在性
  ///   处理 —— 期1 匹配口径为存在性匹配（接口约定 3.1）。
  /// - 粗粒度模式：降一档 `有 → 不多 → 快没了 → 已用完`。
  Item _consumeOne(
    Item item,
    RecipeIngredient need, {
    required int servings,
    required int baseServings,
  }) {
    final DateTime now = DateTime.now();

    if (item.quantityMode == QuantityMode.precise) {
      final double? current = item.quantity;
      if (current == null) {
        return item.copyWith(isDepleted: true, updatedAt: now);
      }
      final bool unitMatches =
          need.unit == null || item.unit == null || need.unit == item.unit;
      final double? amount = need.amount;
      if (amount == null || !unitMatches) {
        // 无法换算（缺用量或单位对不上）：视为命中但不改数量
        return item;
      }
      final double left = current - amount * servings / baseServings;
      if (left <= 0) {
        return item.copyWith(
          quantity: 0,
          isDepleted: true,
          updatedAt: now,
        );
      }
      return item.copyWith(quantity: left, updatedAt: now);
    }

    switch (item.granularLevel ?? GranularLevel.plenty) {
      case GranularLevel.plenty:
        return item.copyWith(granularLevel: GranularLevel.some, updatedAt: now);
      case GranularLevel.some:
        return item.copyWith(granularLevel: GranularLevel.low, updatedAt: now);
      case GranularLevel.low:
        return item.copyWith(isDepleted: true, updatedAt: now);
    }
  }

  /// 取最临期的一条；无到期日的排最后。
  ItemRow _pickMostUrgent(List<ItemRow> rows) {
    if (rows.length == 1) return rows.first;
    final List<ItemRow> sorted = List<ItemRow>.of(rows)
      ..sort((ItemRow a, ItemRow b) {
        final DateTime? x = a.expireAt;
        final DateTime? y = b.expireAt;
        if (x == null && y == null) return a.id.compareTo(b.id);
        if (x == null) return 1;
        if (y == null) return -1;
        return x.compareTo(y);
      });
    return sorted.first;
  }

  /// 名称归一 —— **W2 临时实现**。
  ///
  /// 正式实现是 W4 的 `AliasTable`（西红柿 = 番茄，数据源
  /// `assets/data/alias_map.json`）。W4 交付后本方法改为注入 `AliasTable`，
  /// 届时删除此处的最小归一逻辑。
  String _normalize(String name) =>
      name.trim().replaceAll(RegExp(r'\s+'), '').toLowerCase();

  List<Item> _toItems(List<ItemRow> rows) =>
      rows.map((ItemRow row) => row.toDomain()).toList();
}
