import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/local/database.dart';
import '../data/repositories/impl/local_pantry_repository.dart';
import '../data/repositories/impl/local_profile_repository.dart';
import '../data/repositories/impl/local_recipe_repository.dart';
import '../data/repositories/impl/local_schedule_repository.dart';
import '../data/repositories/pantry_repository.dart';
import '../data/repositories/profile_repository.dart';
import '../data/repositories/recipe_repository.dart';
import '../data/repositories/schedule_repository.dart';

/// ===========================================================================
/// 全局依赖注入（Riverpod）
///
/// 页面一律通过 `ref.watch(xxxRepositoryProvider)` / `ref.read(xxxRepositoryProvider)`
/// 取数据，**不得直接 import 数据库**（总计划第七章纪律 2）。
///
/// 期2 上云时只需把下面的实现类从 `LocalXxxRepository` 换成
/// `SupabaseXxxRepository`，接口类型与全部页面代码零改动。
/// ===========================================================================

/// 本地数据库单例（懒加载：首次读取时才真正打开文件）
final Provider<AppDatabase> appDatabaseProvider = Provider<AppDatabase>((
  Ref ref,
) {
  final AppDatabase database = AppDatabase(AppDatabase.openDefault());
  ref.onDispose(database.close);
  return database;
});

// ============================ Repository（W2 落地） ============================

/// 库（食材 / 调料）—— 成员二的库页面、组长的推荐算法都从这里取数
final Provider<PantryRepository> pantryRepositoryProvider =
    Provider<PantryRepository>(
  (Ref ref) => LocalPantryRepository(ref.watch(appDatabaseProvider)),
);

/// 菜式与步骤 —— 成员三的菜式页
final Provider<RecipeRepository> recipeRepositoryProvider =
    Provider<RecipeRepository>(
  (Ref ref) => LocalRecipeRepository(ref.watch(appDatabaseProvider)),
);

/// 时序待做清单 —— 组长的时序模块，成员三「长按加入时序」也调它
final Provider<ScheduleRepository> scheduleRepositoryProvider =
    Provider<ScheduleRepository>(
  (Ref ref) => LocalScheduleRepository(ref.watch(appDatabaseProvider)),
);

/// 用户档案与三栏清单 —— 成员四的「我的」页面
final Provider<ProfileRepository> profileRepositoryProvider =
    Provider<ProfileRepository>(
  (Ref ref) => LocalProfileRepository(ref.watch(appDatabaseProvider)),
);
