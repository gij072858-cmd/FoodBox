import 'package:flutter/material.dart';

/// ===========================================================================
/// 食匣 FoodBox 设计系统常量（v1.0 冻结）
///
/// 依据：《01-食匣详细构想》1.3 全局设计规范。
///
/// 纪律（全组必须遵守）：
///   1. 禁止在页面里硬编码色值、圆角、字号、间距 —— 一律引用本文件常量；
///   2. 期2 深色模式（F5）能做到"零重构上线"，唯一前提就是这条纪律。
///
/// 负责人：成员四（设计规范守护者）。本文件接入框架由组长搭建，
///        常量口径的最终裁决权归成员四，变更需在群里同步。
/// ===========================================================================

/// 色彩
abstract final class FBColor {
  /// 页面底色（冷灰）
  static const Color background = Color(0xFFF7F8FA);

  /// 卡片与分组容器
  static const Color surface = Color(0xFFFFFFFF);

  /// 品牌强调色 —— 食匣红（关键操作、激活态、提醒角标）
  static const Color brand = Color(0xFFE8442E);

  /// 辅助强调（话题标签、链接型文字）
  static const Color link = Color(0xFF3B7CFF);

  /// 主文字
  static const Color textPrimary = Color(0xFF1A1A1A);

  /// 次要文字（时间、计数、弱化信息）
  static const Color textSecondary = Color(0xFF8A8F99);

  /// 安全 / 完成（倒计时完成、库存充足）
  static const Color success = Color(0xFF2FA84F);

  /// 预警（食材临期 ≤3 天）
  static const Color warning = Color(0xFFF5A623);

  /// 危险（食材已过期；复用品牌红，保证克制）
  static const Color danger = Color(0xFFE8442E);

  /// 分割线 / 描边
  static const Color divider = Color(0xFFEDEFF2);

  /// 禁用 / 已用尽灰显
  static const Color disabled = Color(0xFFC4C8CF);

  /// 卡片底部渐变蒙版（透明度 0 → 0.65，占卡片下方 40%）
  static const Color maskStart = Color(0x00000000);
  static const Color maskEnd = Color(0xA6000000);

  /// 分类点缀色（低饱和马卡龙；每屏不超过 3 种）
  static const List<Color> categoryAccent = <Color>[
    Color(0xFFBFD8F2), // 浅蓝 · 海鲜
    Color(0xFFF7D3B0), // 浅橙 · 禽肉
    Color(0xFFC7E5C0), // 浅绿 · 蔬菜
    Color(0xFFF2C9D1), // 浅粉 · 畜肉
    Color(0xFFE0D3F0), // 浅紫 · 主食面点
    Color(0xFFF7EBB5), // 浅黄 · 蛋豆制品
  ];
}

/// 圆角系统（嵌套法则：外大内小）
abstract final class FBRadius {
  /// 外层卡片（区间 12–16）
  static const double card = 14;

  /// 卡片内嵌缩略图（区间 6–8）
  static const double thumb = 8;

  /// 按钮与胶囊（全圆角）
  static const double pill = 999;

  static const BorderRadius cardAll = BorderRadius.all(Radius.circular(card));
  static const BorderRadius thumbAll = BorderRadius.all(Radius.circular(thumb));
  static const BorderRadius pillAll = BorderRadius.all(Radius.circular(pill));
}

/// 字体层级（字号）
abstract final class FBText {
  /// H1 页面大标题 / 步骤大字
  static const double h1 = 22;

  /// H2 模块标题（区间 18–20）
  static const double h2 = 20;
  static const double h2Min = 18;

  /// 正文（区间 15–16，行距 1.5 倍）
  static const double body = 15;
  static const double bodyMax = 16;

  /// 辅助（副标题、简介）
  static const double caption = 13;

  /// 弱化（时间、计数、角标）
  static const double micro = 12;

  /// 行距倍数
  static const double lineHeight = 1.5;
}

/// 预设文本样式（直接引用，避免各页各写一套）
abstract final class FBTextStyle {
  static const TextStyle h1 = TextStyle(
    fontSize: FBText.h1,
    fontWeight: FontWeight.bold,
    color: FBColor.textPrimary,
    height: FBText.lineHeight,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: FBText.h2,
    fontWeight: FontWeight.bold,
    color: FBColor.textPrimary,
    height: FBText.lineHeight,
  );

