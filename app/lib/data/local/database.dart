import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../models/enums.dart';
import '../models/recipe.dart';
import 'converters.dart';

part 'database.g.dart';

/// ===========================================================================
/// 食匣本地数据库（Drift / SQLite）
///
/// 六张表（W1 冻结口径，见《接口约定.md》第 2 章）：
///   items / recipes / steps / schedule_items / records / profiles
///
/// 访问纪律：**除 `data/repositories/` 下的本地实现外，任何页面都不得直接
///          使用本类**。模块间只能通过 Repository 接口通信（总计划第七章）。
/// ===========================================================================

/// 表 1 —— 食材 / 调料条目（构想附录 Item）
@DataClassName('ItemRow')
class Items extends Table {
  @override
  String get tableName => 'items';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 60)();

  /// 分类（蔬菜 / 禽肉 / 调味汁 …）
  TextColumn get category => text().withDefault(const Constant('未分类'))();

  /// 食材 / 调料（构想 2.2.1 上下双分区）
  TextColumn get kind => textEnum<ItemKind>()();

  /// 数量展示模式（Q5-C 用户自选）
  TextColumn get quantityMode =>
      textEnum<QuantityMode>().withDefault(const Constant('granular'))();

  /// 精确数量（precise 模式）
  RealColumn get quantity => real().nullable()();

  /// 单位
  TextColumn get unit => text().nullable()();

  /// 粗粒度档位（granular 模式）
  TextColumn get granularLevel => textEnum<GranularLevel>().nullable()();

  /// 入库日期
  DateTimeColumn get storedAt => dateTime().nullable()();

  /// 预置保质期天数
  IntColumn get shelfLifeDays => integer().nullable()();

  /// 到期日
  DateTimeColumn get expireAt => dateTime().nullable()();

  /// 存放位置（冷藏 / 冷冻 / 常温）
  TextColumn get storageLocation =>
      textEnum<StorageLocation>().withDefault(const Constant('fridge'))();

  /// 开封状态（调料专用）
  BoolColumn get opened => boolean().nullable()();

  /// 商品条形码（扫码自学习映射）
  TextColumn get barcode => text().nullable()();

  /// 图片路径
  TextColumn get imagePath => text().nullable()();

  /// 简介四段
  TextColumn get introWhat => text().nullable()();
  TextColumn get introHow => text().nullable()();
  TextColumn get introStore => text().nullable()();
  TextColumn get introTip => text().nullable()();

  /// 是否用户自建
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();

  /// 库存已用完（v1.1 新增，见《接口约定.md》3.3）
  ///
  /// 数量扣减至 0 时置 true —— 条目**置灰保留而不删除**，
  /// 由页面提示「已用完，是否移出库 / 加入购物清单」。
  BoolColumn get isDepleted => boolean().withDefault(const Constant(false))();

  TextColumn get note => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

/// 表 2 —— 菜式（构想附录 Recipe）
@DataClassName('RecipeRow')
class Recipes extends Table {
  @override
  String get tableName => 'recipes';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 60)();

  TextColumn get coverImagePath => text().nullable()();

  /// 菜系（粤菜 / 川菜 / 家常菜 …）
  TextColumn get cuisine => text().nullable()();

  /// 主食材分类（海鲜 / 鸡肉 / 蔬菜 …）
  TextColumn get mainCategory => text().nullable()();

  /// 总耗时（分钟）
  IntColumn get durationMinutes => integer().nullable()();

  TextColumn get difficulty =>
      textEnum<Difficulty>().withDefault(const Constant('easy'))();

  /// 份量基准（配方用量的基准人数）
  IntColumn get baseServings => integer().withDefault(const Constant(2))();

  /// 适宜月份标签 1–12（F12 时令推荐）
  TextColumn get seasonMonths => text()
      .map(const IntListConverter())
      .withDefault(const Constant('[]'))();

  /// 食材 + 调料清单（JSON 数组，见《接口约定.md》2.2）
  TextColumn get ingredients => text()
      .map(const RecipeIngredientListConverter())
      .withDefault(const Constant('[]'))();

  /// 一行简介
  TextColumn get intro => text().nullable()();

  /// 来源：官方 / 用户
  TextColumn get source =>
      textEnum<RecipeSource>().withDefault(const Constant('official'))();

  /// 分享者昵称
  TextColumn get sharerName => text().nullable()();

  DateTimeColumn get sharedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// 表 3 —— 菜式步骤（构想附录 Step；时序规则引擎的输入）
@DataClassName('StepRow')
class Steps extends Table {
  @override
  String get tableName => 'steps';

  IntColumn get id => integer().autoIncrement()();

