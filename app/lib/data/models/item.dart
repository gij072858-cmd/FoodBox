import 'enums.dart';

/// 食材 / 调料条目（领域模型）
///
/// 纪律：**领域模型不得依赖 Drift / Flutter**。
///      数据表行（ItemRow）↔ 本模型 的转换在 `data/local/mappers.dart` 中完成，
///      这样期2 的 Supabase 云端实现可以直接复用本模型，不动上层页面。
///
/// 字段口径：构想附录「数据模型草案」+ 《接口约定.md》2.1。
class Item {
  const Item({
    this.id,
    required this.name,
    this.category = '未分类',
    required this.kind,
    this.quantityMode = QuantityMode.granular,
    this.quantity,
    this.unit,
    this.granularLevel,
    this.storedAt,
    this.shelfLifeDays,
    this.expireAt,
    this.storageLocation = StorageLocation.fridge,
    this.opened,
    this.barcode,
    this.imagePath,
    this.introWhat,
    this.introHow,
    this.introStore,
    this.introTip,
    this.isCustom = false,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  /// 主键；null 表示尚未入库
  final int? id;

  /// 名称
  final String name;

  /// 分类（如 蔬菜 / 禽肉 / 调味汁）
  final String category;

  /// 食材 / 调料
  final ItemKind kind;

  /// 数量展示模式（Q5-C）
  final QuantityMode quantityMode;

  /// 精确数量；仅 precise 模式有意义
  final double? quantity;

  /// 单位（g / ml / 个 / 瓶 …）
  final String? unit;

  /// 粗粒度档位；仅 granular 模式有意义
  final GranularLevel? granularLevel;

  /// 入库日期
  final DateTime? storedAt;

  /// 预置保质期天数（由基础库带出，可改）
  final int? shelfLifeDays;

  /// 到期日（入库日期 + 保质期天数，按存放位置校正）
  final DateTime? expireAt;

  /// 存放位置
  final StorageLocation storageLocation;

  /// 开封状态（调料专用，可空）
  final bool? opened;

  /// 商品条形码（扫码录入自学习映射的结果，构想 2.2.5）
  final String? barcode;

  /// 图片路径（真实高清图优先，AI 兜底；资源目录可整体替换）
  final String? imagePath;

  /// 简介四段（统一模板，构想 2.2.4）
  final String? introWhat; // 【是什么】
  final String? introHow; // 【怎么用】
  final String? introStore; // 【怎么存】
  final String? introTip; // 【小贴士】

  /// 是否用户自建条目（预置库判定用）
  final bool isCustom;

  /// 备注
  final String? note;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// 剩余天数：卡片主显示属性（Q1-B / Q2-B）。
  /// 无到期日时返回 null；负数表示已过期。
  int? remainingDays({DateTime? now}) {
    final DateTime? expire = expireAt;
    if (expire == null) return null;
    final DateTime today = now ?? DateTime.now();
    final DateTime a = DateTime(expire.year, expire.month, expire.day);
    final DateTime b = DateTime(today.year, today.month, today.day);
    return a.difference(b).inDays;
  }

  /// 是否临期（≤3 天且未过期）—— 构想 1.3 预警色口径
  bool isNearingExpiry({DateTime? now}) {
    final int? left = remainingDays(now: now);
    return left != null && left >= 0 && left <= 3;
  }

  /// 是否已过期
  bool isExpired({DateTime? now}) {
    final int? left = remainingDays(now: now);
    return left != null && left < 0;
  }

  /// 数量的人类可读文案（卡片属性行用，构想 2.2.2）
  String get quantityLabel {
    if (quantityMode == QuantityMode.granular) {
      return granularLevel?.label ?? '—';
    }
    if (quantity == null) return '—';
    final String value = quantity == quantity!.roundToDouble()
        ? quantity!.round().toString()
        : quantity!.toString();
    return unit == null ? value : '$value${unit!}';
  }

  Item copyWith({
    int? id,
    String? name,
    String? category,
    ItemKind? kind,
    QuantityMode? quantityMode,
    double? quantity,
    String? unit,
    GranularLevel? granularLevel,
    DateTime? storedAt,
    int? shelfLifeDays,
    DateTime? expireAt,
    StorageLocation? storageLocation,
    bool? opened,
    String? barcode,
    String? imagePath,
    String? introWhat,
    String? introHow,
    String? introStore,
    String? introTip,
    bool? isCustom,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      kind: kind ?? this.kind,
      quantityMode: quantityMode ?? this.quantityMode,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      granularLevel: granularLevel ?? this.granularLevel,
      storedAt: storedAt ?? this.storedAt,
      shelfLifeDays: shelfLifeDays ?? this.shelfLifeDays,
      expireAt: expireAt ?? this.expireAt,
      storageLocation: storageLocation ?? this.storageLocation,
      opened: opened ?? this.opened,
      barcode: barcode ?? this.barcode,
      imagePath: imagePath ?? this.imagePath,
      introWhat: introWhat ?? this.introWhat,
      introHow: introHow ?? this.introHow,
      introStore: introStore ?? this.introStore,
      introTip: introTip ?? this.introTip,
      isCustom: isCustom ?? this.isCustom,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() => 'Item(id: $id, name: $name, kind: ${kind.name})';
}
