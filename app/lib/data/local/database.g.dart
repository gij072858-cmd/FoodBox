// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ItemsTable extends Items with TableInfo<$ItemsTable, ItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 60,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('未分类'),
  );
  @override
  late final GeneratedColumnWithTypeConverter<ItemKind, String> kind =
      GeneratedColumn<String>(
        'kind',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ItemKind>($ItemsTable.$converterkind);
  @override
  late final GeneratedColumnWithTypeConverter<QuantityMode, String>
  quantityMode = GeneratedColumn<String>(
    'quantity_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('granular'),
  ).withConverter<QuantityMode>($ItemsTable.$converterquantityMode);
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<GranularLevel?, String>
  granularLevel = GeneratedColumn<String>(
    'granular_level',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<GranularLevel?>($ItemsTable.$convertergranularLeveln);
  static const VerificationMeta _storedAtMeta = const VerificationMeta(
    'storedAt',
  );
  @override
  late final GeneratedColumn<DateTime> storedAt = GeneratedColumn<DateTime>(
    'stored_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shelfLifeDaysMeta = const VerificationMeta(
    'shelfLifeDays',
  );
  @override
  late final GeneratedColumn<int> shelfLifeDays = GeneratedColumn<int>(
    'shelf_life_days',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expireAtMeta = const VerificationMeta(
    'expireAt',
  );
  @override
  late final GeneratedColumn<DateTime> expireAt = GeneratedColumn<DateTime>(
    'expire_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<StorageLocation, String>
  storageLocation = GeneratedColumn<String>(
    'storage_location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('fridge'),
  ).withConverter<StorageLocation>($ItemsTable.$converterstorageLocation);
  static const VerificationMeta _openedMeta = const VerificationMeta('opened');
  @override
  late final GeneratedColumn<bool> opened = GeneratedColumn<bool>(
    'opened',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("opened" IN (0, 1))',
    ),
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _introWhatMeta = const VerificationMeta(
    'introWhat',
  );
  @override
  late final GeneratedColumn<String> introWhat = GeneratedColumn<String>(
    'intro_what',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _introHowMeta = const VerificationMeta(
    'introHow',
  );
  @override
  late final GeneratedColumn<String> introHow = GeneratedColumn<String>(
    'intro_how',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _introStoreMeta = const VerificationMeta(
    'introStore',
  );
  @override
  late final GeneratedColumn<String> introStore = GeneratedColumn<String>(
    'intro_store',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _introTipMeta = const VerificationMeta(
    'introTip',
  );
  @override
  late final GeneratedColumn<String> introTip = GeneratedColumn<String>(
    'intro_tip',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isDepletedMeta = const VerificationMeta(
    'isDepleted',
  );
  @override
  late final GeneratedColumn<bool> isDepleted = GeneratedColumn<bool>(
    'is_depleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_depleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    kind,
    quantityMode,
    quantity,
    unit,
    granularLevel,
    storedAt,
    shelfLifeDays,
    expireAt,
    storageLocation,
    opened,
    barcode,
    imagePath,
    introWhat,
    introHow,
    introStore,
    introTip,
    isCustom,
    isDepleted,
    note,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('stored_at')) {
      context.handle(
        _storedAtMeta,
        storedAt.isAcceptableOrUnknown(data['stored_at']!, _storedAtMeta),
      );
    }
    if (data.containsKey('shelf_life_days')) {
      context.handle(
        _shelfLifeDaysMeta,
        shelfLifeDays.isAcceptableOrUnknown(
          data['shelf_life_days']!,
          _shelfLifeDaysMeta,
        ),
      );
    }
    if (data.containsKey('expire_at')) {
      context.handle(
        _expireAtMeta,
        expireAt.isAcceptableOrUnknown(data['expire_at']!, _expireAtMeta),
      );
    }
    if (data.containsKey('opened')) {
      context.handle(
        _openedMeta,
        opened.isAcceptableOrUnknown(data['opened']!, _openedMeta),
      );
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('intro_what')) {
      context.handle(
        _introWhatMeta,
        introWhat.isAcceptableOrUnknown(data['intro_what']!, _introWhatMeta),
      );
    }
    if (data.containsKey('intro_how')) {
      context.handle(
        _introHowMeta,
        introHow.isAcceptableOrUnknown(data['intro_how']!, _introHowMeta),
      );
    }
    if (data.containsKey('intro_store')) {
      context.handle(
        _introStoreMeta,
        introStore.isAcceptableOrUnknown(data['intro_store']!, _introStoreMeta),
      );
    }
    if (data.containsKey('intro_tip')) {
      context.handle(
        _introTipMeta,
        introTip.isAcceptableOrUnknown(data['intro_tip']!, _introTipMeta),
      );
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    }
    if (data.containsKey('is_depleted')) {
      context.handle(
        _isDepletedMeta,
        isDepleted.isAcceptableOrUnknown(data['is_depleted']!, _isDepletedMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      kind: $ItemsTable.$converterkind.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}kind'],
        )!,
      ),
      quantityMode: $ItemsTable.$converterquantityMode.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}quantity_mode'],
        )!,
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      ),
      granularLevel: $ItemsTable.$convertergranularLeveln.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}granular_level'],
        ),
      ),
      storedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}stored_at'],
      ),
      shelfLifeDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shelf_life_days'],
      ),
      expireAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expire_at'],
      ),
      storageLocation: $ItemsTable.$converterstorageLocation.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}storage_location'],
        )!,
      ),
      opened: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}opened'],
      ),
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      ),
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      introWhat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intro_what'],
      ),
      introHow: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intro_how'],
      ),
      introStore: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intro_store'],
      ),
      introTip: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intro_tip'],
      ),
      isCustom: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_custom'],
      )!,
      isDepleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_depleted'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ItemKind, String, String> $converterkind =
      const EnumNameConverter<ItemKind>(ItemKind.values);
  static JsonTypeConverter2<QuantityMode, String, String>
  $converterquantityMode = const EnumNameConverter<QuantityMode>(
    QuantityMode.values,
  );
  static JsonTypeConverter2<GranularLevel, String, String>
  $convertergranularLevel = const EnumNameConverter<GranularLevel>(
    GranularLevel.values,
  );
  static JsonTypeConverter2<GranularLevel?, String?, String?>
  $convertergranularLeveln = JsonTypeConverter2.asNullable(
    $convertergranularLevel,
  );
  static JsonTypeConverter2<StorageLocation, String, String>
  $converterstorageLocation = const EnumNameConverter<StorageLocation>(
    StorageLocation.values,
  );
}

class ItemRow extends DataClass implements Insertable<ItemRow> {
  final int id;
  final String name;

  /// 分类（蔬菜 / 禽肉 / 调味汁 …）
  final String category;

  /// 食材 / 调料（构想 2.2.1 上下双分区）
  final ItemKind kind;

  /// 数量展示模式（Q5-C 用户自选）
  final QuantityMode quantityMode;

  /// 精确数量（precise 模式）
  final double? quantity;

  /// 单位
  final String? unit;

  /// 粗粒度档位（granular 模式）
  final GranularLevel? granularLevel;

  /// 入库日期
  final DateTime? storedAt;

  /// 预置保质期天数
  final int? shelfLifeDays;

  /// 到期日
  final DateTime? expireAt;

  /// 存放位置（冷藏 / 冷冻 / 常温）
  final StorageLocation storageLocation;

  /// 开封状态（调料专用）
  final bool? opened;

  /// 商品条形码（扫码自学习映射）
  final String? barcode;

  /// 图片路径
  final String? imagePath;

  /// 简介四段
  final String? introWhat;
  final String? introHow;
  final String? introStore;
  final String? introTip;

  /// 是否用户自建
  final bool isCustom;

