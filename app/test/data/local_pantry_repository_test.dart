// drift 也导出了 isNull / isNotNull（SQL 表达式），与测试匹配器同名，此处隐藏
import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:foodbox/data/local/database.dart';
import 'package:foodbox/data/models/enums.dart';
import 'package:foodbox/data/models/item.dart';
import 'package:foodbox/data/models/recipe.dart';
import 'package:foodbox/data/repositories/impl/local_pantry_repository.dart';

/// 库模块本地实现的单元测试（W2 交付物）。
///
/// 重点覆盖：CRUD 全链路、临期查询边界、以及跨模块契约 3.3 的
/// `consume` 扣减（事务性 / 归零置灰 / 份数换算 / 名称归一）。
void main() {
  late AppDatabase db;
  late LocalPantryRepository repo;

  setUp(() {
    db = AppDatabase.memory();
    repo = LocalPantryRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  Item preciseItem({
    required String name,
    double? quantity,
    String? unit,
    DateTime? expireAt,
    String? barcode,
  }) {
    return Item(
      name: name,
      kind: ItemKind.ingredient,
      quantityMode: QuantityMode.precise,
      quantity: quantity,
      unit: unit,
      expireAt: expireAt,
      barcode: barcode,
    );
  }

  Future<int> seedRecipe({int baseServings = 2}) {
    return db.into(db.recipes).insert(
          RecipesCompanion.insert(
            name: '番茄炒蛋',
            baseServings: Value<int>(baseServings),
            ingredients:
                const Value<List<RecipeIngredient>>(<RecipeIngredient>[
              RecipeIngredient(name: '番茄', amount: 2, unit: '个'),
              RecipeIngredient(name: '鸡蛋', amount: 3, unit: '个'),
            ]),
          ),
        );
  }

  group('CRUD', () {
    test('create / getById / update / delete 全链路', () async {
      final int id = await repo.create(
        Item(name: '鸡蛋', kind: ItemKind.ingredient),
      );

      final Item? created = await repo.getById(id);
      expect(created, isNotNull);
      expect(created!.name, '鸡蛋');
      expect(created.isDepleted, isFalse); // v1.1 新列默认值
      expect(created.category, '未分类'); // 列默认值

      await repo.update(created.copyWith(name: '土鸡蛋'));
      expect((await repo.getById(id))!.name, '土鸡蛋');

      await repo.delete(id);
      expect(await repo.getById(id), isNull);
    });

    test('update 缺 id 时抛 ArgumentError', () async {
      await expectLater(
        repo.update(const Item(name: 'X', kind: ItemKind.ingredient)),
        throwsArgumentError,
      );
    });

    test('getAll 按 kind 过滤', () async {
      await repo.create(Item(name: '番茄', kind: ItemKind.ingredient));
      await repo.create(Item(name: '生抽', kind: ItemKind.seasoning));

      expect(await repo.getAll(), hasLength(2));
      final List<Item> seasonings = await repo.getAll(kind: ItemKind.seasoning);
      expect(seasonings, hasLength(1));
      expect(seasonings.single.name, '生抽');
    });

    test('insertAll 批量导入预置基础库', () async {
      await repo.insertAll(<Item>[
        Item(name: '蒜', kind: ItemKind.ingredient),
        Item(name: '姜', kind: ItemKind.ingredient),
        Item(name: '盐', kind: ItemKind.seasoning),
      ]);
      expect(await repo.getAll(), hasLength(3));
      await repo.insertAll(<Item>[]); // 空列表应当安全
      expect(await repo.getAll(), hasLength(3));
    });

    test('新增的 is_depleted 能往返读写', () async {
      final int id = await repo.create(Item(name: '番茄', kind: ItemKind.ingredient));
      final Item item = (await repo.getById(id))!;
      await repo.update(item.copyWith(isDepleted: true));
      expect((await repo.getById(id))!.isDepleted, isTrue);
    });
  });

  group('search / barcode', () {
    test('中文关键词模糊匹配；空白关键词等价于全量', () async {
      await repo.create(Item(name: '鸡腿', kind: ItemKind.ingredient));
      await repo.create(Item(name: '鸡蛋', kind: ItemKind.ingredient));
      await repo.create(Item(name: '番茄', kind: ItemKind.ingredient));

      final List<Item> hits = await repo.search('鸡');
      expect(hits, hasLength(2));
      expect(hits.map((Item e) => e.name), containsAll(<String>['鸡腿', '鸡蛋']));

      expect(await repo.search('   '), hasLength(3));
    });

    test('扫码命中与未命中', () async {
      await repo.create(preciseItem(name: '生抽', barcode: '6901234567892'));
      expect((await repo.findByBarcode('6901234567892'))?.name, '生抽');
      expect(await repo.findByBarcode('0000000000000'), isNull);
      expect(await repo.findByBarcode('  '), isNull);
    });
  });

  group('findExpiringWithin 边界', () {
    final DateTime now = DateTime(2026, 9, 11, 15, 30);

    test('恰好第 N 天命中；无到期日与已过期都排除', () async {
      await repo.create(preciseItem(name: '今天过期', expireAt: DateTime(2026, 9, 11)));
      await repo.create(preciseItem(name: '第三天', expireAt: DateTime(2026, 9, 14)));
      await repo.create(preciseItem(name: '第四天', expireAt: DateTime(2026, 9, 15)));
      await repo.create(preciseItem(name: '昨天过期', expireAt: DateTime(2026, 9, 10)));
      await repo.create(preciseItem(name: '没写到期日'));

      final List<String> names = (await repo.findExpiringWithin(3, now: now))
          .map((Item e) => e.name)
          .toList();

      expect(names, <String>['今天过期', '第三天']);
    });

    test('到期时刻带时分秒也不会漏掉最后一天', () async {
      await repo.create(
        preciseItem(name: '第三天下午', expireAt: DateTime(2026, 9, 14, 18)),
      );
      final List<Item> hits = await repo.findExpiringWithin(3, now: now);
      expect(hits.single.name, '第三天下午');
    });
  });

  group('consume 扣减（跨模块契约 3.3）', () {
    test('按份数换算扣减精确数量（默认份数 = 基准份数）', () async {
      final int recipeId = await seedRecipe(baseServings: 2);
      final int tomato = await repo.create(
        preciseItem(name: '番茄', quantity: 10, unit: '个'),
      );
      final int egg = await repo.create(
        preciseItem(name: '鸡蛋', quantity: 10, unit: '个'),
      );

      await repo.consume(recipeId);

      expect((await repo.getById(tomato))!.quantity, 8);
      expect((await repo.getById(egg))!.quantity, 7);
    });

    test('份数翻倍时扣减量翻倍', () async {
      final int recipeId = await seedRecipe(baseServings: 2);
      final int tomato = await repo.create(
        preciseItem(name: '番茄', quantity: 10, unit: '个'),
      );

      await repo.consume(recipeId, servings: 4);

      expect((await repo.getById(tomato))!.quantity, 6);
    });

    test('扣到 0 时置 isDepleted，但**不删除行**', () async {
      final int recipeId = await seedRecipe();
      final int tomato = await repo.create(
        preciseItem(name: '番茄', quantity: 2, unit: '个'),
      );

      await repo.consume(recipeId);

      final Item? after = await repo.getById(tomato);
      expect(after, isNotNull); // 置灰不删除
      expect(after!.quantity, 0);
      expect(after.isDepleted, isTrue);
    });

    test('单位不一致时只做存在性处理，不改数量', () async {
      final int recipeId = await seedRecipe();
      final int tomato = await repo.create(
        preciseItem(name: '番茄', quantity: 3, unit: '斤'),
      );

      await repo.consume(recipeId);

      expect((await repo.getById(tomato))!.quantity, 3);
      expect((await repo.getById(tomato))!.isDepleted, isFalse);
    });

    test('粗粒度模式逐次降档，见底后置 isDepleted', () async {
      final int recipeId = await seedRecipe();
      final int egg = await repo.create(
        Item(
          name: '鸡蛋',
          kind: ItemKind.ingredient,
          quantityMode: QuantityMode.granular,
          granularLevel: GranularLevel.plenty,
        ),
      );

      await repo.consume(recipeId);
      expect((await repo.getById(egg))!.granularLevel, GranularLevel.some);

      await repo.consume(recipeId);
      expect((await repo.getById(egg))!.granularLevel, GranularLevel.low);

      await repo.consume(recipeId);
      final Item after = (await repo.getById(egg))!;
      expect(after.isDepleted, isTrue);
      expect(after.granularLevel, GranularLevel.low); // 档位保留，仅置灰
    });

    test('缺失的食材静默跳过，不影响其他条目扣减', () async {
      final int recipeId = await seedRecipe();
      final int tomato = await repo.create(
        preciseItem(name: '番茄', quantity: 5, unit: '个'),
      );
      // 「鸡蛋」故意不入库

      await repo.consume(recipeId);

      expect((await repo.getById(tomato))!.quantity, 3);
    });

    test('菜式不存在时不抛异常（幂等友好）', () async {
      await repo.consume(999);
    });

    // 注意：别名映射（西红柿 = 番茄）由 W4 的 `AliasTable` 提供并注入本实现；
    // W2 的 `_normalize` 只做字符级归一（去空白 + 忽略大小写）。
    test('名称归一：忽略首尾空白与大小写差异', () async {
      final int recipeId = await seedRecipe();
      final int id = await repo.create(
        preciseItem(name: ' 鸡蛋 ', quantity: 5, unit: '个'),
      );

      await repo.consume(recipeId);

      expect((await repo.getById(id))!.quantity, 2); // 5 - 3
    });

    test('同名多条时扣最临期的一条', () async {
      final int recipeId = await seedRecipe();
      final int fresh = await repo.create(
        preciseItem(name: '番茄', quantity: 10, unit: '个', expireAt: DateTime(2026, 12, 1)),
      );
      final int urgent = await repo.create(
        preciseItem(name: '番茄', quantity: 10, unit: '个', expireAt: DateTime(2026, 9, 12)),
      );

      await repo.consume(recipeId);

      expect((await repo.getById(urgent))!.quantity, 8);
      expect((await repo.getById(fresh))!.quantity, 10);
    });
  });
}