  static const TextStyle body = TextStyle(
    fontSize: FBText.body,
    fontWeight: FontWeight.normal,
    color: FBColor.textPrimary,
    height: FBText.lineHeight,
  );

  static const TextStyle caption = TextStyle(
    fontSize: FBText.caption,
    fontWeight: FontWeight.normal,
    color: FBColor.textPrimary,
    height: FBText.lineHeight,
  );

  static const TextStyle micro = TextStyle(
    fontSize: FBText.micro,
    fontWeight: FontWeight.normal,
    color: FBColor.textSecondary,
    height: FBText.lineHeight,
  );
}

/// 栅格与间距
abstract final class FBSpace {
  /// 页面左右边距
  static const double page = 16;

  /// 卡片间距
  static const double card = 12;

  /// 模块间垂直间距
  static const double section = 24;

  /// 瀑布流列间距（区间 8–10）
  static const double waterfall = 10;

  static const EdgeInsets pageH = EdgeInsets.symmetric(horizontal: page);
  static const EdgeInsets pageAll = EdgeInsets.all(page);
}

/// 动效基调
abstract final class FBMotion {
  /// 页面转场
  static const Duration pageTransition = Duration(milliseconds: 250);
  static const Curve pageCurve = Curves.easeOut;

  /// 卡片按压缩放
  static const double cardPressedScale = 0.97;

  /// 排列模式切换过渡
  static const Duration layoutTransition = Duration(milliseconds: 300);
}

/// 图标
abstract final class FBIcon {
  /// 全线性图标 stroke 宽度；激活态填充实色
  static const double stroke = 2;
}

/// 布局断点（构想 2.7：电脑端转为左侧 NavigationRail）
abstract final class FBBreakpoint {
  /// 宽屏阈值；≥ 该宽度时底部 TabBar 转为 NavigationRail
  static const double wide = 900;
}

/// 主题装配
abstract final class FBTheme {
  /// 浅色主题（期1 唯一启用的主题）
  static ThemeData light() {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: FBColor.brand,
      brightness: Brightness.light,
    ).copyWith(
      primary: FBColor.brand,
      onPrimary: Colors.white,
      secondary: FBColor.link,
      onSecondary: Colors.white,
      surface: FBColor.surface,
      onSurface: FBColor.textPrimary,
      error: FBColor.danger,
      onError: Colors.white,
      outlineVariant: FBColor.divider,
    );
    return _base(scheme);
  }

  /// 深色主题 —— 期2 F5 落地位。此处先留结构，
  /// 只要页面严格遵守"引用常量"纪律，届时只需补全本方法即可零重构切换。
  static ThemeData dark() {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: FBColor.brand,
      brightness: Brightness.dark,
    ).copyWith(
      primary: FBColor.brand,
      onPrimary: Colors.white,
      secondary: FBColor.link,
      error: FBColor.danger,
    );
    return _base(scheme);
  }

  static ThemeData _base(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: FBColor.background,
      splashFactory: InkRipple.splashFactory,
      visualDensity: VisualDensity.standard,
      dividerTheme: const DividerThemeData(
        color: FBColor.divider,
        thickness: 1,
        space: 1,
      ),
      textTheme: const TextTheme(
        headlineLarge: FBTextStyle.h1,
        headlineMedium: FBTextStyle.h2,
        titleLarge: FBTextStyle.h2,
        titleMedium: TextStyle(
          fontSize: FBText.bodyMax,
          fontWeight: FontWeight.w600,
          color: FBColor.textPrimary,
          height: FBText.lineHeight,
        ),
        bodyLarge: FBTextStyle.body,
        bodyMedium: FBTextStyle.body,
        bodySmall: FBTextStyle.caption,
        labelLarge: TextStyle(
          fontSize: FBText.body,
          fontWeight: FontWeight.w600,
          color: FBColor.textPrimary,
        ),
        labelSmall: FBTextStyle.micro,
      ),
    );
  }
}