  IntColumn get recipeId => integer().references(Recipes, #id)();

  /// 序号（从 1 开始）
  IntColumn get orderIndex => integer()();

  /// 大字指令文字
  TextColumn get instruction => text()();

  /// 标准耗时（分钟，支持小数）
  RealColumn get durationMinutes => real().withDefault(const Constant(0))();

  /// 占用资源集合（灶台 / 案板 / 手部操作 / 等待）
  TextColumn get resources => text()
      .map(const StepResourceSetConverter())
      .withDefault(const Constant(''))();

  /// 安全标记
  TextColumn get safetyTag =>
      textEnum<SafetyTag>().withDefault(const Constant('none'))();

  /// 步骤照片流（允许为空）
  TextColumn get photoPaths => text()
      .map(const StringListConverter())
      .withDefault(const Constant('[]'))();

  TextColumn get videoPath => text().nullable()();

  TextColumn get note => text().nullable()();
}

/// 表 4 —— 时序任务（构想附录 ScheduleItem）
@DataClassName('ScheduleItemRow')
class ScheduleItems extends Table {
  @override
  String get tableName => 'schedule_items';

  IntColumn get id => integer().autoIncrement()();

  IntColumn get recipeId => integer().references(Recipes, #id)();

  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();

  /// 份数
  IntColumn get servings => integer().withDefault(const Constant(2))();

  /// 状态：待排 / 已排 / 完成
  TextColumn get status =>
      textEnum<ScheduleStatus>().withDefault(const Constant('pending'))();

  /// 计划开饭时刻（倒推输入）
  DateTimeColumn get plannedFor => dateTime().nullable()();
}

/// 表 5 —— 做菜记录（构想附录 Record）
@DataClassName('RecordRow')
class Records extends Table {
  @override
  String get tableName => 'records';

  IntColumn get id => integer().autoIncrement()();

  IntColumn get recipeId => integer().references(Recipes, #id)();

  /// 完成时间
  DateTimeColumn get completedAt => dateTime()();

  /// 复盘笔记（F14）
  TextColumn get note => text().nullable()();

  /// 本次获得 XP
  IntColumn get xpGained => integer().withDefault(const Constant(0))();
}

/// 表 6 —— 用户档案（构想附录 Profile；单机单用户，恒 1 行）
@DataClassName('ProfileRow')
class Profiles extends Table {
  @override
  String get tableName => 'profiles';

  /// 单用户固定主键（注意：不能与 autoIncrement 同时使用，drift 会抛异常）
  IntColumn get id => integer().withDefault(const Constant(1))();

  TextColumn get nickname => text().withDefault(const Constant('食匣用户'))();

  TextColumn get avatarPath => text().nullable()();

  /// 累计经验值
  IntColumn get xp => integer().withDefault(const Constant(0))();

  /// 累计做过的顿数
  IntColumn get totalMeals => integer().withDefault(const Constant(0))();

  /// 三栏清单：我喜欢的菜式 id
  TextColumn get favoriteRecipeIds => text()
      .map(const IntListConverter())
      .withDefault(const Constant('[]'))();

  /// 三栏清单：我做过的菜式 id
  TextColumn get cookedRecipeIds => text()
      .map(const IntListConverter())
      .withDefault(const Constant('[]'))();

  /// 三栏清单：我想做的菜式 id
  TextColumn get wantedRecipeIds => text()
      .map(const IntListConverter())
      .withDefault(const Constant('[]'))();

  @override
  Set<Column>? get primaryKey => <Column>{id};
}

@DriftDatabase(
  tables: <Type>[Items, Recipes, Steps, ScheduleItems, Records, Profiles],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  /// 内存库 —— 单元测试用
  AppDatabase.memory() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // v1 → v2：items 新增 is_depleted 归零标记（接口约定 v1.1）
      // 组员本地已有 foodbox.sqlite 时无需清库，直接补列。
      if (from < 2) {
        await m.addColumn(items, items.isDepleted);
      }
    },
    beforeOpen: (OpeningDetails details) async {
      // 生熟分离等外键约束依赖它
      await customStatement('PRAGMA foreign_keys = ON');
      if (details.wasCreated) {
        // 单用户档案：默认行必须存在，否则「我的」页面首启为空
        await into(profiles).insert(ProfilesCompanion.insert(id: const Value(1)));
      }
    },
  );

  /// 默认落盘位置：应用支持目录下的 foodbox.sqlite
  ///
  /// F6「数据导出备份」与设置中的存储位置迁移，都通过修改
  /// [DriftNativeOptions.databaseDirectory] 实现，不改动本类其余部分。
  static DatabaseConnection openDefault() {
    return driftDatabase(
      name: 'foodbox',
      native: DriftNativeOptions(
        databaseDirectory: _defaultDatabaseDirectory,
      ),
    );
  }

  static Future<Object> _defaultDatabaseDirectory() =>
      getApplicationSupportDirectory();
}