  /// 库存已用完（v1.1 新增，见《接口约定.md》3.3）
  ///
  /// 数量扣减至 0 时置 true —— 条目**置灰保留而不删除**，
  /// 由页面提示「已用完，是否移出库 / 加入购物清单」。
  final bool isDepleted;
  final String? note;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ItemRow({
    required this.id,
    required this.name,
    required this.category,
    required this.kind,
    required this.quantityMode,
    this.quantity,
    this.unit,
    this.granularLevel,
    this.storedAt,
    this.shelfLifeDays,
    this.expireAt,
    required this.storageLocation,
    this.opened,
    this.barcode,
    this.imagePath,
    this.introWhat,
    this.introHow,
    this.introStore,
    this.introTip,
    required this.isCustom,
    required this.isDepleted,
    this.note,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    {
      map['kind'] = Variable<String>($ItemsTable.$converterkind.toSql(kind));
    }
    {
      map['quantity_mode'] = Variable<String>(
        $ItemsTable.$converterquantityMode.toSql(quantityMode),
      );
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || granularLevel != null) {
      map['granular_level'] = Variable<String>(
        $ItemsTable.$convertergranularLeveln.toSql(granularLevel),
      );
    }
    if (!nullToAbsent || storedAt != null) {
      map['stored_at'] = Variable<DateTime>(storedAt);
    }
    if (!nullToAbsent || shelfLifeDays != null) {
      map['shelf_life_days'] = Variable<int>(shelfLifeDays);
    }
    if (!nullToAbsent || expireAt != null) {
      map['expire_at'] = Variable<DateTime>(expireAt);
    }
    {
      map['storage_location'] = Variable<String>(
        $ItemsTable.$converterstorageLocation.toSql(storageLocation),
      );
    }
    if (!nullToAbsent || opened != null) {
      map['opened'] = Variable<bool>(opened);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || introWhat != null) {
      map['intro_what'] = Variable<String>(introWhat);
    }
    if (!nullToAbsent || introHow != null) {
      map['intro_how'] = Variable<String>(introHow);
    }
    if (!nullToAbsent || introStore != null) {
      map['intro_store'] = Variable<String>(introStore);
    }
    if (!nullToAbsent || introTip != null) {
      map['intro_tip'] = Variable<String>(introTip);
    }
    map['is_custom'] = Variable<bool>(isCustom);
    map['is_depleted'] = Variable<bool>(isDepleted);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      kind: Value(kind),
      quantityMode: Value(quantityMode),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      granularLevel: granularLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(granularLevel),
      storedAt: storedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(storedAt),
      shelfLifeDays: shelfLifeDays == null && nullToAbsent
          ? const Value.absent()
          : Value(shelfLifeDays),
      expireAt: expireAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expireAt),
      storageLocation: Value(storageLocation),
      opened: opened == null && nullToAbsent
          ? const Value.absent()
          : Value(opened),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      introWhat: introWhat == null && nullToAbsent
          ? const Value.absent()
          : Value(introWhat),
      introHow: introHow == null && nullToAbsent
          ? const Value.absent()
          : Value(introHow),
      introStore: introStore == null && nullToAbsent
          ? const Value.absent()
          : Value(introStore),
      introTip: introTip == null && nullToAbsent
          ? const Value.absent()
          : Value(introTip),
      isCustom: Value(isCustom),
      isDepleted: Value(isDepleted),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      kind: $ItemsTable.$converterkind.fromJson(
        serializer.fromJson<String>(json['kind']),
      ),
      quantityMode: $ItemsTable.$converterquantityMode.fromJson(
        serializer.fromJson<String>(json['quantityMode']),
      ),
      quantity: serializer.fromJson<double?>(json['quantity']),
      unit: serializer.fromJson<String?>(json['unit']),
      granularLevel: $ItemsTable.$convertergranularLeveln.fromJson(
        serializer.fromJson<String?>(json['granularLevel']),
      ),
      storedAt: serializer.fromJson<DateTime?>(json['storedAt']),
      shelfLifeDays: serializer.fromJson<int?>(json['shelfLifeDays']),
      expireAt: serializer.fromJson<DateTime?>(json['expireAt']),
      storageLocation: $ItemsTable.$converterstorageLocation.fromJson(
        serializer.fromJson<String>(json['storageLocation']),
      ),
      opened: serializer.fromJson<bool?>(json['opened']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      introWhat: serializer.fromJson<String?>(json['introWhat']),
      introHow: serializer.fromJson<String?>(json['introHow']),
      introStore: serializer.fromJson<String?>(json['introStore']),
      introTip: serializer.fromJson<String?>(json['introTip']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
      isDepleted: serializer.fromJson<bool>(json['isDepleted']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'kind': serializer.toJson<String>(
        $ItemsTable.$converterkind.toJson(kind),
      ),
      'quantityMode': serializer.toJson<String>(
        $ItemsTable.$converterquantityMode.toJson(quantityMode),
      ),
      'quantity': serializer.toJson<double?>(quantity),
      'unit': serializer.toJson<String?>(unit),
      'granularLevel': serializer.toJson<String?>(
        $ItemsTable.$convertergranularLeveln.toJson(granularLevel),
      ),
      'storedAt': serializer.toJson<DateTime?>(storedAt),
      'shelfLifeDays': serializer.toJson<int?>(shelfLifeDays),
      'expireAt': serializer.toJson<DateTime?>(expireAt),
      'storageLocation': serializer.toJson<String>(
        $ItemsTable.$converterstorageLocation.toJson(storageLocation),
      ),
      'opened': serializer.toJson<bool?>(opened),
      'barcode': serializer.toJson<String?>(barcode),
      'imagePath': serializer.toJson<String?>(imagePath),
      'introWhat': serializer.toJson<String?>(introWhat),
      'introHow': serializer.toJson<String?>(introHow),
      'introStore': serializer.toJson<String?>(introStore),
      'introTip': serializer.toJson<String?>(introTip),
      'isCustom': serializer.toJson<bool>(isCustom),
      'isDepleted': serializer.toJson<bool>(isDepleted),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ItemRow copyWith({
    int? id,
    String? name,
    String? category,
    ItemKind? kind,
    QuantityMode? quantityMode,
    Value<double?> quantity = const Value.absent(),
    Value<String?> unit = const Value.absent(),
    Value<GranularLevel?> granularLevel = const Value.absent(),
    Value<DateTime?> storedAt = const Value.absent(),
    Value<int?> shelfLifeDays = const Value.absent(),
    Value<DateTime?> expireAt = const Value.absent(),
    StorageLocation? storageLocation,
    Value<bool?> opened = const Value.absent(),
    Value<String?> barcode = const Value.absent(),
    Value<String?> imagePath = const Value.absent(),
    Value<String?> introWhat = const Value.absent(),
    Value<String?> introHow = const Value.absent(),
    Value<String?> introStore = const Value.absent(),
    Value<String?> introTip = const Value.absent(),
    bool? isCustom,
    bool? isDepleted,
    Value<String?> note = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ItemRow(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    kind: kind ?? this.kind,
    quantityMode: quantityMode ?? this.quantityMode,
    quantity: quantity.present ? quantity.value : this.quantity,
    unit: unit.present ? unit.value : this.unit,
    granularLevel: granularLevel.present
        ? granularLevel.value
        : this.granularLevel,
    storedAt: storedAt.present ? storedAt.value : this.storedAt,
    shelfLifeDays: shelfLifeDays.present
        ? shelfLifeDays.value
        : this.shelfLifeDays,
    expireAt: expireAt.present ? expireAt.value : this.expireAt,
    storageLocation: storageLocation ?? this.storageLocation,
    opened: opened.present ? opened.value : this.opened,
    barcode: barcode.present ? barcode.value : this.barcode,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    introWhat: introWhat.present ? introWhat.value : this.introWhat,
    introHow: introHow.present ? introHow.value : this.introHow,
    introStore: introStore.present ? introStore.value : this.introStore,
    introTip: introTip.present ? introTip.value : this.introTip,
    isCustom: isCustom ?? this.isCustom,
    isDepleted: isDepleted ?? this.isDepleted,
    note: note.present ? note.value : this.note,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ItemRow copyWithCompanion(ItemsCompanion data) {
    return ItemRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      kind: data.kind.present ? data.kind.value : this.kind,
      quantityMode: data.quantityMode.present
          ? data.quantityMode.value
          : this.quantityMode,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unit: data.unit.present ? data.unit.value : this.unit,
      granularLevel: data.granularLevel.present
          ? data.granularLevel.value
          : this.granularLevel,
      storedAt: data.storedAt.present ? data.storedAt.value : this.storedAt,
      shelfLifeDays: data.shelfLifeDays.present
          ? data.shelfLifeDays.value
          : this.shelfLifeDays,
      expireAt: data.expireAt.present ? data.expireAt.value : this.expireAt,
      storageLocation: data.storageLocation.present
          ? data.storageLocation.value
          : this.storageLocation,
      opened: data.opened.present ? data.opened.value : this.opened,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      introWhat: data.introWhat.present ? data.introWhat.value : this.introWhat,
      introHow: data.introHow.present ? data.introHow.value : this.introHow,
      introStore: data.introStore.present
          ? data.introStore.value
          : this.introStore,
      introTip: data.introTip.present ? data.introTip.value : this.introTip,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
      isDepleted: data.isDepleted.present
          ? data.isDepleted.value
          : this.isDepleted,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('kind: $kind, ')
          ..write('quantityMode: $quantityMode, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('granularLevel: $granularLevel, ')
          ..write('storedAt: $storedAt, ')
          ..write('shelfLifeDays: $shelfLifeDays, ')
          ..write('expireAt: $expireAt, ')
          ..write('storageLocation: $storageLocation, ')
          ..write('opened: $opened, ')
          ..write('barcode: $barcode, ')
          ..write('imagePath: $imagePath, ')
          ..write('introWhat: $introWhat, ')
          ..write('introHow: $introHow, ')
          ..write('introStore: $introStore, ')
          ..write('introTip: $introTip, ')
          ..write('isCustom: $isCustom, ')
          ..write('isDepleted: $isDepleted, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    category,
    kind,
    quantityMode,
    quantity,
    unit,
    granularLevel,
    storedAt,
    shelfLifeDays,
    expireAt,
    storageLocation,
    opened,
    barcode,
    imagePath,
    introWhat,
    introHow,
    introStore,
    introTip,
    isCustom,
    isDepleted,
    note,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.kind == this.kind &&
          other.quantityMode == this.quantityMode &&
          other.quantity == this.quantity &&
          other.unit == this.unit &&
          other.granularLevel == this.granularLevel &&
          other.storedAt == this.storedAt &&
          other.shelfLifeDays == this.shelfLifeDays &&
          other.expireAt == this.expireAt &&
          other.storageLocation == this.storageLocation &&
          other.opened == this.opened &&
          other.barcode == this.barcode &&
          other.imagePath == this.imagePath &&
          other.introWhat == this.introWhat &&
          other.introHow == this.introHow &&
          other.introStore == this.introStore &&
          other.introTip == this.introTip &&
          other.isCustom == this.isCustom &&
          other.isDepleted == this.isDepleted &&
          other.note == this.note &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ItemsCompanion extends UpdateCompanion<ItemRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> category;
  final Value<ItemKind> kind;
  final Value<QuantityMode> quantityMode;
  final Value<double?> quantity;
  final Value<String?> unit;
  final Value<GranularLevel?> granularLevel;
  final Value<DateTime?> storedAt;
  final Value<int?> shelfLifeDays;
  final Value<DateTime?> expireAt;
  final Value<StorageLocation> storageLocation;
  final Value<bool?> opened;
  final Value<String?> barcode;
  final Value<String?> imagePath;
  final Value<String?> introWhat;
  final Value<String?> introHow;
  final Value<String?> introStore;
  final Value<String?> introTip;
  final Value<bool> isCustom;
  final Value<bool> isDepleted;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.kind = const Value.absent(),
    this.quantityMode = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.granularLevel = const Value.absent(),
    this.storedAt = const Value.absent(),
    this.shelfLifeDays = const Value.absent(),
    this.expireAt = const Value.absent(),
    this.storageLocation = const Value.absent(),
    this.opened = const Value.absent(),
    this.barcode = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.introWhat = const Value.absent(),
    this.introHow = const Value.absent(),
    this.introStore = const Value.absent(),
    this.introTip = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.isDepleted = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.category = const Value.absent(),
    required ItemKind kind,
    this.quantityMode = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
    this.granularLevel = const Value.absent(),
    this.storedAt = const Value.absent(),
    this.shelfLifeDays = const Value.absent(),
    this.expireAt = const Value.absent(),
    this.storageLocation = const Value.absent(),
    this.opened = const Value.absent(),
    this.barcode = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.introWhat = const Value.absent(),
    this.introHow = const Value.absent(),
    this.introStore = const Value.absent(),
    this.introTip = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.isDepleted = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       kind = Value(kind);
  static Insertable<ItemRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? kind,
    Expression<String>? quantityMode,
    Expression<double>? quantity,
    Expression<String>? unit,
    Expression<String>? granularLevel,
    Expression<DateTime>? storedAt,
    Expression<int>? shelfLifeDays,
    Expression<DateTime>? expireAt,
    Expression<String>? storageLocation,
    Expression<bool>? opened,
    Expression<String>? barcode,
    Expression<String>? imagePath,
    Expression<String>? introWhat,
    Expression<String>? introHow,
    Expression<String>? introStore,
    Expression<String>? introTip,
    Expression<bool>? isCustom,
    Expression<bool>? isDepleted,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (kind != null) 'kind': kind,
      if (quantityMode != null) 'quantity_mode': quantityMode,
      if (quantity != null) 'quantity': quantity,
      if (unit != null) 'unit': unit,
      if (granularLevel != null) 'granular_level': granularLevel,
      if (storedAt != null) 'stored_at': storedAt,
      if (shelfLifeDays != null) 'shelf_life_days': shelfLifeDays,
      if (expireAt != null) 'expire_at': expireAt,
      if (storageLocation != null) 'storage_location': storageLocation,
      if (opened != null) 'opened': opened,
      if (barcode != null) 'barcode': barcode,
      if (imagePath != null) 'image_path': imagePath,
      if (introWhat != null) 'intro_what': introWhat,
      if (introHow != null) 'intro_how': introHow,
      if (introStore != null) 'intro_store': introStore,
      if (introTip != null) 'intro_tip': introTip,
      if (isCustom != null) 'is_custom': isCustom,
      if (isDepleted != null) 'is_depleted': isDepleted,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? category,
    Value<ItemKind>? kind,
    Value<QuantityMode>? quantityMode,
    Value<double?>? quantity,
    Value<String?>? unit,
    Value<GranularLevel?>? granularLevel,
    Value<DateTime?>? storedAt,
    Value<int?>? shelfLifeDays,
    Value<DateTime?>? expireAt,
    Value<StorageLocation>? storageLocation,
    Value<bool?>? opened,
    Value<String?>? barcode,
    Value<String?>? imagePath,
    Value<String?>? introWhat,
    Value<String?>? introHow,
    Value<String?>? introStore,
    Value<String?>? introTip,
    Value<bool>? isCustom,
    Value<bool>? isDepleted,
    Value<String?>? note,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return ItemsCompanion(
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
      isDepleted: isDepleted ?? this.isDepleted,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(
        $ItemsTable.$converterkind.toSql(kind.value),
      );
    }
    if (quantityMode.present) {
      map['quantity_mode'] = Variable<String>(
        $ItemsTable.$converterquantityMode.toSql(quantityMode.value),
      );
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (granularLevel.present) {
      map['granular_level'] = Variable<String>(
        $ItemsTable.$convertergranularLeveln.toSql(granularLevel.value),
      );
    }
    if (storedAt.present) {
      map['stored_at'] = Variable<DateTime>(storedAt.value);
    }
    if (shelfLifeDays.present) {
      map['shelf_life_days'] = Variable<int>(shelfLifeDays.value);
    }
    if (expireAt.present) {
      map['expire_at'] = Variable<DateTime>(expireAt.value);
    }
    if (storageLocation.present) {
      map['storage_location'] = Variable<String>(
        $ItemsTable.$converterstorageLocation.toSql(storageLocation.value),
      );
    }
    if (opened.present) {
      map['opened'] = Variable<bool>(opened.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (introWhat.present) {
      map['intro_what'] = Variable<String>(introWhat.value);
    }
    if (introHow.present) {
      map['intro_how'] = Variable<String>(introHow.value);
    }
    if (introStore.present) {
      map['intro_store'] = Variable<String>(introStore.value);
    }
    if (introTip.present) {
      map['intro_tip'] = Variable<String>(introTip.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (isDepleted.present) {
      map['is_depleted'] = Variable<bool>(isDepleted.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('kind: $kind, ')
          ..write('quantityMode: $quantityMode, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit, ')
          ..write('granularLevel: $granularLevel, ')
          ..write('storedAt: $storedAt, ')
          ..write('shelfLifeDays: $shelfLifeDays, ')
          ..write('expireAt: $expireAt, ')
          ..write('storageLocation: $storageLocation, ')
          ..write('opened: $opened, ')
          ..write('barcode: $barcode, ')
          ..write('imagePath: $imagePath, ')
          ..write('introWhat: $introWhat, ')
          ..write('introHow: $introHow, ')
          ..write('introStore: $introStore, ')
          ..write('introTip: $introTip, ')
          ..write('isCustom: $isCustom, ')
          ..write('isDepleted: $isDepleted, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $RecipesTable extends Recipes with TableInfo<$RecipesTable, RecipeRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 60,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _coverImagePathMeta = const VerificationMeta(
    'coverImagePath',
  );
  @override
  late final GeneratedColumn<String> coverImagePath = GeneratedColumn<String>(
    'cover_image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cuisineMeta = const VerificationMeta(
    'cuisine',
  );
  @override
  late final GeneratedColumn<String> cuisine = GeneratedColumn<String>(
    'cuisine',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mainCategoryMeta = const VerificationMeta(
    'mainCategory',
  );
  @override
  late final GeneratedColumn<String> mainCategory = GeneratedColumn<String>(
    'main_category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Difficulty, String> difficulty =
      GeneratedColumn<String>(
        'difficulty',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('easy'),
      ).withConverter<Difficulty>($RecipesTable.$converterdifficulty);
  static const VerificationMeta _baseServingsMeta = const VerificationMeta(
    'baseServings',
  );
  @override
  late final GeneratedColumn<int> baseServings = GeneratedColumn<int>(
    'base_servings',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(2),
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String> seasonMonths =
      GeneratedColumn<String>(
        'season_months',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('[]'),
      ).withConverter<List<int>>($RecipesTable.$converterseasonMonths);
  @override
  late final GeneratedColumnWithTypeConverter<List<RecipeIngredient>, String>
  ingredients = GeneratedColumn<String>(
    'ingredients',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  ).withConverter<List<RecipeIngredient>>($RecipesTable.$converteringredients);
  static const VerificationMeta _introMeta = const VerificationMeta('intro');
  @override
  late final GeneratedColumn<String> intro = GeneratedColumn<String>(
    'intro',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<RecipeSource, String> source =
      GeneratedColumn<String>(
        'source',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('official'),
      ).withConverter<RecipeSource>($RecipesTable.$convertersource);
  static const VerificationMeta _sharerNameMeta = const VerificationMeta(
    'sharerName',
  );
  @override
  late final GeneratedColumn<String> sharerName = GeneratedColumn<String>(
    'sharer_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sharedAtMeta = const VerificationMeta(
    'sharedAt',
  );
  @override
  late final GeneratedColumn<DateTime> sharedAt = GeneratedColumn<DateTime>(
    'shared_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    coverImagePath,
    cuisine,
    mainCategory,
    durationMinutes,
    difficulty,
    baseServings,
    seasonMonths,
    ingredients,
    intro,
    source,
    sharerName,
    sharedAt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('cover_image_path')) {
      context.handle(
        _coverImagePathMeta,
        coverImagePath.isAcceptableOrUnknown(
          data['cover_image_path']!,
          _coverImagePathMeta,
        ),
      );
    }
    if (data.containsKey('cuisine')) {
      context.handle(
        _cuisineMeta,
        cuisine.isAcceptableOrUnknown(data['cuisine']!, _cuisineMeta),
      );
    }
    if (data.containsKey('main_category')) {
      context.handle(
        _mainCategoryMeta,
        mainCategory.isAcceptableOrUnknown(
          data['main_category']!,
          _mainCategoryMeta,
        ),
      );
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('base_servings')) {
      context.handle(
        _baseServingsMeta,
        baseServings.isAcceptableOrUnknown(
          data['base_servings']!,
          _baseServingsMeta,
        ),
      );
    }
    if (data.containsKey('intro')) {
      context.handle(
        _introMeta,
        intro.isAcceptableOrUnknown(data['intro']!, _introMeta),
      );
    }
    if (data.containsKey('sharer_name')) {
      context.handle(
        _sharerNameMeta,
        sharerName.isAcceptableOrUnknown(data['sharer_name']!, _sharerNameMeta),
      );
    }
    if (data.containsKey('shared_at')) {
      context.handle(
        _sharedAtMeta,
        sharedAt.isAcceptableOrUnknown(data['shared_at']!, _sharedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      coverImagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_image_path'],
      ),
      cuisine: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cuisine'],
      ),
      mainCategory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}main_category'],
      ),
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      ),
      difficulty: $RecipesTable.$converterdifficulty.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}difficulty'],
        )!,
      ),
      baseServings: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_servings'],
      )!,
      seasonMonths: $RecipesTable.$converterseasonMonths.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}season_months'],
        )!,
      ),
      ingredients: $RecipesTable.$converteringredients.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ingredients'],
        )!,
      ),
      intro: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intro'],
      ),
      source: $RecipesTable.$convertersource.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}source'],
        )!,
      ),
      sharerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sharer_name'],
      ),
      sharedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}shared_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Difficulty, String, String> $converterdifficulty =
      const EnumNameConverter<Difficulty>(Difficulty.values);
  static TypeConverter<List<int>, String> $converterseasonMonths =
      const IntListConverter();
  static TypeConverter<List<RecipeIngredient>, String> $converteringredients =
      const RecipeIngredientListConverter();
  static JsonTypeConverter2<RecipeSource, String, String> $convertersource =
      const EnumNameConverter<RecipeSource>(RecipeSource.values);
}

class RecipeRow extends DataClass implements Insertable<RecipeRow> {
  final int id;
  final String name;
  final String? coverImagePath;

  /// 菜系（粤菜 / 川菜 / 家常菜 …）
  final String? cuisine;

  /// 主食材分类（海鲜 / 鸡肉 / 蔬菜 …）
  final String? mainCategory;

  /// 总耗时（分钟）
  final int? durationMinutes;
  final Difficulty difficulty;

  /// 份量基准（配方用量的基准人数）
  final int baseServings;

  /// 适宜月份标签 1–12（F12 时令推荐）
  final List<int> seasonMonths;

  /// 食材 + 调料清单（JSON 数组，见《接口约定.md》2.2）
  final List<RecipeIngredient> ingredients;

  /// 一行简介
  final String? intro;

  /// 来源：官方 / 用户
  final RecipeSource source;

  /// 分享者昵称
  final String? sharerName;
  final DateTime? sharedAt;
  final DateTime createdAt;
  const RecipeRow({
    required this.id,
    required this.name,
    this.coverImagePath,
    this.cuisine,
    this.mainCategory,
    this.durationMinutes,
    required this.difficulty,
    required this.baseServings,
    required this.seasonMonths,
    required this.ingredients,
    this.intro,
    required this.source,
    this.sharerName,
    this.sharedAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || coverImagePath != null) {
      map['cover_image_path'] = Variable<String>(coverImagePath);
    }
    if (!nullToAbsent || cuisine != null) {
      map['cuisine'] = Variable<String>(cuisine);
    }
    if (!nullToAbsent || mainCategory != null) {
      map['main_category'] = Variable<String>(mainCategory);
    }
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int>(durationMinutes);
    }
    {
      map['difficulty'] = Variable<String>(
        $RecipesTable.$converterdifficulty.toSql(difficulty),
      );
    }
    map['base_servings'] = Variable<int>(baseServings);
    {
      map['season_months'] = Variable<String>(
        $RecipesTable.$converterseasonMonths.toSql(seasonMonths),
      );
    }
    {
      map['ingredients'] = Variable<String>(
        $RecipesTable.$converteringredients.toSql(ingredients),
      );
    }
    if (!nullToAbsent || intro != null) {
      map['intro'] = Variable<String>(intro);
    }
    {
      map['source'] = Variable<String>(
        $RecipesTable.$convertersource.toSql(source),
      );
    }
    if (!nullToAbsent || sharerName != null) {
      map['sharer_name'] = Variable<String>(sharerName);
    }
    if (!nullToAbsent || sharedAt != null) {
      map['shared_at'] = Variable<DateTime>(sharedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: Value(id),
      name: Value(name),
      coverImagePath: coverImagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImagePath),
      cuisine: cuisine == null && nullToAbsent
          ? const Value.absent()
          : Value(cuisine),
      mainCategory: mainCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(mainCategory),
      durationMinutes: durationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMinutes),
      difficulty: Value(difficulty),
      baseServings: Value(baseServings),
      seasonMonths: Value(seasonMonths),
      ingredients: Value(ingredients),
      intro: intro == null && nullToAbsent
          ? const Value.absent()
          : Value(intro),
      source: Value(source),
      sharerName: sharerName == null && nullToAbsent
          ? const Value.absent()
          : Value(sharerName),
      sharedAt: sharedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(sharedAt),
      createdAt: Value(createdAt),
    );
  }

  factory RecipeRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      coverImagePath: serializer.fromJson<String?>(json['coverImagePath']),
      cuisine: serializer.fromJson<String?>(json['cuisine']),
      mainCategory: serializer.fromJson<String?>(json['mainCategory']),
      durationMinutes: serializer.fromJson<int?>(json['durationMinutes']),
      difficulty: $RecipesTable.$converterdifficulty.fromJson(
        serializer.fromJson<String>(json['difficulty']),
      ),
      baseServings: serializer.fromJson<int>(json['baseServings']),
      seasonMonths: serializer.fromJson<List<int>>(json['seasonMonths']),
      ingredients: serializer.fromJson<List<RecipeIngredient>>(
        json['ingredients'],
      ),
      intro: serializer.fromJson<String?>(json['intro']),
      source: $RecipesTable.$convertersource.fromJson(
        serializer.fromJson<String>(json['source']),
      ),
      sharerName: serializer.fromJson<String?>(json['sharerName']),
      sharedAt: serializer.fromJson<DateTime?>(json['sharedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'coverImagePath': serializer.toJson<String?>(coverImagePath),
      'cuisine': serializer.toJson<String?>(cuisine),
      'mainCategory': serializer.toJson<String?>(mainCategory),
      'durationMinutes': serializer.toJson<int?>(durationMinutes),
      'difficulty': serializer.toJson<String>(
        $RecipesTable.$converterdifficulty.toJson(difficulty),
      ),
      'baseServings': serializer.toJson<int>(baseServings),
      'seasonMonths': serializer.toJson<List<int>>(seasonMonths),
      'ingredients': serializer.toJson<List<RecipeIngredient>>(ingredients),
      'intro': serializer.toJson<String?>(intro),
      'source': serializer.toJson<String>(
        $RecipesTable.$convertersource.toJson(source),
      ),
      'sharerName': serializer.toJson<String?>(sharerName),
      'sharedAt': serializer.toJson<DateTime?>(sharedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RecipeRow copyWith({
    int? id,
    String? name,
    Value<String?> coverImagePath = const Value.absent(),
    Value<String?> cuisine = const Value.absent(),
    Value<String?> mainCategory = const Value.absent(),
    Value<int?> durationMinutes = const Value.absent(),
    Difficulty? difficulty,
    int? baseServings,
    List<int>? seasonMonths,
    List<RecipeIngredient>? ingredients,
    Value<String?> intro = const Value.absent(),
    RecipeSource? source,
    Value<String?> sharerName = const Value.absent(),
    Value<DateTime?> sharedAt = const Value.absent(),
    DateTime? createdAt,
  }) => RecipeRow(
    id: id ?? this.id,
    name: name ?? this.name,
    coverImagePath: coverImagePath.present
        ? coverImagePath.value
        : this.coverImagePath,
    cuisine: cuisine.present ? cuisine.value : this.cuisine,
    mainCategory: mainCategory.present ? mainCategory.value : this.mainCategory,
    durationMinutes: durationMinutes.present
        ? durationMinutes.value
        : this.durationMinutes,
    difficulty: difficulty ?? this.difficulty,
    baseServings: baseServings ?? this.baseServings,
    seasonMonths: seasonMonths ?? this.seasonMonths,
    ingredients: ingredients ?? this.ingredients,
    intro: intro.present ? intro.value : this.intro,
    source: source ?? this.source,
    sharerName: sharerName.present ? sharerName.value : this.sharerName,
    sharedAt: sharedAt.present ? sharedAt.value : this.sharedAt,
    createdAt: createdAt ?? this.createdAt,
  );
  RecipeRow copyWithCompanion(RecipesCompanion data) {
    return RecipeRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      coverImagePath: data.coverImagePath.present
          ? data.coverImagePath.value
          : this.coverImagePath,
      cuisine: data.cuisine.present ? data.cuisine.value : this.cuisine,
      mainCategory: data.mainCategory.present
          ? data.mainCategory.value
          : this.mainCategory,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      baseServings: data.baseServings.present
          ? data.baseServings.value
          : this.baseServings,
      seasonMonths: data.seasonMonths.present
          ? data.seasonMonths.value
          : this.seasonMonths,
      ingredients: data.ingredients.present
          ? data.ingredients.value
          : this.ingredients,
      intro: data.intro.present ? data.intro.value : this.intro,
      source: data.source.present ? data.source.value : this.source,
      sharerName: data.sharerName.present
          ? data.sharerName.value
          : this.sharerName,
      sharedAt: data.sharedAt.present ? data.sharedAt.value : this.sharedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('coverImagePath: $coverImagePath, ')
          ..write('cuisine: $cuisine, ')
          ..write('mainCategory: $mainCategory, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('difficulty: $difficulty, ')
          ..write('baseServings: $baseServings, ')
          ..write('seasonMonths: $seasonMonths, ')
          ..write('ingredients: $ingredients, ')
          ..write('intro: $intro, ')
          ..write('source: $source, ')
          ..write('sharerName: $sharerName, ')
          ..write('sharedAt: $sharedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    coverImagePath,
    cuisine,
    mainCategory,
    durationMinutes,
    difficulty,
    baseServings,
    seasonMonths,
    ingredients,
    intro,
    source,
    sharerName,
    sharedAt,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.coverImagePath == this.coverImagePath &&
          other.cuisine == this.cuisine &&
          other.mainCategory == this.mainCategory &&
          other.durationMinutes == this.durationMinutes &&
          other.difficulty == this.difficulty &&
          other.baseServings == this.baseServings &&
          other.seasonMonths == this.seasonMonths &&
          other.ingredients == this.ingredients &&
          other.intro == this.intro &&
          other.source == this.source &&
          other.sharerName == this.sharerName &&
          other.sharedAt == this.sharedAt &&
          other.createdAt == this.createdAt);
}

class RecipesCompanion extends UpdateCompanion<RecipeRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> coverImagePath;
  final Value<String?> cuisine;
  final Value<String?> mainCategory;
  final Value<int?> durationMinutes;
  final Value<Difficulty> difficulty;
  final Value<int> baseServings;
  final Value<List<int>> seasonMonths;
  final Value<List<RecipeIngredient>> ingredients;
  final Value<String?> intro;
  final Value<RecipeSource> source;
  final Value<String?> sharerName;
  final Value<DateTime?> sharedAt;
  final Value<DateTime> createdAt;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.coverImagePath = const Value.absent(),
    this.cuisine = const Value.absent(),
    this.mainCategory = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.baseServings = const Value.absent(),
    this.seasonMonths = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.intro = const Value.absent(),
    this.source = const Value.absent(),
    this.sharerName = const Value.absent(),
    this.sharedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RecipesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.coverImagePath = const Value.absent(),
    this.cuisine = const Value.absent(),
    this.mainCategory = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.baseServings = const Value.absent(),
    this.seasonMonths = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.intro = const Value.absent(),
    this.source = const Value.absent(),
    this.sharerName = const Value.absent(),
    this.sharedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<RecipeRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? coverImagePath,
    Expression<String>? cuisine,
    Expression<String>? mainCategory,
    Expression<int>? durationMinutes,
    Expression<String>? difficulty,
    Expression<int>? baseServings,
    Expression<String>? seasonMonths,
    Expression<String>? ingredients,
    Expression<String>? intro,
    Expression<String>? source,
    Expression<String>? sharerName,
    Expression<DateTime>? sharedAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (coverImagePath != null) 'cover_image_path': coverImagePath,
      if (cuisine != null) 'cuisine': cuisine,
      if (mainCategory != null) 'main_category': mainCategory,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (difficulty != null) 'difficulty': difficulty,
      if (baseServings != null) 'base_servings': baseServings,
      if (seasonMonths != null) 'season_months': seasonMonths,
      if (ingredients != null) 'ingredients': ingredients,
      if (intro != null) 'intro': intro,
      if (source != null) 'source': source,
      if (sharerName != null) 'sharer_name': sharerName,
      if (sharedAt != null) 'shared_at': sharedAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RecipesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? coverImagePath,
    Value<String?>? cuisine,
    Value<String?>? mainCategory,
    Value<int?>? durationMinutes,
    Value<Difficulty>? difficulty,
    Value<int>? baseServings,
    Value<List<int>>? seasonMonths,
    Value<List<RecipeIngredient>>? ingredients,
    Value<String?>? intro,
    Value<RecipeSource>? source,
    Value<String?>? sharerName,
    Value<DateTime?>? sharedAt,
    Value<DateTime>? createdAt,
  }) {
    return RecipesCompanion(
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (coverImagePath.present) {
      map['cover_image_path'] = Variable<String>(coverImagePath.value);
    }
    if (cuisine.present) {
      map['cuisine'] = Variable<String>(cuisine.value);
    }
    if (mainCategory.present) {
      map['main_category'] = Variable<String>(mainCategory.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(
        $RecipesTable.$converterdifficulty.toSql(difficulty.value),
      );
    }
    if (baseServings.present) {
      map['base_servings'] = Variable<int>(baseServings.value);
    }
    if (seasonMonths.present) {
      map['season_months'] = Variable<String>(
        $RecipesTable.$converterseasonMonths.toSql(seasonMonths.value),
      );
    }
    if (ingredients.present) {
      map['ingredients'] = Variable<String>(
        $RecipesTable.$converteringredients.toSql(ingredients.value),
      );
    }
    if (intro.present) {
      map['intro'] = Variable<String>(intro.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(
        $RecipesTable.$convertersource.toSql(source.value),
      );
    }
    if (sharerName.present) {
      map['sharer_name'] = Variable<String>(sharerName.value);
    }
    if (sharedAt.present) {
      map['shared_at'] = Variable<DateTime>(sharedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('coverImagePath: $coverImagePath, ')
          ..write('cuisine: $cuisine, ')
          ..write('mainCategory: $mainCategory, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('difficulty: $difficulty, ')
          ..write('baseServings: $baseServings, ')
          ..write('seasonMonths: $seasonMonths, ')
          ..write('ingredients: $ingredients, ')
          ..write('intro: $intro, ')
          ..write('source: $source, ')
          ..write('sharerName: $sharerName, ')
          ..write('sharedAt: $sharedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $StepsTable extends Steps with TableInfo<$StepsTable, StepRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StepsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id)',
    ),
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _instructionMeta = const VerificationMeta(
    'instruction',
  );
  @override
  late final GeneratedColumn<String> instruction = GeneratedColumn<String>(
    'instruction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<double> durationMinutes = GeneratedColumn<double>(
    'duration_minutes',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Set<StepResource>, String>
  resources = GeneratedColumn<String>(
    'resources',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  ).withConverter<Set<StepResource>>($StepsTable.$converterresources);
  @override
  late final GeneratedColumnWithTypeConverter<SafetyTag, String> safetyTag =
      GeneratedColumn<String>(
        'safety_tag',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('none'),
      ).withConverter<SafetyTag>($StepsTable.$convertersafetyTag);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> photoPaths =
      GeneratedColumn<String>(
        'photo_paths',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('[]'),
      ).withConverter<List<String>>($StepsTable.$converterphotoPaths);
  static const VerificationMeta _videoPathMeta = const VerificationMeta(
    'videoPath',
  );
  @override
  late final GeneratedColumn<String> videoPath = GeneratedColumn<String>(
    'video_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recipeId,
    orderIndex,
    instruction,
    durationMinutes,
    resources,
    safetyTag,
    photoPaths,
    videoPath,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'steps';
  @override
  VerificationContext validateIntegrity(
    Insertable<StepRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    if (data.containsKey('instruction')) {
      context.handle(
        _instructionMeta,
        instruction.isAcceptableOrUnknown(
          data['instruction']!,
          _instructionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_instructionMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('video_path')) {
      context.handle(
        _videoPathMeta,
        videoPath.isAcceptableOrUnknown(data['video_path']!, _videoPathMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StepRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StepRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_id'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      instruction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instruction'],
      )!,
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}duration_minutes'],
      )!,
      resources: $StepsTable.$converterresources.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}resources'],
        )!,
      ),
      safetyTag: $StepsTable.$convertersafetyTag.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}safety_tag'],
        )!,
      ),
      photoPaths: $StepsTable.$converterphotoPaths.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}photo_paths'],
        )!,
      ),
      videoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}video_path'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $StepsTable createAlias(String alias) {
    return $StepsTable(attachedDatabase, alias);
  }

  static TypeConverter<Set<StepResource>, String> $converterresources =
      const StepResourceSetConverter();
  static JsonTypeConverter2<SafetyTag, String, String> $convertersafetyTag =
      const EnumNameConverter<SafetyTag>(SafetyTag.values);
  static TypeConverter<List<String>, String> $converterphotoPaths =
      const StringListConverter();
}

class StepRow extends DataClass implements Insertable<StepRow> {
  final int id;
  final int recipeId;

  /// 序号（从 1 开始）
  final int orderIndex;

  /// 大字指令文字
  final String instruction;

  /// 标准耗时（分钟，支持小数）
  final double durationMinutes;

  /// 占用资源集合（灶台 / 案板 / 手部操作 / 等待）
  final Set<StepResource> resources;

  /// 安全标记
  final SafetyTag safetyTag;

  /// 步骤照片流（允许为空）
  final List<String> photoPaths;
  final String? videoPath;
  final String? note;
  const StepRow({
    required this.id,
    required this.recipeId,
    required this.orderIndex,
    required this.instruction,
    required this.durationMinutes,
    required this.resources,
    required this.safetyTag,
    required this.photoPaths,
    this.videoPath,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipe_id'] = Variable<int>(recipeId);
    map['order_index'] = Variable<int>(orderIndex);
    map['instruction'] = Variable<String>(instruction);
    map['duration_minutes'] = Variable<double>(durationMinutes);
    {
      map['resources'] = Variable<String>(
        $StepsTable.$converterresources.toSql(resources),
      );
    }
    {
      map['safety_tag'] = Variable<String>(
        $StepsTable.$convertersafetyTag.toSql(safetyTag),
      );
    }
    {
      map['photo_paths'] = Variable<String>(
        $StepsTable.$converterphotoPaths.toSql(photoPaths),
      );
    }
    if (!nullToAbsent || videoPath != null) {
      map['video_path'] = Variable<String>(videoPath);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  StepsCompanion toCompanion(bool nullToAbsent) {
    return StepsCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      orderIndex: Value(orderIndex),
      instruction: Value(instruction),
      durationMinutes: Value(durationMinutes),
      resources: Value(resources),
      safetyTag: Value(safetyTag),
      photoPaths: Value(photoPaths),
      videoPath: videoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(videoPath),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory StepRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StepRow(
      id: serializer.fromJson<int>(json['id']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      instruction: serializer.fromJson<String>(json['instruction']),
      durationMinutes: serializer.fromJson<double>(json['durationMinutes']),
      resources: serializer.fromJson<Set<StepResource>>(json['resources']),
      safetyTag: $StepsTable.$convertersafetyTag.fromJson(
        serializer.fromJson<String>(json['safetyTag']),
      ),
      photoPaths: serializer.fromJson<List<String>>(json['photoPaths']),
      videoPath: serializer.fromJson<String?>(json['videoPath']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipeId': serializer.toJson<int>(recipeId),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'instruction': serializer.toJson<String>(instruction),
      'durationMinutes': serializer.toJson<double>(durationMinutes),
      'resources': serializer.toJson<Set<StepResource>>(resources),
      'safetyTag': serializer.toJson<String>(
        $StepsTable.$convertersafetyTag.toJson(safetyTag),
      ),
      'photoPaths': serializer.toJson<List<String>>(photoPaths),
      'videoPath': serializer.toJson<String?>(videoPath),
      'note': serializer.toJson<String?>(note),
    };
  }

  StepRow copyWith({
    int? id,
    int? recipeId,
    int? orderIndex,
    String? instruction,
    double? durationMinutes,
    Set<StepResource>? resources,
    SafetyTag? safetyTag,
    List<String>? photoPaths,
    Value<String?> videoPath = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => StepRow(
    id: id ?? this.id,
    recipeId: recipeId ?? this.recipeId,
    orderIndex: orderIndex ?? this.orderIndex,
    instruction: instruction ?? this.instruction,
    durationMinutes: durationMinutes ?? this.durationMinutes,
    resources: resources ?? this.resources,
    safetyTag: safetyTag ?? this.safetyTag,
    photoPaths: photoPaths ?? this.photoPaths,
    videoPath: videoPath.present ? videoPath.value : this.videoPath,
    note: note.present ? note.value : this.note,
  );
  StepRow copyWithCompanion(StepsCompanion data) {
    return StepRow(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      instruction: data.instruction.present
          ? data.instruction.value
          : this.instruction,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      resources: data.resources.present ? data.resources.value : this.resources,
      safetyTag: data.safetyTag.present ? data.safetyTag.value : this.safetyTag,
      photoPaths: data.photoPaths.present
          ? data.photoPaths.value
          : this.photoPaths,
      videoPath: data.videoPath.present ? data.videoPath.value : this.videoPath,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StepRow(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('instruction: $instruction, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('resources: $resources, ')
          ..write('safetyTag: $safetyTag, ')
          ..write('photoPaths: $photoPaths, ')
          ..write('videoPath: $videoPath, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    recipeId,
    orderIndex,
    instruction,
    durationMinutes,
    resources,
    safetyTag,
    photoPaths,
    videoPath,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StepRow &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.orderIndex == this.orderIndex &&
          other.instruction == this.instruction &&
          other.durationMinutes == this.durationMinutes &&
          other.resources == this.resources &&
          other.safetyTag == this.safetyTag &&
          other.photoPaths == this.photoPaths &&
          other.videoPath == this.videoPath &&
          other.note == this.note);
}

class StepsCompanion extends UpdateCompanion<StepRow> {
  final Value<int> id;
  final Value<int> recipeId;
  final Value<int> orderIndex;
  final Value<String> instruction;
  final Value<double> durationMinutes;
  final Value<Set<StepResource>> resources;
  final Value<SafetyTag> safetyTag;
  final Value<List<String>> photoPaths;
  final Value<String?> videoPath;
  final Value<String?> note;
  const StepsCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.instruction = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.resources = const Value.absent(),
    this.safetyTag = const Value.absent(),
    this.photoPaths = const Value.absent(),
    this.videoPath = const Value.absent(),
    this.note = const Value.absent(),
  });
  StepsCompanion.insert({
    this.id = const Value.absent(),
    required int recipeId,
    required int orderIndex,
    required String instruction,
    this.durationMinutes = const Value.absent(),
    this.resources = const Value.absent(),
    this.safetyTag = const Value.absent(),
    this.photoPaths = const Value.absent(),
    this.videoPath = const Value.absent(),
    this.note = const Value.absent(),
  }) : recipeId = Value(recipeId),
       orderIndex = Value(orderIndex),
       instruction = Value(instruction);
  static Insertable<StepRow> custom({
    Expression<int>? id,
    Expression<int>? recipeId,
    Expression<int>? orderIndex,
    Expression<String>? instruction,
    Expression<double>? durationMinutes,
    Expression<String>? resources,
    Expression<String>? safetyTag,
    Expression<String>? photoPaths,
    Expression<String>? videoPath,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (instruction != null) 'instruction': instruction,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (resources != null) 'resources': resources,
      if (safetyTag != null) 'safety_tag': safetyTag,
      if (photoPaths != null) 'photo_paths': photoPaths,
      if (videoPath != null) 'video_path': videoPath,
      if (note != null) 'note': note,
    });
  }

  StepsCompanion copyWith({
    Value<int>? id,
    Value<int>? recipeId,
    Value<int>? orderIndex,
    Value<String>? instruction,
    Value<double>? durationMinutes,
    Value<Set<StepResource>>? resources,
    Value<SafetyTag>? safetyTag,
    Value<List<String>>? photoPaths,
    Value<String?>? videoPath,
    Value<String?>? note,
  }) {
    return StepsCompanion(
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (instruction.present) {
      map['instruction'] = Variable<String>(instruction.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<double>(durationMinutes.value);
    }
    if (resources.present) {
      map['resources'] = Variable<String>(
        $StepsTable.$converterresources.toSql(resources.value),
      );
    }
    if (safetyTag.present) {
      map['safety_tag'] = Variable<String>(
        $StepsTable.$convertersafetyTag.toSql(safetyTag.value),
      );
    }
    if (photoPaths.present) {
      map['photo_paths'] = Variable<String>(
        $StepsTable.$converterphotoPaths.toSql(photoPaths.value),
      );
    }
    if (videoPath.present) {
      map['video_path'] = Variable<String>(videoPath.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StepsCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('instruction: $instruction, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('resources: $resources, ')
          ..write('safetyTag: $safetyTag, ')
          ..write('photoPaths: $photoPaths, ')
          ..write('videoPath: $videoPath, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $ScheduleItemsTable extends ScheduleItems
    with TableInfo<$ScheduleItemsTable, ScheduleItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id)',
    ),
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _servingsMeta = const VerificationMeta(
    'servings',
  );
  @override
  late final GeneratedColumn<int> servings = GeneratedColumn<int>(
    'servings',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(2),
  );
  @override
  late final GeneratedColumnWithTypeConverter<ScheduleStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('pending'),
      ).withConverter<ScheduleStatus>($ScheduleItemsTable.$converterstatus);
  static const VerificationMeta _plannedForMeta = const VerificationMeta(
    'plannedFor',
  );
  @override
  late final GeneratedColumn<DateTime> plannedFor = GeneratedColumn<DateTime>(
    'planned_for',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recipeId,
    addedAt,
    servings,
    status,
    plannedFor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedule_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduleItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    if (data.containsKey('servings')) {
      context.handle(
        _servingsMeta,
        servings.isAcceptableOrUnknown(data['servings']!, _servingsMeta),
      );
    }
    if (data.containsKey('planned_for')) {
      context.handle(
        _plannedForMeta,
        plannedFor.isAcceptableOrUnknown(data['planned_for']!, _plannedForMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduleItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduleItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_id'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
      servings: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}servings'],
      )!,
      status: $ScheduleItemsTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      plannedFor: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}planned_for'],
      ),
    );
  }

  @override
  $ScheduleItemsTable createAlias(String alias) {
    return $ScheduleItemsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ScheduleStatus, String, String> $converterstatus =
      const EnumNameConverter<ScheduleStatus>(ScheduleStatus.values);
}

class ScheduleItemRow extends DataClass implements Insertable<ScheduleItemRow> {
  final int id;
  final int recipeId;
  final DateTime addedAt;

  /// 份数
  final int servings;

  /// 状态：待排 / 已排 / 完成
  final ScheduleStatus status;

  /// 计划开饭时刻（倒推输入）
  final DateTime? plannedFor;
  const ScheduleItemRow({
    required this.id,
    required this.recipeId,
    required this.addedAt,
    required this.servings,
    required this.status,
    this.plannedFor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipe_id'] = Variable<int>(recipeId);
    map['added_at'] = Variable<DateTime>(addedAt);
    map['servings'] = Variable<int>(servings);
    {
      map['status'] = Variable<String>(
        $ScheduleItemsTable.$converterstatus.toSql(status),
      );
    }
    if (!nullToAbsent || plannedFor != null) {
      map['planned_for'] = Variable<DateTime>(plannedFor);
    }
    return map;
  }

  ScheduleItemsCompanion toCompanion(bool nullToAbsent) {
    return ScheduleItemsCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      addedAt: Value(addedAt),
      servings: Value(servings),
      status: Value(status),
      plannedFor: plannedFor == null && nullToAbsent
          ? const Value.absent()
          : Value(plannedFor),
    );
  }

  factory ScheduleItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleItemRow(
      id: serializer.fromJson<int>(json['id']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
      servings: serializer.fromJson<int>(json['servings']),
      status: $ScheduleItemsTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      plannedFor: serializer.fromJson<DateTime?>(json['plannedFor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipeId': serializer.toJson<int>(recipeId),
      'addedAt': serializer.toJson<DateTime>(addedAt),
      'servings': serializer.toJson<int>(servings),
      'status': serializer.toJson<String>(
        $ScheduleItemsTable.$converterstatus.toJson(status),
      ),
      'plannedFor': serializer.toJson<DateTime?>(plannedFor),
    };
  }

  ScheduleItemRow copyWith({
    int? id,
    int? recipeId,
    DateTime? addedAt,
    int? servings,
    ScheduleStatus? status,
    Value<DateTime?> plannedFor = const Value.absent(),
  }) => ScheduleItemRow(
    id: id ?? this.id,
    recipeId: recipeId ?? this.recipeId,
    addedAt: addedAt ?? this.addedAt,
    servings: servings ?? this.servings,
    status: status ?? this.status,
    plannedFor: plannedFor.present ? plannedFor.value : this.plannedFor,
  );
  ScheduleItemRow copyWithCompanion(ScheduleItemsCompanion data) {
    return ScheduleItemRow(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
      servings: data.servings.present ? data.servings.value : this.servings,
      status: data.status.present ? data.status.value : this.status,
      plannedFor: data.plannedFor.present
          ? data.plannedFor.value
          : this.plannedFor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleItemRow(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('addedAt: $addedAt, ')
          ..write('servings: $servings, ')
          ..write('status: $status, ')
          ..write('plannedFor: $plannedFor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, recipeId, addedAt, servings, status, plannedFor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleItemRow &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.addedAt == this.addedAt &&
          other.servings == this.servings &&
          other.status == this.status &&
          other.plannedFor == this.plannedFor);
}

class ScheduleItemsCompanion extends UpdateCompanion<ScheduleItemRow> {
  final Value<int> id;
  final Value<int> recipeId;
  final Value<DateTime> addedAt;
  final Value<int> servings;
  final Value<ScheduleStatus> status;
  final Value<DateTime?> plannedFor;
  const ScheduleItemsCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.servings = const Value.absent(),
    this.status = const Value.absent(),
    this.plannedFor = const Value.absent(),
  });
  ScheduleItemsCompanion.insert({
    this.id = const Value.absent(),
    required int recipeId,
    this.addedAt = const Value.absent(),
    this.servings = const Value.absent(),
    this.status = const Value.absent(),
    this.plannedFor = const Value.absent(),
  }) : recipeId = Value(recipeId);
  static Insertable<ScheduleItemRow> custom({
    Expression<int>? id,
    Expression<int>? recipeId,
    Expression<DateTime>? addedAt,
    Expression<int>? servings,
    Expression<String>? status,
    Expression<DateTime>? plannedFor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (addedAt != null) 'added_at': addedAt,
      if (servings != null) 'servings': servings,
      if (status != null) 'status': status,
      if (plannedFor != null) 'planned_for': plannedFor,
    });
  }

  ScheduleItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? recipeId,
    Value<DateTime>? addedAt,
    Value<int>? servings,
    Value<ScheduleStatus>? status,
    Value<DateTime?>? plannedFor,
  }) {
    return ScheduleItemsCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      addedAt: addedAt ?? this.addedAt,
      servings: servings ?? this.servings,
      status: status ?? this.status,
      plannedFor: plannedFor ?? this.plannedFor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (servings.present) {
      map['servings'] = Variable<int>(servings.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $ScheduleItemsTable.$converterstatus.toSql(status.value),
      );
    }
    if (plannedFor.present) {
      map['planned_for'] = Variable<DateTime>(plannedFor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleItemsCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('addedAt: $addedAt, ')
          ..write('servings: $servings, ')
          ..write('status: $status, ')
          ..write('plannedFor: $plannedFor')
          ..write(')'))
        .toString();
  }
}

class $RecordsTable extends Records with TableInfo<$RecordsTable, RecordRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id)',
    ),
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _xpGainedMeta = const VerificationMeta(
    'xpGained',
  );
  @override
  late final GeneratedColumn<int> xpGained = GeneratedColumn<int>(
    'xp_gained',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recipeId,
    completedAt,
    note,
    xpGained,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'records';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecordRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('xp_gained')) {
      context.handle(
        _xpGainedMeta,
        xpGained.isAcceptableOrUnknown(data['xp_gained']!, _xpGainedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecordRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecordRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_id'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      xpGained: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp_gained'],
      )!,
    );
  }

  @override
  $RecordsTable createAlias(String alias) {
    return $RecordsTable(attachedDatabase, alias);
  }
}

class RecordRow extends DataClass implements Insertable<RecordRow> {
  final int id;
  final int recipeId;

  /// 完成时间
  final DateTime completedAt;

  /// 复盘笔记（F14）
  final String? note;

  /// 本次获得 XP
  final int xpGained;
  const RecordRow({
    required this.id,
    required this.recipeId,
    required this.completedAt,
    this.note,
    required this.xpGained,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipe_id'] = Variable<int>(recipeId);
    map['completed_at'] = Variable<DateTime>(completedAt);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['xp_gained'] = Variable<int>(xpGained);
    return map;
  }

  RecordsCompanion toCompanion(bool nullToAbsent) {
    return RecordsCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      completedAt: Value(completedAt),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      xpGained: Value(xpGained),
    );
  }

  factory RecordRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecordRow(
      id: serializer.fromJson<int>(json['id']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
      note: serializer.fromJson<String?>(json['note']),
      xpGained: serializer.fromJson<int>(json['xpGained']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipeId': serializer.toJson<int>(recipeId),
      'completedAt': serializer.toJson<DateTime>(completedAt),
      'note': serializer.toJson<String?>(note),
      'xpGained': serializer.toJson<int>(xpGained),
    };
  }

  RecordRow copyWith({
    int? id,
    int? recipeId,
    DateTime? completedAt,
    Value<String?> note = const Value.absent(),
    int? xpGained,
  }) => RecordRow(
    id: id ?? this.id,
    recipeId: recipeId ?? this.recipeId,
    completedAt: completedAt ?? this.completedAt,
    note: note.present ? note.value : this.note,
    xpGained: xpGained ?? this.xpGained,
  );
  RecordRow copyWithCompanion(RecordsCompanion data) {
    return RecordRow(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      note: data.note.present ? data.note.value : this.note,
      xpGained: data.xpGained.present ? data.xpGained.value : this.xpGained,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecordRow(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('completedAt: $completedAt, ')
          ..write('note: $note, ')
          ..write('xpGained: $xpGained')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, recipeId, completedAt, note, xpGained);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecordRow &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.completedAt == this.completedAt &&
          other.note == this.note &&
          other.xpGained == this.xpGained);
}

class RecordsCompanion extends UpdateCompanion<RecordRow> {
  final Value<int> id;
  final Value<int> recipeId;
  final Value<DateTime> completedAt;
  final Value<String?> note;
  final Value<int> xpGained;
  const RecordsCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.note = const Value.absent(),
    this.xpGained = const Value.absent(),
  });
  RecordsCompanion.insert({
    this.id = const Value.absent(),
    required int recipeId,
    required DateTime completedAt,
    this.note = const Value.absent(),
    this.xpGained = const Value.absent(),
  }) : recipeId = Value(recipeId),
       completedAt = Value(completedAt);
  static Insertable<RecordRow> custom({
    Expression<int>? id,
    Expression<int>? recipeId,
    Expression<DateTime>? completedAt,
    Expression<String>? note,
    Expression<int>? xpGained,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (completedAt != null) 'completed_at': completedAt,
      if (note != null) 'note': note,
      if (xpGained != null) 'xp_gained': xpGained,
    });
  }

  RecordsCompanion copyWith({
    Value<int>? id,
    Value<int>? recipeId,
    Value<DateTime>? completedAt,
    Value<String?>? note,
    Value<int>? xpGained,
  }) {
    return RecordsCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      completedAt: completedAt ?? this.completedAt,
      note: note ?? this.note,
      xpGained: xpGained ?? this.xpGained,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (xpGained.present) {
      map['xp_gained'] = Variable<int>(xpGained.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordsCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('completedAt: $completedAt, ')
          ..write('note: $note, ')
          ..write('xpGained: $xpGained')
          ..write(')'))
        .toString();
  }
}

class $ProfilesTable extends Profiles
    with TableInfo<$ProfilesTable, ProfileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _nicknameMeta = const VerificationMeta(
    'nickname',
  );
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
    'nickname',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('食匣用户'),
  );
  static const VerificationMeta _avatarPathMeta = const VerificationMeta(
    'avatarPath',
  );
  @override
  late final GeneratedColumn<String> avatarPath = GeneratedColumn<String>(
    'avatar_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _xpMeta = const VerificationMeta('xp');
  @override
  late final GeneratedColumn<int> xp = GeneratedColumn<int>(
    'xp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalMealsMeta = const VerificationMeta(
    'totalMeals',
  );
  @override
  late final GeneratedColumn<int> totalMeals = GeneratedColumn<int>(
    'total_meals',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String>
  favoriteRecipeIds = GeneratedColumn<String>(
    'favorite_recipe_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  ).withConverter<List<int>>($ProfilesTable.$converterfavoriteRecipeIds);
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String>
  cookedRecipeIds = GeneratedColumn<String>(
    'cooked_recipe_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  ).withConverter<List<int>>($ProfilesTable.$convertercookedRecipeIds);
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String>
  wantedRecipeIds = GeneratedColumn<String>(
    'wanted_recipe_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  ).withConverter<List<int>>($ProfilesTable.$converterwantedRecipeIds);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nickname,
    avatarPath,
    xp,
    totalMeals,
    favoriteRecipeIds,
    cookedRecipeIds,
    wantedRecipeIds,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProfileRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    }
    if (data.containsKey('avatar_path')) {
      context.handle(
        _avatarPathMeta,
        avatarPath.isAcceptableOrUnknown(data['avatar_path']!, _avatarPathMeta),
      );
    }
    if (data.containsKey('xp')) {
      context.handle(_xpMeta, xp.isAcceptableOrUnknown(data['xp']!, _xpMeta));
    }
    if (data.containsKey('total_meals')) {
      context.handle(
        _totalMealsMeta,
        totalMeals.isAcceptableOrUnknown(data['total_meals']!, _totalMealsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProfileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      )!,
      avatarPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar_path'],
      ),
      xp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp'],
      )!,
      totalMeals: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_meals'],
      )!,
      favoriteRecipeIds: $ProfilesTable.$converterfavoriteRecipeIds.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}favorite_recipe_ids'],
        )!,
      ),
      cookedRecipeIds: $ProfilesTable.$convertercookedRecipeIds.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}cooked_recipe_ids'],
        )!,
      ),
      wantedRecipeIds: $ProfilesTable.$converterwantedRecipeIds.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}wanted_recipe_ids'],
        )!,
      ),
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<int>, String> $converterfavoriteRecipeIds =
      const IntListConverter();
  static TypeConverter<List<int>, String> $convertercookedRecipeIds =
      const IntListConverter();
  static TypeConverter<List<int>, String> $converterwantedRecipeIds =
      const IntListConverter();
}

class ProfileRow extends DataClass implements Insertable<ProfileRow> {
  /// 单用户固定主键（注意：不能与 autoIncrement 同时使用，drift 会抛异常）
  final int id;
  final String nickname;
  final String? avatarPath;

  /// 累计经验值
  final int xp;

  /// 累计做过的顿数
  final int totalMeals;

  /// 三栏清单：我喜欢的菜式 id
  final List<int> favoriteRecipeIds;

  /// 三栏清单：我做过的菜式 id
  final List<int> cookedRecipeIds;

  /// 三栏清单：我想做的菜式 id
  final List<int> wantedRecipeIds;
  const ProfileRow({
    required this.id,
    required this.nickname,
    this.avatarPath,
    required this.xp,
    required this.totalMeals,
    required this.favoriteRecipeIds,
    required this.cookedRecipeIds,
    required this.wantedRecipeIds,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nickname'] = Variable<String>(nickname);
    if (!nullToAbsent || avatarPath != null) {
      map['avatar_path'] = Variable<String>(avatarPath);
    }
    map['xp'] = Variable<int>(xp);
    map['total_meals'] = Variable<int>(totalMeals);
    {
      map['favorite_recipe_ids'] = Variable<String>(
        $ProfilesTable.$converterfavoriteRecipeIds.toSql(favoriteRecipeIds),
      );
    }
    {
      map['cooked_recipe_ids'] = Variable<String>(
        $ProfilesTable.$convertercookedRecipeIds.toSql(cookedRecipeIds),
      );
    }
    {
      map['wanted_recipe_ids'] = Variable<String>(
        $ProfilesTable.$converterwantedRecipeIds.toSql(wantedRecipeIds),
      );
    }
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      nickname: Value(nickname),
      avatarPath: avatarPath == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarPath),
      xp: Value(xp),
      totalMeals: Value(totalMeals),
      favoriteRecipeIds: Value(favoriteRecipeIds),
      cookedRecipeIds: Value(cookedRecipeIds),
      wantedRecipeIds: Value(wantedRecipeIds),
    );
  }

  factory ProfileRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileRow(
      id: serializer.fromJson<int>(json['id']),
      nickname: serializer.fromJson<String>(json['nickname']),
      avatarPath: serializer.fromJson<String?>(json['avatarPath']),
      xp: serializer.fromJson<int>(json['xp']),
      totalMeals: serializer.fromJson<int>(json['totalMeals']),
      favoriteRecipeIds: serializer.fromJson<List<int>>(
        json['favoriteRecipeIds'],
      ),
      cookedRecipeIds: serializer.fromJson<List<int>>(json['cookedRecipeIds']),
      wantedRecipeIds: serializer.fromJson<List<int>>(json['wantedRecipeIds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nickname': serializer.toJson<String>(nickname),
      'avatarPath': serializer.toJson<String?>(avatarPath),
      'xp': serializer.toJson<int>(xp),
      'totalMeals': serializer.toJson<int>(totalMeals),
      'favoriteRecipeIds': serializer.toJson<List<int>>(favoriteRecipeIds),
      'cookedRecipeIds': serializer.toJson<List<int>>(cookedRecipeIds),
      'wantedRecipeIds': serializer.toJson<List<int>>(wantedRecipeIds),
    };
  }

  ProfileRow copyWith({
    int? id,
    String? nickname,
    Value<String?> avatarPath = const Value.absent(),
    int? xp,
    int? totalMeals,
    List<int>? favoriteRecipeIds,
    List<int>? cookedRecipeIds,
    List<int>? wantedRecipeIds,
  }) => ProfileRow(
    id: id ?? this.id,
    nickname: nickname ?? this.nickname,
    avatarPath: avatarPath.present ? avatarPath.value : this.avatarPath,
    xp: xp ?? this.xp,
    totalMeals: totalMeals ?? this.totalMeals,
    favoriteRecipeIds: favoriteRecipeIds ?? this.favoriteRecipeIds,
    cookedRecipeIds: cookedRecipeIds ?? this.cookedRecipeIds,
    wantedRecipeIds: wantedRecipeIds ?? this.wantedRecipeIds,
  );
  ProfileRow copyWithCompanion(ProfilesCompanion data) {
    return ProfileRow(
      id: data.id.present ? data.id.value : this.id,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      avatarPath: data.avatarPath.present
          ? data.avatarPath.value
          : this.avatarPath,
      xp: data.xp.present ? data.xp.value : this.xp,
      totalMeals: data.totalMeals.present
          ? data.totalMeals.value
          : this.totalMeals,
      favoriteRecipeIds: data.favoriteRecipeIds.present
          ? data.favoriteRecipeIds.value
          : this.favoriteRecipeIds,
      cookedRecipeIds: data.cookedRecipeIds.present
          ? data.cookedRecipeIds.value
          : this.cookedRecipeIds,
      wantedRecipeIds: data.wantedRecipeIds.present
          ? data.wantedRecipeIds.value
          : this.wantedRecipeIds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProfileRow(')
          ..write('id: $id, ')
          ..write('nickname: $nickname, ')
          ..write('avatarPath: $avatarPath, ')
          ..write('xp: $xp, ')
          ..write('totalMeals: $totalMeals, ')
          ..write('favoriteRecipeIds: $favoriteRecipeIds, ')
          ..write('cookedRecipeIds: $cookedRecipeIds, ')
          ..write('wantedRecipeIds: $wantedRecipeIds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    nickname,
    avatarPath,
    xp,
    totalMeals,
    favoriteRecipeIds,
    cookedRecipeIds,
    wantedRecipeIds,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileRow &&
          other.id == this.id &&
          other.nickname == this.nickname &&
          other.avatarPath == this.avatarPath &&
          other.xp == this.xp &&
          other.totalMeals == this.totalMeals &&
          other.favoriteRecipeIds == this.favoriteRecipeIds &&
          other.cookedRecipeIds == this.cookedRecipeIds &&
          other.wantedRecipeIds == this.wantedRecipeIds);
}

class ProfilesCompanion extends UpdateCompanion<ProfileRow> {
  final Value<int> id;
  final Value<String> nickname;
  final Value<String?> avatarPath;
  final Value<int> xp;
  final Value<int> totalMeals;
  final Value<List<int>> favoriteRecipeIds;
  final Value<List<int>> cookedRecipeIds;
  final Value<List<int>> wantedRecipeIds;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.nickname = const Value.absent(),
    this.avatarPath = const Value.absent(),
    this.xp = const Value.absent(),
    this.totalMeals = const Value.absent(),
    this.favoriteRecipeIds = const Value.absent(),
    this.cookedRecipeIds = const Value.absent(),
    this.wantedRecipeIds = const Value.absent(),
  });
  ProfilesCompanion.insert({
    this.id = const Value.absent(),
    this.nickname = const Value.absent(),
    this.avatarPath = const Value.absent(),
    this.xp = const Value.absent(),
    this.totalMeals = const Value.absent(),
    this.favoriteRecipeIds = const Value.absent(),
    this.cookedRecipeIds = const Value.absent(),
    this.wantedRecipeIds = const Value.absent(),
  });
  static Insertable<ProfileRow> custom({
    Expression<int>? id,
    Expression<String>? nickname,
    Expression<String>? avatarPath,
    Expression<int>? xp,
    Expression<int>? totalMeals,
    Expression<String>? favoriteRecipeIds,
    Expression<String>? cookedRecipeIds,
    Expression<String>? wantedRecipeIds,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nickname != null) 'nickname': nickname,
      if (avatarPath != null) 'avatar_path': avatarPath,
      if (xp != null) 'xp': xp,
      if (totalMeals != null) 'total_meals': totalMeals,
      if (favoriteRecipeIds != null) 'favorite_recipe_ids': favoriteRecipeIds,
      if (cookedRecipeIds != null) 'cooked_recipe_ids': cookedRecipeIds,
      if (wantedRecipeIds != null) 'wanted_recipe_ids': wantedRecipeIds,
    });
  }

  ProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? nickname,
    Value<String?>? avatarPath,
    Value<int>? xp,
    Value<int>? totalMeals,
    Value<List<int>>? favoriteRecipeIds,
    Value<List<int>>? cookedRecipeIds,
    Value<List<int>>? wantedRecipeIds,
  }) {
    return ProfilesCompanion(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      avatarPath: avatarPath ?? this.avatarPath,
      xp: xp ?? this.xp,
      totalMeals: totalMeals ?? this.totalMeals,
      favoriteRecipeIds: favoriteRecipeIds ?? this.favoriteRecipeIds,
      cookedRecipeIds: cookedRecipeIds ?? this.cookedRecipeIds,
      wantedRecipeIds: wantedRecipeIds ?? this.wantedRecipeIds,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (avatarPath.present) {
      map['avatar_path'] = Variable<String>(avatarPath.value);
    }
    if (xp.present) {
      map['xp'] = Variable<int>(xp.value);
    }
    if (totalMeals.present) {
      map['total_meals'] = Variable<int>(totalMeals.value);
    }
    if (favoriteRecipeIds.present) {
      map['favorite_recipe_ids'] = Variable<String>(
        $ProfilesTable.$converterfavoriteRecipeIds.toSql(
          favoriteRecipeIds.value,
        ),
      );
    }
    if (cookedRecipeIds.present) {
      map['cooked_recipe_ids'] = Variable<String>(
        $ProfilesTable.$convertercookedRecipeIds.toSql(cookedRecipeIds.value),
      );
    }
    if (wantedRecipeIds.present) {
      map['wanted_recipe_ids'] = Variable<String>(
        $ProfilesTable.$converterwantedRecipeIds.toSql(wantedRecipeIds.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('nickname: $nickname, ')
          ..write('avatarPath: $avatarPath, ')
          ..write('xp: $xp, ')
          ..write('totalMeals: $totalMeals, ')
          ..write('favoriteRecipeIds: $favoriteRecipeIds, ')
          ..write('cookedRecipeIds: $cookedRecipeIds, ')
          ..write('wantedRecipeIds: $wantedRecipeIds')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ItemsTable items = $ItemsTable(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final $StepsTable steps = $StepsTable(this);
  late final $ScheduleItemsTable scheduleItems = $ScheduleItemsTable(this);
  late final $RecordsTable records = $RecordsTable(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    items,
    recipes,
    steps,
    scheduleItems,
    records,
    profiles,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$ItemsTableCreateCompanionBuilder = ItemsCompanion Function({
  Value<int> id,
  required String name,
  Value<String> category,
  required ItemKind kind,
  Value<QuantityMode> quantityMode,
  Value<double?> quantity,
  Value<String?> unit,
  Value<GranularLevel?> granularLevel,
  Value<DateTime?> storedAt,
  Value<int?> shelfLifeDays,
  Value<DateTime?> expireAt,
  Value<StorageLocation> storageLocation,
  Value<bool?> opened,
  Value<String?> barcode,
  Value<String?> imagePath,
  Value<String?> introWhat,
  Value<String?> introHow,
  Value<String?> introStore,
  Value<String?> introTip,
  Value<bool> isCustom,
  Value<bool> isDepleted,
  Value<String?> note,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$ItemsTableUpdateCompanionBuilder = ItemsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> category,
  Value<ItemKind> kind,
  Value<QuantityMode> quantityMode,
  Value<double?> quantity,
  Value<String?> unit,
  Value<GranularLevel?> granularLevel,
  Value<DateTime?> storedAt,
  Value<int?> shelfLifeDays,
  Value<DateTime?> expireAt,
  Value<StorageLocation> storageLocation,
  Value<bool?> opened,
  Value<String?> barcode,
  Value<String?> imagePath,
  Value<String?> introWhat,
  Value<String?> introHow,
  Value<String?> introStore,
  Value<String?> introTip,
  Value<bool> isCustom,
  Value<bool> isDepleted,
  Value<String?> note,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$ItemsTableFilterComposer extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ItemKind, ItemKind, String> get kind =>
      $composableBuilder(
        column: $table.kind,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<QuantityMode, QuantityMode, String>
  get quantityMode => $composableBuilder(
    column: $table.quantityMode,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<GranularLevel?, GranularLevel, String>
  get granularLevel => $composableBuilder(
    column: $table.granularLevel,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get storedAt => $composableBuilder(
    column: $table.storedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shelfLifeDays => $composableBuilder(
    column: $table.shelfLifeDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expireAt => $composableBuilder(
    column: $table.expireAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<StorageLocation, StorageLocation, String>
  get storageLocation => $composableBuilder(
    column: $table.storageLocation,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get opened => $composableBuilder(
    column: $table.opened,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get introWhat => $composableBuilder(
    column: $table.introWhat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get introHow => $composableBuilder(
    column: $table.introHow,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get introStore => $composableBuilder(
    column: $table.introStore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get introTip => $composableBuilder(
    column: $table.introTip,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDepleted => $composableBuilder(
    column: $table.isDepleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quantityMode => $composableBuilder(
    column: $table.quantityMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get granularLevel => $composableBuilder(
    column: $table.granularLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get storedAt => $composableBuilder(
    column: $table.storedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shelfLifeDays => $composableBuilder(
    column: $table.shelfLifeDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expireAt => $composableBuilder(
    column: $table.expireAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get storageLocation => $composableBuilder(
    column: $table.storageLocation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get opened => $composableBuilder(
    column: $table.opened,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get introWhat => $composableBuilder(
    column: $table.introWhat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get introHow => $composableBuilder(
    column: $table.introHow,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get introStore => $composableBuilder(
    column: $table.introStore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get introTip => $composableBuilder(
    column: $table.introTip,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDepleted => $composableBuilder(
    column: $table.isDepleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ItemKind, String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumnWithTypeConverter<QuantityMode, String> get quantityMode =>
      $composableBuilder(
        column: $table.quantityMode,
        builder: (column) => column,
      );

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GranularLevel?, String> get granularLevel =>
      $composableBuilder(
        column: $table.granularLevel,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get storedAt =>
      $composableBuilder(column: $table.storedAt, builder: (column) => column);

  GeneratedColumn<int> get shelfLifeDays => $composableBuilder(
    column: $table.shelfLifeDays,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get expireAt =>
      $composableBuilder(column: $table.expireAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<StorageLocation, String>
  get storageLocation => $composableBuilder(
    column: $table.storageLocation,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get opened =>
      $composableBuilder(column: $table.opened, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get introWhat =>
      $composableBuilder(column: $table.introWhat, builder: (column) => column);

  GeneratedColumn<String> get introHow =>
      $composableBuilder(column: $table.introHow, builder: (column) => column);

  GeneratedColumn<String> get introStore => $composableBuilder(
    column: $table.introStore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get introTip =>
      $composableBuilder(column: $table.introTip, builder: (column) => column);

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  GeneratedColumn<bool> get isDepleted => $composableBuilder(
    column: $table.isDepleted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItemsTable,
          ItemRow,
          $$ItemsTableFilterComposer,
          $$ItemsTableOrderingComposer,
          $$ItemsTableAnnotationComposer,
          $$ItemsTableCreateCompanionBuilder,
          $$ItemsTableUpdateCompanionBuilder,
          (ItemRow, BaseReferences<_$AppDatabase, $ItemsTable, ItemRow>),
          ItemRow,
          PrefetchHooks Function()
        > {
  $$ItemsTableTableManager(_$AppDatabase db, $ItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<ItemKind> kind = const Value.absent(),
                Value<QuantityMode> quantityMode = const Value.absent(),
                Value<double?> quantity = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<GranularLevel?> granularLevel = const Value.absent(),
                Value<DateTime?> storedAt = const Value.absent(),
                Value<int?> shelfLifeDays = const Value.absent(),
                Value<DateTime?> expireAt = const Value.absent(),
                Value<StorageLocation> storageLocation = const Value.absent(),
                Value<bool?> opened = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> introWhat = const Value.absent(),
                Value<String?> introHow = const Value.absent(),
                Value<String?> introStore = const Value.absent(),
                Value<String?> introTip = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<bool> isDepleted = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ItemsCompanion(
                id: id,
                name: name,
                category: category,
                kind: kind,
                quantityMode: quantityMode,
                quantity: quantity,
                unit: unit,
                granularLevel: granularLevel,
                storedAt: storedAt,
                shelfLifeDays: shelfLifeDays,
                expireAt: expireAt,
                storageLocation: storageLocation,
                opened: opened,
                barcode: barcode,
                imagePath: imagePath,
                introWhat: introWhat,
                introHow: introHow,
                introStore: introStore,
                introTip: introTip,
                isCustom: isCustom,
                isDepleted: isDepleted,
                note: note,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String> category = const Value.absent(),
                required ItemKind kind,
                Value<QuantityMode> quantityMode = const Value.absent(),
                Value<double?> quantity = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<GranularLevel?> granularLevel = const Value.absent(),
                Value<DateTime?> storedAt = const Value.absent(),
                Value<int?> shelfLifeDays = const Value.absent(),
                Value<DateTime?> expireAt = const Value.absent(),
                Value<StorageLocation> storageLocation = const Value.absent(),
                Value<bool?> opened = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> introWhat = const Value.absent(),
                Value<String?> introHow = const Value.absent(),
                Value<String?> introStore = const Value.absent(),
                Value<String?> introTip = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<bool> isDepleted = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ItemsCompanion.insert(
                id: id,
                name: name,
                category: category,
                kind: kind,
                quantityMode: quantityMode,
                quantity: quantity,
                unit: unit,
                granularLevel: granularLevel,
                storedAt: storedAt,
                shelfLifeDays: shelfLifeDays,
                expireAt: expireAt,
                storageLocation: storageLocation,
                opened: opened,
                barcode: barcode,
                imagePath: imagePath,
                introWhat: introWhat,
                introHow: introHow,
                introStore: introStore,
                introTip: introTip,
                isCustom: isCustom,
                isDepleted: isDepleted,
                note: note,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ItemsTable, ItemRow>(table),
                  BaseReferences<_$AppDatabase, $ItemsTable, ItemRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItemsTable,
      ItemRow,
      $$ItemsTableFilterComposer,
      $$ItemsTableOrderingComposer,
      $$ItemsTableAnnotationComposer,
      $$ItemsTableCreateCompanionBuilder,
      $$ItemsTableUpdateCompanionBuilder,
      (ItemRow, BaseReferences<_$AppDatabase, $ItemsTable, ItemRow>),
      ItemRow,
      PrefetchHooks Function()
    >;
typedef $$RecipesTableCreateCompanionBuilder = RecipesCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> coverImagePath,
  Value<String?> cuisine,
  Value<String?> mainCategory,
  Value<int?> durationMinutes,
  Value<Difficulty> difficulty,
  Value<int> baseServings,
  Value<List<int>> seasonMonths,
  Value<List<RecipeIngredient>> ingredients,
  Value<String?> intro,
  Value<RecipeSource> source,
  Value<String?> sharerName,
  Value<DateTime?> sharedAt,
  Value<DateTime> createdAt,
});
typedef $$RecipesTableUpdateCompanionBuilder = RecipesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> coverImagePath,
  Value<String?> cuisine,
  Value<String?> mainCategory,
  Value<int?> durationMinutes,
  Value<Difficulty> difficulty,
  Value<int> baseServings,
  Value<List<int>> seasonMonths,
  Value<List<RecipeIngredient>> ingredients,
  Value<String?> intro,
  Value<RecipeSource> source,
  Value<String?> sharerName,
  Value<DateTime?> sharedAt,
  Value<DateTime> createdAt,
});

final class $$RecipesTableReferences
    extends BaseReferences<_$AppDatabase, $RecipesTable, RecipeRow> {
  $$RecipesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$StepsTable, List<StepRow>> _stepsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.steps,
    aliasName: 'recipes__id__steps__recipe_id',
  );

  $$StepsTableProcessedTableManager get stepsRefs {
    final manager = $$StepsTableTableManager(
      $_db,
      $_db.steps,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_stepsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ScheduleItemsTable, List<ScheduleItemRow>>
  _scheduleItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.scheduleItems,
    aliasName: 'recipes__id__schedule_items__recipe_id',
  );

  $$ScheduleItemsTableProcessedTableManager get scheduleItemsRefs {
    final manager = $$ScheduleItemsTableTableManager(
      $_db,
      $_db.scheduleItems,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_scheduleItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RecordsTable, List<RecordRow>> _recordsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.records,
    aliasName: 'recipes__id__records__recipe_id',
  );

  $$RecordsTableProcessedTableManager get recordsRefs {
    final manager = $$RecordsTableTableManager(
      $_db,
      $_db.records,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_recordsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecipesTableFilterComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverImagePath => $composableBuilder(
    column: $table.coverImagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cuisine => $composableBuilder(
    column: $table.cuisine,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mainCategory => $composableBuilder(
    column: $table.mainCategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Difficulty, Difficulty, String>
  get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get baseServings => $composableBuilder(
    column: $table.baseServings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<int>, List<int>, String>
  get seasonMonths => $composableBuilder(
    column: $table.seasonMonths,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    List<RecipeIngredient>,
    List<RecipeIngredient>,
    String
  >
  get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get intro => $composableBuilder(
    column: $table.intro,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<RecipeSource, RecipeSource, String>
  get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get sharerName => $composableBuilder(
    column: $table.sharerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sharedAt => $composableBuilder(
    column: $table.sharedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> stepsRefs(
    Expression<bool> Function($$StepsTableFilterComposer f) f,
  ) {
    final $$StepsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.steps,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StepsTableFilterComposer(
            $db: $db,
            $table: $db.steps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> scheduleItemsRefs(
    Expression<bool> Function($$ScheduleItemsTableFilterComposer f) f,
  ) {
    final $$ScheduleItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduleItems,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleItemsTableFilterComposer(
            $db: $db,
            $table: $db.scheduleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> recordsRefs(
    Expression<bool> Function($$RecordsTableFilterComposer f) f,
  ) {
    final $$RecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.records,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecordsTableFilterComposer(
            $db: $db,
            $table: $db.records,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverImagePath => $composableBuilder(
    column: $table.coverImagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cuisine => $composableBuilder(
    column: $table.cuisine,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mainCategory => $composableBuilder(
    column: $table.mainCategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseServings => $composableBuilder(
    column: $table.baseServings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get seasonMonths => $composableBuilder(
    column: $table.seasonMonths,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get intro => $composableBuilder(
    column: $table.intro,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sharerName => $composableBuilder(
    column: $table.sharerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sharedAt => $composableBuilder(
    column: $table.sharedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get coverImagePath => $composableBuilder(
    column: $table.coverImagePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cuisine =>
      $composableBuilder(column: $table.cuisine, builder: (column) => column);

  GeneratedColumn<String> get mainCategory => $composableBuilder(
    column: $table.mainCategory,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Difficulty, String> get difficulty =>
      $composableBuilder(
        column: $table.difficulty,
        builder: (column) => column,
      );

  GeneratedColumn<int> get baseServings => $composableBuilder(
    column: $table.baseServings,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<int>, String> get seasonMonths =>
      $composableBuilder(
        column: $table.seasonMonths,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<List<RecipeIngredient>, String>
  get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => column,
  );

  GeneratedColumn<String> get intro =>
      $composableBuilder(column: $table.intro, builder: (column) => column);

  GeneratedColumnWithTypeConverter<RecipeSource, String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get sharerName => $composableBuilder(
    column: $table.sharerName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get sharedAt =>
      $composableBuilder(column: $table.sharedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> stepsRefs<T extends Object>(
    Expression<T> Function($$StepsTableAnnotationComposer a) f,
  ) {
    final $$StepsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.steps,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StepsTableAnnotationComposer(
            $db: $db,
            $table: $db.steps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> scheduleItemsRefs<T extends Object>(
    Expression<T> Function($$ScheduleItemsTableAnnotationComposer a) f,
  ) {
    final $$ScheduleItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduleItems,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.scheduleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> recordsRefs<T extends Object>(
    Expression<T> Function($$RecordsTableAnnotationComposer a) f,
  ) {
    final $$RecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.records,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.records,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipesTable,
          RecipeRow,
          $$RecipesTableFilterComposer,
          $$RecipesTableOrderingComposer,
          $$RecipesTableAnnotationComposer,
          $$RecipesTableCreateCompanionBuilder,
          $$RecipesTableUpdateCompanionBuilder,
          (RecipeRow, $$RecipesTableReferences),
          RecipeRow,
          PrefetchHooks Function({
            bool stepsRefs,
            bool scheduleItemsRefs,
            bool recordsRefs,
          })
        > {
  $$RecipesTableTableManager(_$AppDatabase db, $RecipesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> coverImagePath = const Value.absent(),
                Value<String?> cuisine = const Value.absent(),
                Value<String?> mainCategory = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<Difficulty> difficulty = const Value.absent(),
                Value<int> baseServings = const Value.absent(),
                Value<List<int>> seasonMonths = const Value.absent(),
                Value<List<RecipeIngredient>> ingredients =
                    const Value.absent(),
                Value<String?> intro = const Value.absent(),
                Value<RecipeSource> source = const Value.absent(),
                Value<String?> sharerName = const Value.absent(),
                Value<DateTime?> sharedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RecipesCompanion(
                id: id,
                name: name,
                coverImagePath: coverImagePath,
                cuisine: cuisine,
                mainCategory: mainCategory,
                durationMinutes: durationMinutes,
                difficulty: difficulty,
                baseServings: baseServings,
                seasonMonths: seasonMonths,
                ingredients: ingredients,
                intro: intro,
                source: source,
                sharerName: sharerName,
                sharedAt: sharedAt,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> coverImagePath = const Value.absent(),
                Value<String?> cuisine = const Value.absent(),
                Value<String?> mainCategory = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<Difficulty> difficulty = const Value.absent(),
                Value<int> baseServings = const Value.absent(),
                Value<List<int>> seasonMonths = const Value.absent(),
                Value<List<RecipeIngredient>> ingredients =
                    const Value.absent(),
                Value<String?> intro = const Value.absent(),
                Value<RecipeSource> source = const Value.absent(),
                Value<String?> sharerName = const Value.absent(),
                Value<DateTime?> sharedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RecipesCompanion.insert(
                id: id,
                name: name,
                coverImagePath: coverImagePath,
                cuisine: cuisine,
                mainCategory: mainCategory,
                durationMinutes: durationMinutes,
                difficulty: difficulty,
                baseServings: baseServings,
                seasonMonths: seasonMonths,
                ingredients: ingredients,
                intro: intro,
                source: source,
                sharerName: sharerName,
                sharedAt: sharedAt,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RecipesTable, RecipeRow>(table),
                  $$RecipesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                stepsRefs = false,
                scheduleItemsRefs = false,
                recordsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (stepsRefs) db.steps,
                    if (scheduleItemsRefs) db.scheduleItems,
                    if (recordsRefs) db.records,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (stepsRefs)
                        await $_getPrefetchedData<
                          RecipeRow,
                          $RecipesTable,
                          StepRow
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._stepsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(db, table, p0).stepsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (scheduleItemsRefs)
                        await $_getPrefetchedData<
                          RecipeRow,
                          $RecipesTable,
                          ScheduleItemRow
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._scheduleItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).scheduleItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (recordsRefs)
                        await $_getPrefetchedData<
                          RecipeRow,
                          $RecipesTable,
                          RecordRow
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._recordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).recordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RecipesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipesTable,
      RecipeRow,
      $$RecipesTableFilterComposer,
      $$RecipesTableOrderingComposer,
      $$RecipesTableAnnotationComposer,
      $$RecipesTableCreateCompanionBuilder,
      $$RecipesTableUpdateCompanionBuilder,
      (RecipeRow, $$RecipesTableReferences),
      RecipeRow,
      PrefetchHooks Function({
        bool stepsRefs,
        bool scheduleItemsRefs,
        bool recordsRefs,
      })
    >;
typedef $$StepsTableCreateCompanionBuilder = StepsCompanion Function({
  Value<int> id,
  required int recipeId,
  required int orderIndex,
  required String instruction,
  Value<double> durationMinutes,
  Value<Set<StepResource>> resources,
  Value<SafetyTag> safetyTag,
  Value<List<String>> photoPaths,
  Value<String?> videoPath,
  Value<String?> note,
});
typedef $$StepsTableUpdateCompanionBuilder = StepsCompanion Function({
  Value<int> id,
  Value<int> recipeId,
  Value<int> orderIndex,
  Value<String> instruction,
  Value<double> durationMinutes,
  Value<Set<StepResource>> resources,
  Value<SafetyTag> safetyTag,
  Value<List<String>> photoPaths,
  Value<String?> videoPath,
  Value<String?> note,
});

final class $$StepsTableReferences
    extends BaseReferences<_$AppDatabase, $StepsTable, StepRow> {
  $$StepsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias('steps__recipe_id__recipes__id');

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<int>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StepsTableFilterComposer extends Composer<_$AppDatabase, $StepsTable> {
  $$StepsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instruction => $composableBuilder(
    column: $table.instruction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Set<StepResource>, Set<StepResource>, String>
  get resources => $composableBuilder(
    column: $table.resources,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<SafetyTag, SafetyTag, String> get safetyTag =>
      $composableBuilder(
        column: $table.safetyTag,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get photoPaths => $composableBuilder(
    column: $table.photoPaths,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get videoPath => $composableBuilder(
    column: $table.videoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StepsTableOrderingComposer
    extends Composer<_$AppDatabase, $StepsTable> {
  $$StepsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instruction => $composableBuilder(
    column: $table.instruction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resources => $composableBuilder(
    column: $table.resources,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get safetyTag => $composableBuilder(
    column: $table.safetyTag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPaths => $composableBuilder(
    column: $table.photoPaths,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get videoPath => $composableBuilder(
    column: $table.videoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StepsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StepsTable> {
  $$StepsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get instruction => $composableBuilder(
    column: $table.instruction,
    builder: (column) => column,
  );

  GeneratedColumn<double> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Set<StepResource>, String> get resources =>
      $composableBuilder(column: $table.resources, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SafetyTag, String> get safetyTag =>
      $composableBuilder(column: $table.safetyTag, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get photoPaths =>
      $composableBuilder(
        column: $table.photoPaths,
        builder: (column) => column,
      );

  GeneratedColumn<String> get videoPath =>
      $composableBuilder(column: $table.videoPath, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StepsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StepsTable,
          StepRow,
          $$StepsTableFilterComposer,
          $$StepsTableOrderingComposer,
          $$StepsTableAnnotationComposer,
          $$StepsTableCreateCompanionBuilder,
          $$StepsTableUpdateCompanionBuilder,
          (StepRow, $$StepsTableReferences),
          StepRow,
          PrefetchHooks Function({bool recipeId})
        > {
  $$StepsTableTableManager(_$AppDatabase db, $StepsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StepsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StepsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StepsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> recipeId = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<String> instruction = const Value.absent(),
                Value<double> durationMinutes = const Value.absent(),
                Value<Set<StepResource>> resources = const Value.absent(),
                Value<SafetyTag> safetyTag = const Value.absent(),
                Value<List<String>> photoPaths = const Value.absent(),
                Value<String?> videoPath = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => StepsCompanion(
                id: id,
                recipeId: recipeId,
                orderIndex: orderIndex,
                instruction: instruction,
                durationMinutes: durationMinutes,
                resources: resources,
                safetyTag: safetyTag,
                photoPaths: photoPaths,
                videoPath: videoPath,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int recipeId,
                required int orderIndex,
                required String instruction,
                Value<double> durationMinutes = const Value.absent(),
                Value<Set<StepResource>> resources = const Value.absent(),
                Value<SafetyTag> safetyTag = const Value.absent(),
                Value<List<String>> photoPaths = const Value.absent(),
                Value<String?> videoPath = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => StepsCompanion.insert(
                id: id,
                recipeId: recipeId,
                orderIndex: orderIndex,
                instruction: instruction,
                durationMinutes: durationMinutes,
                resources: resources,
                safetyTag: safetyTag,
                photoPaths: photoPaths,
                videoPath: videoPath,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StepsTable, StepRow>(table),
                  $$StepsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (recipeId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.recipeId,
                        referencedTable: $$StepsTableReferences._recipeIdTable(
                          db,
                        ),
                        referencedColumn: $$StepsTableReferences
                            ._recipeIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StepsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StepsTable,
      StepRow,
      $$StepsTableFilterComposer,
      $$StepsTableOrderingComposer,
      $$StepsTableAnnotationComposer,
      $$StepsTableCreateCompanionBuilder,
      $$StepsTableUpdateCompanionBuilder,
      (StepRow, $$StepsTableReferences),
      StepRow,
      PrefetchHooks Function({bool recipeId})
    >;
typedef $$ScheduleItemsTableCreateCompanionBuilder =
    ScheduleItemsCompanion Function({
      Value<int> id,
      required int recipeId,
      Value<DateTime> addedAt,
      Value<int> servings,
      Value<ScheduleStatus> status,
      Value<DateTime?> plannedFor,
    });
typedef $$ScheduleItemsTableUpdateCompanionBuilder =
    ScheduleItemsCompanion Function({
      Value<int> id,
      Value<int> recipeId,
      Value<DateTime> addedAt,
      Value<int> servings,
      Value<ScheduleStatus> status,
      Value<DateTime?> plannedFor,
    });

final class $$ScheduleItemsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ScheduleItemsTable, ScheduleItemRow> {
  $$ScheduleItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias('schedule_items__recipe_id__recipes__id');

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<int>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ScheduleItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduleItemsTable> {
  $$ScheduleItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get servings => $composableBuilder(
    column: $table.servings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ScheduleStatus, ScheduleStatus, String>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get plannedFor => $composableBuilder(
    column: $table.plannedFor,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduleItemsTable> {
  $$ScheduleItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get servings => $composableBuilder(
    column: $table.servings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get plannedFor => $composableBuilder(
    column: $table.plannedFor,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduleItemsTable> {
  $$ScheduleItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  GeneratedColumn<int> get servings =>
      $composableBuilder(column: $table.servings, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ScheduleStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get plannedFor => $composableBuilder(
    column: $table.plannedFor,
    builder: (column) => column,
  );

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScheduleItemsTable,
          ScheduleItemRow,
          $$ScheduleItemsTableFilterComposer,
          $$ScheduleItemsTableOrderingComposer,
          $$ScheduleItemsTableAnnotationComposer,
          $$ScheduleItemsTableCreateCompanionBuilder,
          $$ScheduleItemsTableUpdateCompanionBuilder,
          (ScheduleItemRow, $$ScheduleItemsTableReferences),
          ScheduleItemRow,
          PrefetchHooks Function({bool recipeId})
        > {
  $$ScheduleItemsTableTableManager(_$AppDatabase db, $ScheduleItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduleItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduleItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScheduleItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> recipeId = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> servings = const Value.absent(),
                Value<ScheduleStatus> status = const Value.absent(),
                Value<DateTime?> plannedFor = const Value.absent(),
              }) => ScheduleItemsCompanion(
                id: id,
                recipeId: recipeId,
                addedAt: addedAt,
                servings: servings,
                status: status,
                plannedFor: plannedFor,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int recipeId,
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> servings = const Value.absent(),
                Value<ScheduleStatus> status = const Value.absent(),
                Value<DateTime?> plannedFor = const Value.absent(),
              }) => ScheduleItemsCompanion.insert(
                id: id,
                recipeId: recipeId,
                addedAt: addedAt,
                servings: servings,
                status: status,
                plannedFor: plannedFor,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ScheduleItemsTable, ScheduleItemRow>(table),
                  $$ScheduleItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (recipeId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.recipeId,
                        referencedTable: $$ScheduleItemsTableReferences
                            ._recipeIdTable(db),
                        referencedColumn: $$ScheduleItemsTableReferences
                            ._recipeIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ScheduleItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScheduleItemsTable,
      ScheduleItemRow,
      $$ScheduleItemsTableFilterComposer,
      $$ScheduleItemsTableOrderingComposer,
      $$ScheduleItemsTableAnnotationComposer,
      $$ScheduleItemsTableCreateCompanionBuilder,
      $$ScheduleItemsTableUpdateCompanionBuilder,
      (ScheduleItemRow, $$ScheduleItemsTableReferences),
      ScheduleItemRow,
      PrefetchHooks Function({bool recipeId})
    >;
typedef $$RecordsTableCreateCompanionBuilder = RecordsCompanion Function({
  Value<int> id,
  required int recipeId,
  required DateTime completedAt,
  Value<String?> note,
  Value<int> xpGained,
});
typedef $$RecordsTableUpdateCompanionBuilder = RecordsCompanion Function({
  Value<int> id,
  Value<int> recipeId,
  Value<DateTime> completedAt,
  Value<String?> note,
  Value<int> xpGained,
});

final class $$RecordsTableReferences
    extends BaseReferences<_$AppDatabase, $RecordsTable, RecordRow> {
  $$RecordsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias('records__recipe_id__recipes__id');

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<int>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecordsTableFilterComposer
    extends Composer<_$AppDatabase, $RecordsTable> {
  $$RecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xpGained => $composableBuilder(
    column: $table.xpGained,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecordsTable> {
  $$RecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xpGained => $composableBuilder(
    column: $table.xpGained,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecordsTable> {
  $$RecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get xpGained =>
      $composableBuilder(column: $table.xpGained, builder: (column) => column);

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecordsTable,
          RecordRow,
          $$RecordsTableFilterComposer,
          $$RecordsTableOrderingComposer,
          $$RecordsTableAnnotationComposer,
          $$RecordsTableCreateCompanionBuilder,
          $$RecordsTableUpdateCompanionBuilder,
          (RecordRow, $$RecordsTableReferences),
          RecordRow,
          PrefetchHooks Function({bool recipeId})
        > {
  $$RecordsTableTableManager(_$AppDatabase db, $RecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> recipeId = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> xpGained = const Value.absent(),
              }) => RecordsCompanion(
                id: id,
                recipeId: recipeId,
                completedAt: completedAt,
                note: note,
                xpGained: xpGained,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int recipeId,
                required DateTime completedAt,
                Value<String?> note = const Value.absent(),
                Value<int> xpGained = const Value.absent(),
              }) => RecordsCompanion.insert(
                id: id,
                recipeId: recipeId,
                completedAt: completedAt,
                note: note,
                xpGained: xpGained,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RecordsTable, RecordRow>(table),
                  $$RecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (recipeId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.recipeId,
                        referencedTable: $$RecordsTableReferences
                            ._recipeIdTable(db),
                        referencedColumn: $$RecordsTableReferences
                            ._recipeIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecordsTable,
      RecordRow,
      $$RecordsTableFilterComposer,
      $$RecordsTableOrderingComposer,
      $$RecordsTableAnnotationComposer,
      $$RecordsTableCreateCompanionBuilder,
      $$RecordsTableUpdateCompanionBuilder,
      (RecordRow, $$RecordsTableReferences),
      RecordRow,
      PrefetchHooks Function({bool recipeId})
    >;
typedef $$ProfilesTableCreateCompanionBuilder = ProfilesCompanion Function({
  Value<int> id,
  Value<String> nickname,
  Value<String?> avatarPath,
  Value<int> xp,
  Value<int> totalMeals,
  Value<List<int>> favoriteRecipeIds,
  Value<List<int>> cookedRecipeIds,
  Value<List<int>> wantedRecipeIds,
});
typedef $$ProfilesTableUpdateCompanionBuilder = ProfilesCompanion Function({
  Value<int> id,
  Value<String> nickname,
  Value<String?> avatarPath,
  Value<int> xp,
  Value<int> totalMeals,
  Value<List<int>> favoriteRecipeIds,
  Value<List<int>> cookedRecipeIds,
  Value<List<int>> wantedRecipeIds,
});

class $$ProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xp => $composableBuilder(
    column: $table.xp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalMeals => $composableBuilder(
    column: $table.totalMeals,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<int>, List<int>, String>
  get favoriteRecipeIds => $composableBuilder(
    column: $table.favoriteRecipeIds,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<int>, List<int>, String>
  get cookedRecipeIds => $composableBuilder(
    column: $table.cookedRecipeIds,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<int>, List<int>, String>
  get wantedRecipeIds => $composableBuilder(
    column: $table.wantedRecipeIds,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$ProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xp => $composableBuilder(
    column: $table.xp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalMeals => $composableBuilder(
    column: $table.totalMeals,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get favoriteRecipeIds => $composableBuilder(
    column: $table.favoriteRecipeIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cookedRecipeIds => $composableBuilder(
    column: $table.cookedRecipeIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wantedRecipeIds => $composableBuilder(
    column: $table.wantedRecipeIds,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => column,
  );

  GeneratedColumn<int> get xp =>
      $composableBuilder(column: $table.xp, builder: (column) => column);

  GeneratedColumn<int> get totalMeals => $composableBuilder(
    column: $table.totalMeals,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<int>, String> get favoriteRecipeIds =>
      $composableBuilder(
        column: $table.favoriteRecipeIds,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<List<int>, String> get cookedRecipeIds =>
      $composableBuilder(
        column: $table.cookedRecipeIds,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<List<int>, String> get wantedRecipeIds =>
      $composableBuilder(
        column: $table.wantedRecipeIds,
        builder: (column) => column,
      );
}

class $$ProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfilesTable,
          ProfileRow,
          $$ProfilesTableFilterComposer,
          $$ProfilesTableOrderingComposer,
          $$ProfilesTableAnnotationComposer,
          $$ProfilesTableCreateCompanionBuilder,
          $$ProfilesTableUpdateCompanionBuilder,
          (
            ProfileRow,
            BaseReferences<_$AppDatabase, $ProfilesTable, ProfileRow>,
          ),
          ProfileRow,
          PrefetchHooks Function()
        > {
  $$ProfilesTableTableManager(_$AppDatabase db, $ProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nickname = const Value.absent(),
                Value<String?> avatarPath = const Value.absent(),
                Value<int> xp = const Value.absent(),
                Value<int> totalMeals = const Value.absent(),
                Value<List<int>> favoriteRecipeIds = const Value.absent(),
                Value<List<int>> cookedRecipeIds = const Value.absent(),
                Value<List<int>> wantedRecipeIds = const Value.absent(),
              }) => ProfilesCompanion(
                id: id,
                nickname: nickname,
                avatarPath: avatarPath,
                xp: xp,
                totalMeals: totalMeals,
                favoriteRecipeIds: favoriteRecipeIds,
                cookedRecipeIds: cookedRecipeIds,
                wantedRecipeIds: wantedRecipeIds,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nickname = const Value.absent(),
                Value<String?> avatarPath = const Value.absent(),
                Value<int> xp = const Value.absent(),
                Value<int> totalMeals = const Value.absent(),
                Value<List<int>> favoriteRecipeIds = const Value.absent(),
                Value<List<int>> cookedRecipeIds = const Value.absent(),
                Value<List<int>> wantedRecipeIds = const Value.absent(),
              }) => ProfilesCompanion.insert(
                id: id,
                nickname: nickname,
                avatarPath: avatarPath,
                xp: xp,
                totalMeals: totalMeals,
                favoriteRecipeIds: favoriteRecipeIds,
                cookedRecipeIds: cookedRecipeIds,
                wantedRecipeIds: wantedRecipeIds,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProfilesTable, ProfileRow>(table),
                  BaseReferences<_$AppDatabase, $ProfilesTable, ProfileRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfilesTable,
      ProfileRow,
      $$ProfilesTableFilterComposer,
      $$ProfilesTableOrderingComposer,
      $$ProfilesTableAnnotationComposer,
      $$ProfilesTableCreateCompanionBuilder,
      $$ProfilesTableUpdateCompanionBuilder,
      (ProfileRow, BaseReferences<_$AppDatabase, $ProfilesTable, ProfileRow>),
      ProfileRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ItemsTableTableManager get items =>
      $$ItemsTableTableManager(_db, _db.items);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db, _db.recipes);
  $$StepsTableTableManager get steps =>
      $$StepsTableTableManager(_db, _db.steps);
  $$ScheduleItemsTableTableManager get scheduleItems =>
      $$ScheduleItemsTableTableManager(_db, _db.scheduleItems);
  $$RecordsTableTableManager get records =>
      $$RecordsTableTableManager(_db, _db.records);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
}
