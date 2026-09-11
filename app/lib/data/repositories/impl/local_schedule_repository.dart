import 'package:drift/drift.dart';

import '../../local/database.dart';
import '../../local/mappers.dart';
import '../../models/enums.dart';
import '../../models/schedule.dart';
import '../schedule_repository.dart';

/// 时序待做清单的本地 Drift 实现。
class LocalScheduleRepository implements ScheduleRepository {
  LocalScheduleRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<ScheduleItem>> watchPending() {
    return (_db.select(_db.scheduleItems)
          ..where((t) =>
              t.status.equalsValue(ScheduleStatus.pending))
          ..orderBy(<OrderClauseGenerator<$ScheduleItemsTable>>[
            (t) => OrderingTerm.asc(t.addedAt),
          ]))
        .watch()
        .map(_toItems);
  }

  @override
  Stream<List<ScheduleItem>> watchAll() {
    return (_db.select(_db.scheduleItems)
          ..orderBy(<OrderClauseGenerator<$ScheduleItemsTable>>[
            (t) => OrderingTerm.asc(t.addedAt),
          ]))
        .watch()
        .map(_toItems);
  }

  /// 【跨模块契约 3.2】长按加入时序 —— **幂等**。
  ///
  /// 同一 `recipeId` 重复调用不产生重复条目：已存在时只更新份数，
  /// **不重置已有状态**（已排程的条目不会被打回 pending）。
  @override
  Future<void> add(int recipeId, {int servings = 2}) {
    return _db.transaction(() async {
      final ScheduleItemRow? existing = await (_db.select(_db.scheduleItems)
            ..where((t) => t.recipeId.equals(recipeId)))
          .getSingleOrNull();

      if (existing != null) {
        await (_db.update(_db.scheduleItems)
              ..where((t) => t.id.equals(existing.id)))
            .write(
          ScheduleItemsCompanion(servings: Value<int>(servings)),
        );
        return;
      }

      await _db.into(_db.scheduleItems).insert(
            ScheduleItemsCompanion.insert(
              recipeId: recipeId,
              servings: Value<int>(servings),
            ),
          );
    });
  }

  @override
  Future<void> remove(int recipeId) async {
    await (_db.delete(_db.scheduleItems)
          ..where((t) => t.recipeId.equals(recipeId)))
        .go();
  }

  @override
  Future<void> setServings(int recipeId, int servings) async {
    await (_db.update(_db.scheduleItems)
          ..where((t) => t.recipeId.equals(recipeId)))
        .write(ScheduleItemsCompanion(servings: Value<int>(servings)));
  }

  /// 设置计划开饭时刻（Q7-A 倒推输入）。
  ///
  /// 接口签名不带 `recipeId` —— 一次排程共用同一个开饭时刻，
  /// 因此作用于**全部待排条目**；传 null 表示「现在开始」。
  @override
  Future<void> setPlannedFor(DateTime? plannedFor) async {
    await (_db.update(_db.scheduleItems)
          ..where((t) =>
              t.status.equalsValue(ScheduleStatus.pending)))
        .write(
      ScheduleItemsCompanion(plannedFor: Value<DateTime?>(plannedFor)),
    );
  }

  @override
  Future<void> markStatus(
    List<int> scheduleItemIds,
    ScheduleStatus status,
  ) async {
    if (scheduleItemIds.isEmpty) return;
    await (_db.update(_db.scheduleItems)
          ..where((t) => t.id.isIn(scheduleItemIds)))
        .write(ScheduleItemsCompanion(status: Value<ScheduleStatus>(status)));
  }

  @override
  Future<void> clear() async {
    await _db.delete(_db.scheduleItems).go();
  }

  List<ScheduleItem> _toItems(List<ScheduleItemRow> rows) =>
      rows.map((ScheduleItemRow row) => row.toDomain()).toList();
}
