import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/local/database.dart';

/// ===========================================================================
/// 全局依赖注入（Riverpod）
///
/// W1 仅提供数据库单例；W2 起在此追加各 Repository 的 Provider：
///   pantryRepositoryProvider → PantryRepository
///   recipeRepositoryProvider → RecipeRepository
///   scheduleRepositoryProvider → ScheduleRepository
///   profileRepositoryProvider → ProfileRepository
///
/// 页面一律通过 `ref.read/watch(xxxRepositoryProvider)` 取数据，
/// 这样期2 换成云端实现时，只需替换 Provider 的实现类，页面零改动。
/// ===========================================================================

/// 本地数据库单例（懒加载：首次读取时才真正打开文件）
final Provider<AppDatabase> appDatabaseProvider = Provider<AppDatabase>((
  Ref ref,
) {
  final AppDatabase database = AppDatabase(AppDatabase.openDefault());
  ref.onDispose(database.close);
  return database;
});
