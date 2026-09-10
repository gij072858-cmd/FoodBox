import 'enums.dart';

/// 时序任务条目（领域模型）
///
/// 对应数据表 `schedule_items`。菜式模块「长按加入时序」时写入一条，
/// 时序模块读取本表生成排程结果。
class ScheduleItem {
  const ScheduleItem({
    this.id,
    required this.recipeId,
    this.addedAt,
    this.servings = 2,
    this.status = ScheduleStatus.pending,
    this.plannedFor,
  });

  final int? id;

  /// 关联菜式 id
  final int recipeId;

  /// 加入时间
  final DateTime? addedAt;

  /// 份数（F2 份量换算的输入）
  final int servings;

  /// 状态：待排 / 已排 / 完成
  final ScheduleStatus status;

  /// 计划开饭时刻（Q7-A 倒推输入；空表示「现在开始」）
  final DateTime? plannedFor;

  ScheduleItem copyWith({
    int? id,
    int? recipeId,
    DateTime? addedAt,
    int? servings,
    ScheduleStatus? status,
    DateTime? plannedFor,
  }) {
    return ScheduleItem(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      addedAt: addedAt ?? this.addedAt,
      servings: servings ?? this.servings,
      status: status ?? this.status,
      plannedFor: plannedFor ?? this.plannedFor,
    );
  }

  @override
  String toString() =>
      'ScheduleItem(recipe: $recipeId, servings: $servings, ${status.name})';
}
