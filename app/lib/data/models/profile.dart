/// 厨阶等级定义（构想 2.6 / Q9-B 定稿数值表）
///
/// 说明：数值为初版，概要设计阶段可微调；调整须同步《接口约定.md》。
class CookLevel {
  const CookLevel({
    required this.level,
    required this.title,
    required this.requiredXp,
  });

  /// 等级序号
  final int level;

  /// 厨阶名称
  final String title;

  /// 达到该等级所需累计 XP
  final int requiredXp;

  @override
  String toString() => 'Lv$level $title($requiredXp)';
}

/// 用户档案（领域模型）
///
/// 对应数据表 `profiles`；纯单机单用户（Q12-A），全库恒为 1 行（id = 1）。
class Profile {
  const Profile({
    this.id = 1,
    this.nickname = '食匣用户',
    this.avatarPath,
    this.xp = 0,
    this.totalMeals = 0,
    this.favoriteRecipeIds = const <int>[],
    this.cookedRecipeIds = const <int>[],
    this.wantedRecipeIds = const <int>[],
  });

  /// 单用户固定主键
  final int id;

  final String nickname;
  final String? avatarPath;

  /// 累计经验值
  final int xp;

  /// 累计做过几顿饭（「我的」身份区展示）
  final int totalMeals;

  /// 三栏清单（构想 2.6）：我喜欢的菜式
  final List<int> favoriteRecipeIds;

  /// 我做过的菜式
  final List<int> cookedRecipeIds;

  /// 我想做的菜式
  final List<int> wantedRecipeIds;

  /// 厨阶等级表（构想 2.6 定稿数值）
  static const List<CookLevel> ladder = <CookLevel>[
    CookLevel(level: 1, title: '见习厨工', requiredXp: 0),
    CookLevel(level: 2, title: '帮厨', requiredXp: 50),
    CookLevel(level: 3, title: '掌勺新手', requiredXp: 120),
    CookLevel(level: 4, title: '灶台好手', requiredXp: 220),
    CookLevel(level: 5, title: '家庭大厨', requiredXp: 360),
    CookLevel(level: 6, title: '风味行家', requiredXp: 550),
    CookLevel(level: 7, title: '食匣主厨', requiredXp: 800),
  ];

  /// XP 结算规则（构想 2.6 定稿）
  static const int xpPerScheduleFlow = 20; // 完成一次时序流程
  static const int xpFirstCookDish = 10; // 首次完成某道菜
  static const int xpRepeatCookDish = 5; // 重复做过
  static const int xpDailyStreak = 5; // 连续做饭每日
  static const int xpPerTenItems = 5; // 累计录入食材每 10 条

  /// 依据累计 XP 求当前厨阶
  static CookLevel levelOf(int xp) {
    CookLevel current = ladder.first;
    for (final CookLevel level in ladder) {
      if (xp >= level.requiredXp) {
        current = level;
      } else {
        break;
      }
    }
    return current;
  }

  /// 下一厨阶；已满级返回 null
  static CookLevel? nextLevelOf(int xp) {
    for (final CookLevel level in ladder) {
      if (xp < level.requiredXp) return level;
    }
    return null;
  }

  /// 当前厨阶
  CookLevel get level => levelOf(xp);

  /// 距离下一级还差多少 XP（满级返回 0）
  int get xpToNextLevel {
    final CookLevel? next = nextLevelOf(xp);
    if (next == null) return 0;
    return next.requiredXp - xp;
  }

  /// 当前等级内的进度（0.0–1.0），满级恒为 1.0
  double get levelProgress {
    final CookLevel? next = nextLevelOf(xp);
    if (next == null) return 1;
    final int start = level.requiredXp;
    final int span = next.requiredXp - start;
    if (span <= 0) return 1;
    final double value = (xp - start) / span;
    return value.clamp(0.0, 1.0);
  }

  Profile copyWith({
    int? id,
    String? nickname,
    String? avatarPath,
    int? xp,
    int? totalMeals,
    List<int>? favoriteRecipeIds,
    List<int>? cookedRecipeIds,
    List<int>? wantedRecipeIds,
  }) {
    return Profile(
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
  String toString() => 'Profile($nickname, Lv${level.level} ${level.title}, $xp XP)';
}
