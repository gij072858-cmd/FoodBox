import 'package:flutter_test/flutter_test.dart';
import 'package:foodbox/data/local/database.dart';
import 'package:foodbox/data/models/enums.dart';
import 'package:foodbox/data/models/schedule.dart';
import 'package:foodbox/data/repositories/impl/local_schedule_repository.dart';

/// 时序模块本地实现的单元测试（W2 交付物）。
///
/// 重点覆盖跨模块契约 3.2：`add` 的**幂等性** ——
/// 同一 recipeId 重复调用不得产生重复条目，且不得重置已有状态。
void main() {
  late AppDatabase db;
  late LocalScheduleRepository repo;

  setUp(() {
    db = AppDatabase.memory();
    repo = LocalScheduleRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  Future<int> seedRecipe(String name) =>
      db.into(db.recipes).insert(RecipesCompanion.insert(name: name));

  test('add 幂等：重复调用不产生重复条目，只更新份数', () async {
    final int recipeId = await seedRecipe('番茄炒蛋');

    await repo.add(recipeId);
    await repo.add(recipeId, servings: 4);

    final List<ScheduleItem> all = await repo.watchAll().first;
    expect(all, hasLength(1)); // 契约 3.2
    expect(all.single.servings, 4);
    expect(all.single.status, ScheduleStatus.pending);
  });

  test('add 重复调用不重置已有状态', () async {
    final int recipeId = await seedRecipe('番茄炒蛋');
    await repo.add(recipeId);

    final ScheduleItem first = (await repo.watchAll().first).single;
    await repo.markStatus(<int>[first.id!], ScheduleStatus.planned);

    await repo.add(recipeId, servings: 3);

    final ScheduleItem after = (await repo.watchAll().first).single;
    expect(after.status, ScheduleStatus.planned); // 没被打回 pending
    expect(after.servings, 3);
  });

  test('remove / setServings / clear', () async {
    final int a = await seedRecipe('A');
    final int b = await seedRecipe('B');
    await repo.add(a);
    await repo.add(b);

    await repo.remove(a);
    expect((await repo.watchAll().first).single.recipeId, b);

    await repo.setServings(b, 5);
    expect((await repo.watchAll().first).single.servings, 5);

    await repo.clear();
    expect(await repo.watchAll().first, isEmpty);
  });

  test('watchPending 只推待排条目', () async {
    final int a = await seedRecipe('A');
    final int b = await seedRecipe('B');
    await repo.add(a);
    await repo.add(b);

    final ScheduleItem target = (await repo.watchAll().first)
        .firstWhere((ScheduleItem e) => e.recipeId == a);
    await repo.markStatus(<int>[target.id!], ScheduleStatus.done);

    final List<ScheduleItem> pending = await repo.watchPending().first;
    expect(pending, hasLength(1));
    expect(pending.single.recipeId, b);
  });

  test('markStatus 支持批量更新', () async {
    final int a = await seedRecipe('A');
    final int b = await seedRecipe('B');
    await repo.add(a);
    await repo.add(b);

    final List<ScheduleItem> all = await repo.watchAll().first;
    await repo.markStatus(
      all.map((ScheduleItem e) => e.id!).toList(),
      ScheduleStatus.done,
    );

    expect(await repo.watchPending().first, isEmpty);
    expect((await repo.watchAll().first), hasLength(2));
  });

  test('markStatus 传空列表不报错', () async {
    await repo.markStatus(<int>[], ScheduleStatus.done);
  });

  test('setPlannedFor 作用于全部待排条目；传 null 表示「现在开始」', () async {
    final int a = await seedRecipe('A');
    final int b = await seedRecipe('B');
    await repo.add(a);
    await repo.add(b);

    final DateTime dinner = DateTime(2026, 9, 11, 19);
    await repo.setPlannedFor(dinner);
    for (final ScheduleItem e in await repo.watchAll().first) {
      expect(e.plannedFor, isNotNull);
      expect(e.plannedFor!.isAtSameMomentAs(dinner), isTrue);
    }

    await repo.setPlannedFor(null);
    for (final ScheduleItem e in await repo.watchAll().first) {
      expect(e.plannedFor, isNull);
    }
  });
}
