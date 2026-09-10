import '../models/profile.dart';

/// 用户档案与三栏清单数据访问接口
///
/// 期1 单机单用户（Q12-A），全库恒 1 行档案。
/// 三栏清单（喜欢 / 做过 / 想做）以菜式 id 集合存于档案行内。
abstract interface class ProfileRepository {
  /// 档案流（「我的」页面身份区与 XP 进度条订阅）
  Stream<Profile> watch();

  Future<Profile> get();

  Future<void> save(Profile profile);

  /// XP 结算：累加经验值并可选累加顿数（构想 2.6 数值表）
  Future<void> addXp(int xp, {int mealsDelta = 0});

  /// 三栏清单：喜欢 / 想做 的切换（返回切换后的状态，true = 已在清单中）
  Future<bool> toggleFavorite(int recipeId);

  Future<bool> toggleWanted(int recipeId);

  /// 三栏清单：「我做过」打卡（追加记录并去重）
  Future<void> markCooked(int recipeId);

  /// 长按挪移：把菜式从任一栏挪到目标栏（构想 2.6 第 3 点）
  Future<void> moveTo(
    int recipeId, {
    required bool favorite,
    required bool cooked,
    required bool wanted,
  });
}
