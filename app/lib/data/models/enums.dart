/// 领域枚举集合
///
/// 口径来源：《接口约定.md》第 2 章（W1 冻结）。
/// 说明：枚举以 `name` 字符串落库（SQLite 宽松、迁移友好），
///      变更需走《接口约定.md》的接口变更流程。
library;

/// 条目类型：食材 / 调料（构想 2.2.1 上下双分区）
enum ItemKind {
  ingredient('食材'),
  seasoning('调料');

  const ItemKind(this.label);

  final String label;
}

/// 数量展示模式（构想 2.2.2 / Q5-C：粗粒度与精确用户自选）
enum QuantityMode {
  /// 粗粒度：有 / 不多 / 快没了
  granular('粗粒度'),

  /// 精确：500g、3 个
  precise('精确');

  const QuantityMode(this.label);

  final String label;
}

/// 粗粒度档位（仅 QuantityMode.granular 生效）
enum GranularLevel {
  plenty('有'),
  some('不多'),
  low('快没了');

  const GranularLevel(this.label);

  final String label;
}

/// 存放位置（影响预置保质期建议，构想 2.2.4）
enum StorageLocation {
  fridge('冷藏'),
  freezer('冷冻'),
  room('常温');

  const StorageLocation(this.label);

  final String label;
}

/// 步骤占用资源（时序规则引擎的输入之一，构想 2.4.2）
enum StepResource {
  /// 占用灶台（同一时间只允许一个"需看火"步骤）
  stove('灶台'),

  /// 占用案板（生熟分离规则的判定依据）
  board('案板'),

  /// 手部操作（等待窗口内可并行插入的对象）
  hand('手部操作'),

  /// 等待类（炖煮、腌制、醒发；其窗口可插入其他菜的手部操作）
  waiting('等待');

  const StepResource(this.label);

  final String label;

  /// 由落库字符串还原，未知值返回 null（容错，不抛异常）
  static StepResource? parse(String name) {
    for (final StepResource value in StepResource.values) {
      if (value.name == name) return value;
    }
    return null;
  }
}

/// 步骤安全标记（时序规则引擎的输入之一，构想 2.4.2 安全规则）
enum SafetyTag {
  /// 无特殊标记
  none('无'),

  /// 处理生肉 —— 之后进入即食步骤前必须插入「清洗案板与刀具」
  rawMeat('处理生肉'),

  /// 即食食材 —— 与生肉案板步骤不得相邻
  readyToEat('即食食材'),

  /// 高温 / 明火看火步骤 —— 灶台互斥，需要提示
  highHeat('高温看火');

  const SafetyTag(this.label);

  final String label;
}

/// 菜式难度
enum Difficulty {
  easy('简单'),
  medium('中等'),
  hard('较难');

  const Difficulty(this.label);

  final String label;
}

/// 菜式来源（期1 仅官方；期2 动态上线后为用户）
enum RecipeSource {
  official('食匣官方'),
  user('用户');

  const RecipeSource(this.label);

  final String label;
}

/// 时序任务状态（构想 2.4；附录 ScheduleItem）
enum ScheduleStatus {
  pending('待排'),
  planned('已排'),
  done('完成');

  const ScheduleStatus(this.label);

  final String label;
}
