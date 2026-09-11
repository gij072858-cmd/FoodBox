import 'package:flutter_test/flutter_test.dart';
import 'package:foodbox/data/local/database.dart';
import 'package:foodbox/data/models/enums.dart';
import 'package:foodbox/data/models/recipe.dart';
import 'package:foodbox/data/repositories/impl/local_recipe_repository.dart';

/// 菜式模块本地实现的单元测试（W2 交付物）。
///
/// 重点覆盖：`createWithSteps` 的事务性与 orderIndex 对齐、
/// `replaceSteps` 的覆盖语义、`delete` 的连带清理，以及三种查询。
void main() {
  late AppDatabase db;
  late LocalRecipeRepository repo;

  setUp(() {
    db = AppDatabase.memory();
    repo = LocalRecipeRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  Step step(int order, String text, {double minutes = 1}) => Step(
        orderIndex: order,
        instruction: text,
        durationMinutes: minutes,
        resources: const <StepResource>{StepResource.hand},
      );

  test('createWithSteps：事务内建菜 + 写步骤，orderIndex 按入参顺序重排', () async {
    final int id = await repo.createWithSteps(
      Recipe(name: '番茄炒蛋', cuisine: '家常菜', durationMinutes: 15),
      <Step>[
        step(9, '切番茄', minutes: 3), // 故意传错的序号
        step(9, '打蛋'),
        step(9, '炒制', minutes: 5),
      ],
    );

    final List<Step> steps = await repo.stepsOf(id);
    expect(steps, hasLength(3));
    expect(steps.map((Step e) => e.orderIndex), <int>[1, 2, 3]);
    expect(steps.first.instruction, '切番茄');
    expect((await repo.getById(id))!.name, '番茄炒蛋');
  });

  test('createWithSteps：步骤为空也不报错', () async {
    final int id = await repo.createWithSteps(Recipe(name: '凉拌黄瓜'), <Step>[]);
    expect(await repo.stepsOf(id), isEmpty);
  });

  test('replaceSteps：覆盖式保存，旧步骤被清掉', () async {
    final int id = await repo.createWithSteps(
      Recipe(name: 'A'),
      <Step>[step(1, '一'), step(2, '二')],
    );

    await repo.replaceSteps(id, <Step>[step(1, '新一', minutes: 2)]);

    final List<Step> steps = await repo.stepsOf(id);
    expect(steps, hasLength(1));
    expect(steps.single.instruction, '新一');
    expect(steps.single.durationMinutes, 2);
    expect(steps.single.recipeId, id);
  });

  test('replaceSteps：传入带 id 的旧步骤也不会与自增主键冲突', () async {
    final int id = await repo.createWithSteps(
      Recipe(name: 'A'),
      <Step>[step(1, '一')],
    );
    final List<Step> loaded = await repo.stepsOf(id); // 带数据库 id

    await repo.replaceSteps(id, loaded);

    final List<Step> steps = await repo.stepsOf(id);
    expect(steps, hasLength(1));
    expect(steps.single.instruction, '一');
  });

  test('delete：连带清理步骤，不留孤儿行', () async {
    final int id = await repo.createWithSteps(
      Recipe(name: 'A'),
      <Step>[step(1, '一'), step(2, '二')],
    );

    await repo.delete(id);

    expect(await repo.getById(id), isNull);
    expect(await db.select(db.steps).get(), isEmpty);
  });

  test('update：缺 id 时抛 ArgumentError', () async {
    await expectLater(repo.update(const Recipe(name: 'X')), throwsArgumentError);
  });

  test('update：修改菜式本体不影响其步骤', () async {
    final int id = await repo.createWithSteps(
      Recipe(name: 'A'),
      <Step>[step(1, '一')],
    );

    await repo.update((await repo.getById(id))!.copyWith(name: '改名了'));

    expect((await repo.getById(id))!.name, '改名了');
    expect(await repo.stepsOf(id), hasLength(1));
  });

  test('byMainCategory / bySeasonMonth / search / watchAll', () async {
    await repo.createWithSteps(
      Recipe(
        name: '番茄炒蛋',
        mainCategory: '蔬菜',
        cuisine: '家常菜',
        seasonMonths: <int>[6, 7],
      ),
      <Step>[step(1, '一')],
    );
    await repo.createWithSteps(
      Recipe(name: '红烧肉', mainCategory: '猪肉', seasonMonths: <int>[11, 12]),
      <Step>[step(1, '一')],
    );

    expect((await repo.byMainCategory('蔬菜')).single.name, '番茄炒蛋');
    expect(await repo.byMainCategory('不存在的分类'), isEmpty);

    expect((await repo.bySeasonMonth(6)).single.name, '番茄炒蛋');
    expect(await repo.bySeasonMonth(3), isEmpty); // 没有菜标注 3 月

    expect((await repo.search('红')).single.name, '红烧肉');
    expect((await repo.search('家常菜')).single.name, '番茄炒蛋'); // 命中菜系
    expect(await repo.search('  '), hasLength(2)); // 空白 = 全量

    expect(await repo.watchAll().first, hasLength(2));
  });

  test('watchStepsOf 按 orderIndex 升序推送', () async {
    final int id = await repo.createWithSteps(
      Recipe(name: 'A'),
      <Step>[step(1, '一'), step(2, '二'), step(3, '三')],
    );

    final List<Step> steps = await repo.watchStepsOf(id).first;
    expect(steps.map((Step e) => e.orderIndex), <int>[1, 2, 3]);
  });
}
