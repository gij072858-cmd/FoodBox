/// 做菜记录（领域模型）
///
/// 对应数据表 `records`（构想附录 Record）。
///
/// 命名说明：领域模型取名为 `CookRecord` 而非 `Record`，
/// 是为了不与 Dart 内置的 `Record` 类型重名 —— 表名与文档口径仍是 Record，
/// 该差异已记录在《接口约定.md》2.5。
class CookRecord {
  const CookRecord({
    this.id,
    required this.recipeId,
    required this.completedAt,
    this.note,
    this.xpGained = 0,
  });

  final int? id;

  /// 菜式 id
  final int recipeId;

  /// 完成时间（打卡时刻）
  final DateTime completedAt;

  /// 复盘笔记（F14：「我做过」条目下的一句话心得）
  final String? note;

  /// 本次结算获得的经验值（构想 2.6 XP 方案）
  final int xpGained;

  CookRecord copyWith({
    int? id,
    int? recipeId,
    DateTime? completedAt,
    String? note,
    int? xpGained,
  }) {
    return CookRecord(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      completedAt: completedAt ?? this.completedAt,
      note: note ?? this.note,
      xpGained: xpGained ?? this.xpGained,
    );
  }

  @override
  String toString() => 'CookRecord(recipe: $recipeId, at: $completedAt)';
}
