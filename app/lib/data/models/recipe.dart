import 'enums.dart';

/// 菜式配方中的一行「食材 / 调料」
///
/// 存储方式：随 Recipe 以 JSON 数组落库（详见《接口约定.md》2.2 决策说明）。
/// 之所以不单独建表：W1 冻结的六张表口径（Item / Recipe / Step / ScheduleItem /
/// Record / Profile）不含配方明细表；30–50 道菜式的规模下，
/// 集合匹配（`RecipeMatcher.match`）一次性读取 JSON 即可，无需 JOIN。
class RecipeIngredient {
  const RecipeIngredient({
    required this.name,
    this.amount,
    this.unit,
    this.isRequired = true,
    this.isSeasoning = false,
  });

  /// 食材 / 调料名称（匹配前须经别名表归一，见 `RecipeMatcher`）
  final String name;

  /// 用量（按 baseServings 基准）
  final double? amount;

  /// 单位
  final String? unit;

  /// 是否必需：非必需项缺失不影响「可做」判定（Q6-A 阈值 ≤2 只看必需项）
  final bool isRequired;

  /// 是否属于调料清单（构想 2.3.2 食材与调料分两列展示）
  final bool isSeasoning;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': name,
    'amount': amount,
    'unit': unit,
    'isRequired': isRequired,
    'isSeasoning': isSeasoning,
  };

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) {
    return RecipeIngredient(
      name: (json['name'] ?? '').toString(),
      amount: (json['amount'] as num?)?.toDouble(),
      unit: json['unit']?.toString(),
      isRequired: json['isRequired'] as bool? ?? true,
      isSeasoning: json['isSeasoning'] as bool? ?? false,
    );
  }

  /// 用量文案（份量换算后调用，F2）
  String label({int? servings, int baseServings = 2}) {
    if (amount == null) return name;
    double value = amount!;
    if (servings != null && baseServings > 0) {
      value = value * servings / baseServings;
    }
    final String shown = value == value.roundToDouble()
        ? value.round().toString()
        : value.toStringAsFixed(1);
    return unit == null ? '$name $shown' : '$name $shown$unit';
  }

  @override
  String toString() => '$name${amount == null ? '' : ' $amount'}${unit ?? ''}';
}

/// 菜式（领域模型）
class Recipe {
  const Recipe({
    this.id,
    required this.name,
    this.coverImagePath,
    this.cuisine,
    this.mainCategory,
    this.durationMinutes,
    this.difficulty = Difficulty.easy,
    this.baseServings = 2,
    this.seasonMonths = const <int>[],
    this.ingredients = const <RecipeIngredient>[],
    this.intro,
    this.source = RecipeSource.official,
    this.sharerName,
    this.sharedAt,
    this.createdAt,
  });

  final int? id;

  /// 菜名
  final String name;

  /// 成品封面图路径
  final String? coverImagePath;

  /// 菜系（粤菜 / 川菜 / 家常菜 …）
  final String? cuisine;

  /// 主食材分类（海鲜 / 鸡肉 / 蔬菜 …）
  final String? mainCategory;

  /// 总耗时（分钟）
  final int? durationMinutes;

  final Difficulty difficulty;

  /// 份量基准（配方用量的基准人数，默认 2）
  final int baseServings;

  /// 适宜月份标签（1–12；F12 时令推荐数据源）
  final List<int> seasonMonths;

  /// 食材清单（含调料，用 isSeasoning 区分）
  final List<RecipeIngredient> ingredients;

  /// 菜式简介（一行截断展示用）
  final String? intro;

  final RecipeSource source;

  /// 分享者昵称（期1 恒为「食匣官方」；期2 动态上线后为真实用户）
  final String? sharerName;

  final DateTime? sharedAt;
  final DateTime? createdAt;

