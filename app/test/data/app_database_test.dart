// drift 也导出了 isNull / isNotNull（SQL 表达式），与测试匹配器同名，此处隐藏
import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:foodbox/data/local/database.dart';
import 'package:foodbox/data/models/enums.dart';
import 'package:foodbox/data/models/recipe.dart';

/// 数据层建库冒烟测试（W1 交付物：六张表定义）
///
/// 目标：证明"表定义是对的、能建库、能读写、转换器工作正常"，
///      为 W2 的 CRUD 与 Repository 本地实现铺底。
void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.memory();
  });

  tearDown(() async {
    await db.close();
  });

  test('恰好六张表，表名与《接口约定.md》一致', () async {
    // 触发建库
    await db.customSelect('SELECT 1').get();

    final List<String> names = db.allTables
        .map((TableInfo<Table, dynamic> t) => t.actualTableName)
        .toList()
      ..sort();
    expect(names, <String>[
      'items',
      'profiles',
      'recipes',
      'records',
      'schedule_items',
      'steps',
    ]);
  });

  test('items：写入并读回，枚举与日期往返正确', () async {
    final DateTime expire = DateTime(2026, 9, 20);
    final int id = await db
        .into(db.items)
        .insert(
          ItemsCompanion.insert(
            name: '西红柿',
            kind: ItemKind.ingredient,
            quantityMode: const Value<QuantityMode>(QuantityMode.precise),
            quantity: const Value<double>(500),
            unit: const Value<String>('g'),
            expireAt: Value<DateTime>(expire),
            storageLocation: const Value<StorageLocation>(
              StorageLocation.fridge,
            ),
          ),
        );

    final ItemRow row = await (db.select(
      db.items,
    )..where((Items t) => t.id.equals(id))).getSingle();

    expect(row.name, '西红柿');
    expect(row.kind, ItemKind.ingredient);
    expect(row.category, '未分类'); // 列默认值
    expect(row.quantity, 500);
    expect(row.unit, 'g');
    expect(row.isCustom, isFalse);
    expect(row.expireAt, isNotNull);
    expect(row.expireAt!.isAtSameMomentAs(expire), isTrue);
  });

  test('recipes + steps：JSON 清单与资源集合转换器往返正确', () async {
    final int recipeId = await db
        .into(db.recipes)
        .insert(
          RecipesCompanion.insert(
            name: '番茄炒蛋',
            cuisine: const Value<String>('家常菜'),
            durationMinutes: const Value<int>(15),
            baseServings: const Value<int>(2),
            seasonMonths: const Value<List<int>>(<int>[6, 7, 8, 9]),
            ingredients: const Value<List<RecipeIngredient>>(<RecipeIngredient>[
              RecipeIngredient(name: '番茄', amount: 2, unit: '个'),
              RecipeIngredient(
                name: '鸡蛋',
                amount: 3,
                unit: '个',
                isSeasoning: false,
              ),
              RecipeIngredient(
                name: '盐',
                amount: 3,
                unit: 'g',
                isSeasoning: true,
              ),
            ]),
          ),
        );

    final RecipeRow recipe = await (db.select(
      db.recipes,
    )..where((Recipes t) => t.id.equals(recipeId))).getSingle();

    expect(recipe.seasonMonths, <int>[6, 7, 8, 9]);
    expect(recipe.ingredients, hasLength(3));
    expect(recipe.ingredients.first.name, '番茄');
    expect(recipe.ingredients.last.isSeasoning, isTrue);
    expect(recipe.difficulty, Difficulty.easy); // 枚举默认值
    expect(recipe.source, RecipeSource.official);

    await db
        .into(db.steps)
        .insert(
          StepsCompanion.insert(
            recipeId: recipeId,
            orderIndex: 1,
            instruction: '番茄切块，鸡蛋打散',
            durationMinutes: const Value<double>(3),
            resources: const Value<Set<StepResource>>(<StepResource>{
              StepResource.board,
              StepResource.hand,
            }),
            safetyTag: const Value<SafetyTag>(SafetyTag.readyToEat),
            photoPaths: const Value<List<String>>(<String>['a.jpg']),
          ),
        );

    final List<StepRow> steps = await db.select(db.steps).get();
    expect(steps, hasLength(1));
    expect(steps.first.resources, <StepResource>{
      StepResource.board,
      StepResource.hand,
    });
    expect(steps.first.safetyTag, SafetyTag.readyToEat);
    expect(steps.first.photoPaths, <String>['a.jpg']);
    expect(steps.first.videoPath, isNull);
  });

  test('schedule_items + records：外键关联与状态枚举正常', () async {
    final int recipeId = await db
        .into(db.recipes)
        .insert(RecipesCompanion.insert(name: '红烧鱼'));

    final int scheduleId = await db
        .into(db.scheduleItems)
        .insert(
          ScheduleItemsCompanion.insert(
            recipeId: recipeId,
            servings: const Value<int>(3),
          ),
        );

    final ScheduleItemRow scheduleItem = await (db.select(
      db.scheduleItems,
    )..where((ScheduleItems t) => t.id.equals(scheduleId))).getSingle();
    expect(scheduleItem.status, ScheduleStatus.pending); // 待排
    expect(scheduleItem.servings, 3);
    expect(scheduleItem.addedAt, isNotNull);

    await db
        .into(db.records)
        .insert(
          RecordsCompanion.insert(
            recipeId: recipeId,
            completedAt: DateTime(2026, 9, 11, 19, 30),
            note: const Value<String>('下次少放半勺盐'),
            xpGained: const Value<int>(20),
          ),
        );

    final RecordRow record = await db.select(db.records).getSingle();
    expect(record.note, '下次少放半勺盐');
    expect(record.xpGained, 20);
  });

  test('profiles：首启自动落一行默认档案（单机单用户）', () async {
    final List<ProfileRow> profiles = await db.select(db.profiles).get();

    expect(profiles, hasLength(1));
    expect(profiles.first.id, 1);
    expect(profiles.first.nickname, '食匣用户');
    expect(profiles.first.xp, 0);
    expect(profiles.first.favoriteRecipeIds, isEmpty);
    expect(profiles.first.cookedRecipeIds, isEmpty);
    expect(profiles.first.wantedRecipeIds, isEmpty);
  });

  test('stream 监听：新增库存会即时推送给订阅方', () async {
    final Stream<List<ItemRow>> stream = db.select(db.items).watch();
    final List<List<ItemRow>> emissions = <List<ItemRow>>[];
    final dynamic sub = stream.listen(emissions.add);
    await pumpEventQueue();

    await db
        .into(db.items)
        .insert(ItemsCompanion.insert(name: '鸡蛋', kind: ItemKind.ingredient));
    await pumpEventQueue();

    expect(emissions.last, hasLength(1));
    expect(emissions.last.first.name, '鸡蛋');
    await sub.cancel();
  });
}
