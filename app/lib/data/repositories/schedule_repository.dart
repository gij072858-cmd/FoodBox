import '../models/enums.dart';
import '../models/schedule.dart';

/// 时序数据访问接口
///
/// 实现：`impl/local_schedule_repository.dart`（W2）。
abstract interface class ScheduleRepository {
  /// 待做清单流（时序页第一态）
  Stream<List<ScheduleItem>> watchPending();

  Stream<List<ScheduleItem>> watchAll();

  /// 【跨模块契约】菜式模块「长按加入时序」只调这一个方法，
  /// 不关心时序内部实现（构想 2.3.4 / 总计划第七章）。
  ///
  /// 幂等约定：同一 recipeId 重复调用不得产生重复条目，
  /// 已存在时视为更新份数。详见《接口约定.md》3.2。
  Future<void> add(int recipeId, {int servings = 2});

  /// 取消加入（长按浮层再次点击「✓」）
  Future<void> remove(int recipeId);

  Future<void> setServings(int recipeId, int servings);

  /// 设置计划开饭时刻（Q7-A 倒推输入；传 null 表示「现在开始」）
  Future<void> setPlannedFor(DateTime? plannedFor);

  /// 批量更新状态（引擎排完程写回 planned；执行完毕写 done）
  Future<void> markStatus(List<int> scheduleItemIds, ScheduleStatus status);

  /// 清空时序清单
  Future<void> clear();
}