  /// 属性胶囊行文案，如「25 分钟 · 中等 · 家常菜」
  String get attributeLine {
    final List<String> parts = <String>[
      if (durationMinutes != null) '$durationMinutes 分钟',
      difficulty.label,
      if (cuisine != null && cuisine!.isNotEmpty) cuisine!,
    ];
    return parts.join(' · ');
  }

  /// 仅食材（不含调料）—— 推荐算法与「缺失食材」区使用
  List<RecipeIngredient> get foodIngredients =>
      ingredients.where((RecipeIngredient e) => !e.isSeasoning).toList();

  /// 仅调料
  List<RecipeIngredient> get seasonings =>
      ingredients.where((RecipeIngredient e) => e.isSeasoning).toList();

  Recipe copyWith({
    int? id,
    String? name,
    String? coverImagePath,
    String? cuisine,
    String? mainCategory,
    int? durationMinutes,
    Difficulty? difficulty,
    int? baseServings,
    List<int>? seasonMonths,
    List<RecipeIngredient>? ingredients,
    String? intro,
    RecipeSource? source,
    String? sharerName,
    DateTime? sharedAt,
    DateTime? createdAt,
  }) {
    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      coverImagePath: coverImagePath ?? this.coverImagePath,
      cuisine: cuisine ?? this.cuisine,
      mainCategory: mainCategory ?? this.mainCategory,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      difficulty: difficulty ?? this.difficulty,
      baseServings: baseServings ?? this.baseServings,
      seasonMonths: seasonMonths ?? this.seasonMonths,
      ingredients: ingredients ?? this.ingredients,
      intro: intro ?? this.intro,
      source: source ?? this.source,
      sharerName: sharerName ?? this.sharerName,
      sharedAt: sharedAt ?? this.sharedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() => 'Recipe(id: $id, name: $name)';
}

/// 菜式步骤（领域模型）
///
/// 对应数据表 `steps`。字段是时序规则引擎（构想 2.4.2）的输入基础：
/// 耗时 / 占用资源 / 安全标记 三项标注不全，引擎就无法正确排程。
class Step {
  const Step({
    this.id,
    this.recipeId,
    required this.orderIndex,
    required this.instruction,
    this.durationMinutes = 0,
    this.resources = const <StepResource>{},
    this.safetyTag = SafetyTag.none,
    this.photoPaths = const <String>[],
    this.videoPath,
    this.note,
  });

  final int? id;
  final int? recipeId;

  /// 序号（从 1 开始）
  final int orderIndex;

  /// 大字指令文字（18–20px Bold，一句话操作指令）
  final String instruction;

  /// 标准耗时（分钟；支持 0.5 等小数）
  final double durationMinutes;

  /// 占用资源集合
  final Set<StepResource> resources;

  /// 安全标记
  final SafetyTag safetyTag;

  /// 步骤照片流（可为空 —— 无图步骤 UI 优雅降级，Q14-C）
  final List<String> photoPaths;

  /// 步骤短视频路径（期1 允许为空）
  final String? videoPath;

  final String? note;

  /// 是否等待类步骤（引擎在等待窗口内插入其他菜的手部操作）
  bool get isWaiting => resources.contains(StepResource.waiting);

  /// 是否占用灶台
  bool get usesStove => resources.contains(StepResource.stove);

  Step copyWith({
    int? id,
    int? recipeId,
    int? orderIndex,
    String? instruction,
    double? durationMinutes,
    Set<StepResource>? resources,
    SafetyTag? safetyTag,
    List<String>? photoPaths,
    String? videoPath,
    String? note,
  }) {
    return Step(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      orderIndex: orderIndex ?? this.orderIndex,
      instruction: instruction ?? this.instruction,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      resources: resources ?? this.resources,
      safetyTag: safetyTag ?? this.safetyTag,
      photoPaths: photoPaths ?? this.photoPaths,
      videoPath: videoPath ?? this.videoPath,
      note: note ?? this.note,
    );
  }

  @override
  String toString() => 'Step($orderIndex, $instruction, $durationMinutes min)';
}
