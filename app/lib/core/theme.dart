import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ===========================================================================
/// 食匣 FoodBox 设计系统常量（v2.0 Apple 毛玻璃 · 美食氛围版）
///
/// 依据：Apple Design Library + 食匣品牌红 + 食物温暖氛围。
///
/// 纪律（全组必须遵守）：
///   1. 禁止在页面里硬编码色值、圆角、字号、间距 —— 一律引用本文件常量；
///   2. 期2 深色模式（F5）能做到"零重构上线"，唯一前提就是这条纪律。
///
/// 版本口径（与 docs/ 保持一致，**不要在本文件另起版本号**）：
///   - **v2.0**：Apple 毛玻璃设计系统 —— 色彩 / 渐变 / 圆角 / 字体 / 间距 / 阴影 / 毛玻璃；
///   - **v2.1**：动效系统 —— `FBMotion` 时长曲线常量 + `widgets/fb_animations.dart` 组件。
///
/// v2.1 变更摘要：
///   - 动效系统：时长 / 曲线 / 错位 tokens 三层齐备（入口、反馈、过渡），全部收敛到 [FBMotion]；
///   - 色彩深度升级：暖色渐变、食物灵感点缀色、光晕效果色；
///   - 渐变系统：[FBGradient] 提供品牌 / 暖色 / 蒙版 / 进度 / Hero 兜底等预设；
///   - 阴影层次扩充：[FBShadow] 新增 cardHover、cardPressed、brandGlow、hero；
///   - 字体新增 display（34px Heavy）与数字等宽样式 [FBTextStyle.numberDisplay]；
///   - 背景氛围色：[FBColor.glowWarm] / [FBColor.glowBrand] / [FBColor.glowFresh]，配 [FBGradient.heroGlow] 使用。
/// ===========================================================================

/// 色彩系统
abstract final class FBColor {
  // ---- 页面背景层 ----

  /// 页面底色（iOS systemGroupedBackground）
  static const Color background = Color(0xFFF2F2F7);

  /// 暖色背景（食物氛围）：用于 Hero 区、空态、强调页面
  static const Color backgroundWarm = Color(0xFFFFF7F2);

  /// 卡片与分组容器（纯白）
  static const Color surface = Color(0xFFFFFFFF);

  /// 第三层背景：输入框、骨架屏、禁用区
  static const Color fill = Color(0xFFE5E5EA);

  /// 毛玻璃浮层底色（约 85% 白）
  static const Color glass = Color(0xD9FFFFFF);

  /// 更浅的毛玻璃底色（约 70% 白）
  static const Color glassLight = Color(0xB3FFFFFF);

  /// 深色毛玻璃（用于 SnackBar / Toast）
  static const Color glassDark = Color(0xE61C1C1E);

  // ---- 品牌强调色（食匣红家族）----

  /// 品牌主色 —— 食匣红
  static const Color brand = Color(0xFFE23B25);

  /// 品牌深色（按下态、渐变终点）
  static const Color brandDeep = Color(0xFFC72E1A);

  /// 品牌浅色（渐变起点）
  static const Color brandSoft = Color(0xFFFF5A42);

  /// 品牌浅填充（激活态、指示器背景）
  static const Color brandLight = Color(0x1FE23B25);

  /// 品牌光晕（Hero 区发光效果）
  static const Color brandGlow = Color(0x33E23B25);

  // ---- 辅助强调色（食物灵感）----

  /// 暖橙（辅助强调，食物温暖感）
  static const Color warmOrange = Color(0xFFFF8A3D);

  /// 新鲜绿（健康/蔬菜/成功）
  static const Color freshGreen = Color(0xFF32C76E);

  /// 蜂蜜黄（点缀/推荐标签）
  static const Color honeyYellow = Color(0xFFFFB800);

  /// 链接蓝
  static const Color link = Color(0xFF007AFF);

  // ---- 文字（Apple 语义）----

  /// 主文字（87% 黑）
  static const Color textPrimary = Color(0xDE000000);

  /// 次要文字（60% #3C3C43）
  static const Color textSecondary = Color(0x993C3C43);

  /// 占位 / 禁用 / 最弱文字（30% #3C3C43）
  static const Color textTertiary = Color(0x4D3C3C43);

  /// 反色文字（深色背景上的白字）
  static const Color textInverse = Color(0xFFFFFFFF);

  // ---- 状态色 ----

  /// 成功
  static const Color success = Color(0xFF34C759);

  /// 成功浅底
  static const Color successLight = Color(0x1F34C759);

  /// 预警
  static const Color warning = Color(0xFFFF9500);

  /// 预警浅底（图标衬底、提示条背景）
  static const Color warningLight = Color(0x1FFF9500);

  /// 危险
  static const Color danger = Color(0xFFE23B25);

  /// 危险浅底
  static const Color dangerLight = Color(0x1FE23B25);

  // ---- 分割线 / 描边 ----

  /// 半透明分割线
  static const Color separator = Color(0x99C6C6C8);

  /// 旧版 divider 保留别名
  static const Color divider = separator;

  /// 禁用 / 已用尽灰显
  static const Color disabled = Color(0x4D3C3C43);

  // ---- 渐变蒙版 ----

  /// 渐变起点（全透明）
  static const Color maskStart = Color(0x00000000);

  /// 渐变终点（45% 黑）
  static const Color maskEnd = Color(0x73000000);

  /// 渐变终点（60% 黑，Hero 大卡用）
  static const Color maskDeep = Color(0x99000000);

  // ---- 分类点缀色（食物灵感马卡龙）----
  static const List<Color> categoryAccent = <Color>[
    Color(0xFFFFD4C2), // 三文鱼粉 · 海鲜
    Color(0xFFFFE0B8), // 南瓜橙 · 禽肉
    Color(0xFFC8E6C9), // 薄荷绿 · 蔬菜
    Color(0xFFFFCDD2), // 草莓粉 · 畜肉
    Color(0xFFE1BEE7), // 葡萄紫 · 主食面点
    Color(0xFFFFF59D), // 蜂蜜黄 · 蛋豆制品
  ];

  // ---- 背景氛围色（用于 Hero 光晕、装饰斑）----

  /// 暖色光晕
  static const Color glowWarm = Color(0x1AFF8A3D);

  /// 红色光晕
  static const Color glowBrand = Color(0x1AE23B25);

  /// 绿色光晕
  static const Color glowFresh = Color(0x1A34C759);
}

/// 渐变系统
abstract final class FBGradient {
  /// 品牌渐变（按钮、强调元素）
  static const LinearGradient brand = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[FBColor.brandSoft, FBColor.brandDeep],
  );

  /// 暖色渐变（Hero 背景、空态）
  static const LinearGradient warm = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[Color(0xFFFFF7F2), Color(0xFFFFE8DE)],
  );

  /// 暖色 Hero 渐变（我的页身份区等，比 [warm] 更饱和）
  static const LinearGradient warmHero = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[Color(0xFFFFF0E8), Color(0xFFFFE0D0)],
  );

  /// Hero 卡片缺图时的兜底渐变（暖橙），替代加载失败或未提供的图片
  static const LinearGradient heroFallback = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[Color(0xFFFFB199), Color(0xFFFF6B4D)],
  );

  /// Hero 卡片渐变蒙版（从下往上加深）
  static const LinearGradient heroMask = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[FBColor.maskStart, FBColor.maskDeep],
  );

  /// 卡片底部蒙版
  static const LinearGradient cardMask = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[FBColor.maskStart, FBColor.maskEnd],
  );

  /// 进度条渐变（品牌红 → 暖橙）
  static const LinearGradient progress = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[FBColor.brandDeep, FBColor.brandSoft],
  );

  /// 背景氛围径向渐变（用于 Hero 区装饰）
  static RadialGradient heroGlow({
    Color color = FBColor.glowWarm,
    double radius = 1.0,
  }) => RadialGradient(
    radius: radius,
    colors: <Color>[color, Colors.transparent],
  );

  /// 成功渐变
  static const LinearGradient success = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[Color(0xFF52D98A), Color(0xFF32C76E)],
  );

  /// 警告渐变
  static const LinearGradient warning = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[Color(0xFFFFB347), Color(0xFFFF9500)],
  );
}

/// 圆角系统（嵌套法则：外大内小）
abstract final class FBRadius {
  /// 小组件、标签、小缩略图
  static const double xs = 6;

  /// 按钮、输入框、列表图
  static const double sm = 10;

  /// 标准卡片
  static const double md = 16;

  /// 大卡片、Sheet 顶部
  static const double lg = 20;

  /// 底部弹层、抽屉内容区顶部 / Hero 卡片
  static const double xl = 28;

  /// 超大（展示级卡片）
  static const double xxl = 36;

  /// 外层卡片（旧版别名）
  static const double card = md;

  /// 卡片内嵌缩略图（旧版别名）
  static const double thumb = xs;

  /// 按钮与胶囊（全圆角）
  static const double pill = 999;

  static const BorderRadius xsAll = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius smAll = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdAll = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgAll = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius xlAll = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius xxlAll = BorderRadius.all(Radius.circular(xxl));
  static const BorderRadius cardAll = mdAll;
  static const BorderRadius thumbAll = xsAll;
  static const BorderRadius pillAll = BorderRadius.all(Radius.circular(pill));

  /// 顶部大圆角（Sheet / Drawer）
  static const BorderRadius topXl = BorderRadius.only(
    topLeft: Radius.circular(xl),
    topRight: Radius.circular(xl),
  );
}

/// 字体层级
abstract final class FBText {
  /// 展示级大字（Hero 数字、成就数字）
  static const double display = 34;

  /// 大标题（我的页顶部、空态大标题）
  static const double largeTitle = 28;

  /// H1 页面大标题 / 步骤大字
  static const double h1 = 20;

  /// H2 模块标题 / 卡片标题
  static const double h2 = 17;

  /// 正文
  static const double body = 15;

  /// 辅助说明
  static const double callout = 14;

  /// 辅助（副标题、简介）
  static const double caption = 12;

  /// 弱化（时间、计数、角标）
  static const double micro = 11;

  /// 旧版 bodyMax（保留别名）
  static const double bodyMax = 16;

  /// 旧版 h2Min（保留别名）
  static const double h2Min = 16;

  /// 中文行距倍数
  static const double lineHeight = 1.35;

  /// 西文/数字行距倍数（更紧凑）
  static const double lineHeightTight = 1.2;
}

/// 字体族
abstract final class FBFont {
  /// 默认无衬线字体栈
  static const String sans = 'PingFang SC';

  /// 西文优先字体栈
  static const List<String> sansFallback = <String>[
    'SF Pro Text',
    'SF Pro Display',
    '.SF UI Text',
    'Inter',
    'Roboto',
    'Hiragino Sans GB',
    'Microsoft YaHei',
    'sans-serif',
  ];

  /// 数字等宽字体（用于 XP、倒计时、统计数字）
  static const List<String> monoFallback = <String>[
    'SF Mono',
    '.SF Mono',
    'JetBrains Mono',
    'Menlo',
    'monospace',
  ];
}

/// 预设文本样式
abstract final class FBTextStyle {
  static TextStyle get _base => const TextStyle(
    fontFamily: FBFont.sans,
    fontFamilyFallback: FBFont.sansFallback,
    letterSpacing: 0,
  );

  /// 展示级大字（数字、成就）
  static TextStyle get display => _base.copyWith(
    fontSize: FBText.display,
    fontWeight: FontWeight.w900,
    color: FBColor.textPrimary,
    height: FBText.lineHeightTight,
    letterSpacing: -0.5,
  );

  static TextStyle get largeTitle => _base.copyWith(
    fontSize: FBText.largeTitle,
    fontWeight: FontWeight.w800,
    color: FBColor.textPrimary,
    height: FBText.lineHeightTight,
  );

  static TextStyle get h1 => _base.copyWith(
    fontSize: FBText.h1,
    fontWeight: FontWeight.w700,
    color: FBColor.textPrimary,
    height: FBText.lineHeightTight,
  );

  static TextStyle get h2 => _base.copyWith(
    fontSize: FBText.h2,
    fontWeight: FontWeight.w600,
    color: FBColor.textPrimary,
    height: FBText.lineHeight,
  );

  static TextStyle get body => _base.copyWith(
    fontSize: FBText.body,
    fontWeight: FontWeight.w400,
    color: FBColor.textPrimary,
    height: FBText.lineHeight,
  );

  static TextStyle get callout => _base.copyWith(
    fontSize: FBText.callout,
    fontWeight: FontWeight.w400,
    color: FBColor.textSecondary,
    height: FBText.lineHeight,
  );

  static TextStyle get caption => _base.copyWith(
    fontSize: FBText.caption,
    fontWeight: FontWeight.w400,
    color: FBColor.textPrimary,
    height: FBText.lineHeight,
  );

  static TextStyle get micro => _base.copyWith(
    fontSize: FBText.micro,
    fontWeight: FontWeight.w400,
    color: FBColor.textSecondary,
    height: FBText.lineHeight,
  );

  /// 按钮文字
  static TextStyle get button => _base.copyWith(
    fontSize: FBText.callout,
    fontWeight: FontWeight.w600,
    color: FBColor.textPrimary,
    height: 1,
  );

  /// 数字等宽样式（统计、倒计时、XP）
  static TextStyle get numberDisplay => _base.copyWith(
    fontSize: FBText.display,
    fontWeight: FontWeight.w900,
    color: FBColor.textPrimary,
    height: FBText.lineHeightTight,
    fontFamilyFallback: FBFont.monoFallback,
    letterSpacing: -1,
  );

  /// 数字标题样式
  static TextStyle get numberTitle => _base.copyWith(
    fontSize: FBText.h1,
    fontWeight: FontWeight.w700,
    color: FBColor.textPrimary,
    height: FBText.lineHeightTight,
    fontFamilyFallback: FBFont.monoFallback,
  );

  /// 反色文字（深色背景上）
  static TextStyle get h2Inverse => h2.copyWith(color: FBColor.textInverse);
  static TextStyle get calloutInverse => callout.copyWith(color: FBColor.textInverse);
}

/// 栅格与间距（4pt 网格）
abstract final class FBSpace {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;
  static const double xxxxl = 64;

  /// 页面左右边距
  static const double page = lg;

  /// 卡片间距
  static const double card = md;

  /// 模块间垂直间距
  static const double section = xl;

  /// Hero 区上下间距
  static const double hero = xxxl;

  /// 瀑布流列间距
  static const double waterfall = xs;

  static const EdgeInsets pageH = EdgeInsets.symmetric(horizontal: page);
  static const EdgeInsets pageAll = EdgeInsets.all(page);
  static const EdgeInsets heroH = EdgeInsets.symmetric(horizontal: page, vertical: hero);
}

/// 毛玻璃效果常量
abstract final class FBGlass {
  /// 导航栏 blur 强度
  static const double blurNav = 20.0;

  /// Sheet blur 强度
  static const double blurSheet = 24.0;

  /// Modal blur 强度
  static const double blurModal = 30.0;

  /// 轻量 blur（卡片、小浮层）
  static const double blurLight = 12.0;

  /// 导航栏 / 浮层底色
  static const Color overlay = FBColor.glass;

  /// 更浅的浮层底色
  static const Color overlayLight = FBColor.glassLight;

  /// 深色浮层底色（Toast / SnackBar）
  static const Color overlayDark = FBColor.glassDark;
}

/// 阴影系统（多层柔和阴影 + 状态变体）
abstract final class FBShadow {
  /// 卡片默认阴影
  static List<BoxShadow> get card => <BoxShadow>[
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.04),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.02),
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
  ];

  /// 卡片悬浮态阴影（更抬升）
  static List<BoxShadow> get cardHover => <BoxShadow>[
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.08),
      blurRadius: 20,
      offset: const Offset(0, 6),
    ),
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.04),
      blurRadius: 6,
      offset: const Offset(0, 2),
    ),
  ];

  /// 卡片按下态阴影（变矮、变近）
  static List<BoxShadow> get cardPressed => <BoxShadow>[
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.03),
      blurRadius: 4,
      offset: const Offset(0, 1),
    ),
  ];

  /// 悬浮按钮 / 小浮层
  static List<BoxShadow> get floating => <BoxShadow>[
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.08),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.04),
      blurRadius: 8,
      offset: const Offset(0, 3),
    ),
  ];

  /// 底部 Sheet / Modal
  static List<BoxShadow> get modal => <BoxShadow>[
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.08),
      blurRadius: 30,
      offset: const Offset(0, 10),
    ),
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.04),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  /// 头像 / 强调元素
  static List<BoxShadow> get avatar => <BoxShadow>[
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.06),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  /// Hero 卡片阴影（大而柔和）
  static List<BoxShadow> get hero => <BoxShadow>[
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.10),
      blurRadius: 40,
      offset: const Offset(0, 16),
    ),
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.05),
      blurRadius: 16,
      offset: const Offset(0, 6),
    ),
  ];

  /// 品牌光晕（按钮、强调元素的发光效果）
  static List<BoxShadow> get brandGlow => <BoxShadow>[
    BoxShadow(
      color: FBColor.brandGlow,
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];
}

/// 动效系统（时长、曲线、错位节奏）
///
/// 分层：
///   - instant: 100–150ms  即时反馈（按钮、开关）
///   - quick:   200–300ms  状态切换（悬停、菜单、Tab）
///   - normal:  300–500ms  布局变化（Modal、展开）
///   - entrance: 500–800ms 页面入场
abstract final class FBMotion {
  // ---- 时长 ----

  /// 即时反馈
  static const Duration instant = Duration(milliseconds: 120);

  /// 快速过渡
  static const Duration quick = Duration(milliseconds: 200);

  /// 标准过渡
  static const Duration normal = Duration(milliseconds: 350);

  /// 入场动画
  static const Duration entrance = Duration(milliseconds: 600);

  /// 页面转场
  static const Duration pageTransition = Duration(milliseconds: 400);

  /// Hero 元素入场
  static const Duration heroEntrance = Duration(milliseconds: 800);

  /// 列表项错位间隔
  static const Duration staggerStep = Duration(milliseconds: 50);

  /// 最多错位 8 项，之后同时出现（避免长列表拖太久）
  static const int maxStaggerItems = 8;

  // ---- 曲线 ----

  /// 默认退出曲线（自然减速）
  static const Curve easeOut = Cubic(0.16, 1, 0.3, 1);

  /// 更优雅的退出
  static const Curve easeOutQuart = Cubic(0.25, 1, 0.5, 1);

  /// 戏剧性退出
  static const Curve easeOutExpo = Cubic(0.16, 1, 0.3, 1);

  /// 进入曲线
  static const Curve easeIn = Cubic(0.7, 0, 0.84, 0);

  /// 进出曲线（开关类）
  static const Curve easeInOut = Cubic(0.65, 0, 0.35, 1);

  /// 弹性曲线（轻量，仅用于点赞等愉悦反馈）
  static const Curve springLight = Cubic(0.34, 1.2, 0.64, 1);

  // ---- 缩放反馈 ----

  /// 按钮按压缩放
  static const double buttonPressedScale = 0.96;

  /// 卡片按压缩放
  static const double cardPressedScale = 0.98;

  /// 卡片悬浮放大
  static const double cardHoverScale = 1.02;

  /// 图标按钮按下
  static const double iconPressedScale = 0.9;

  // ---- 位移 ----

  /// 入场偏移距离
  static const double entranceOffset = 24;

  /// 按钮按下位移
  static const double buttonPressedY = 1;

  /// 卡片悬浮位移
  static const double cardHoverY = -2;
}

/// 图标
abstract final class FBIcon {
  /// 全线性图标 stroke 宽度
  static const double stroke = 2;

  /// 底部导航图标大小
  static const double nav = 22;

  /// AppBar 操作图标大小
  static const double appBar = 24;

  /// 列表/卡片图标大小
  static const double list = 20;

  /// 小图标（角标、标签内）
  static const double xs = 14;

  /// 大图标（空态、Hero）
  static const double xl = 32;

  /// 超大图标（展示级）
  static const double xxl = 56;
}

/// 布局断点
abstract final class FBBreakpoint {
  /// 宽屏阈值；≥ 该宽度时底部 TabBar 转为 NavigationRail
  static const double wide = 900;
}

/// 主题装配
abstract final class FBTheme {
  /// 浅色主题
  static ThemeData light() {
    const ColorScheme scheme = ColorScheme(
      brightness: Brightness.light,
      primary: FBColor.brand,
      onPrimary: Colors.white,
      secondary: FBColor.warmOrange,
      onSecondary: Colors.white,
      surface: FBColor.surface,
      onSurface: FBColor.textPrimary,
      error: FBColor.danger,
      onError: Colors.white,
      surfaceContainerHighest: FBColor.fill,
      onSurfaceVariant: FBColor.textSecondary,
      outline: FBColor.separator,
      outlineVariant: FBColor.separator,
      shadow: Color(0xFF000000),
    );
    return _base(scheme, Brightness.light);
  }

  /// 深色主题骨架
  static ThemeData dark() {
    const ColorScheme scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: FBColor.brand,
      onPrimary: Colors.white,
      secondary: FBColor.warmOrange,
      onSecondary: Colors.white,
      surface: Color(0xFF1C1C1E),
      onSurface: Colors.white,
      error: FBColor.danger,
      onError: Colors.white,
      surfaceContainerHighest: Color(0xFF2C2C2E),
      onSurfaceVariant: Color(0xFF8E8E93),
      outline: Color(0xFF38383A),
      outlineVariant: Color(0xFF38383A),
      shadow: Color(0xFF000000),
    );
    return _base(scheme, Brightness.dark);
  }

  static ThemeData _base(ColorScheme scheme, Brightness brightness) {
    final bool isLight = brightness == Brightness.light;
    final Color surface = isLight ? FBColor.surface : const Color(0xFF1C1C1E);
    final Color background = isLight ? FBColor.background : const Color(0xFF000000);
    final Color appBarBackground = isLight ? FBColor.glass : const Color(0xD91C1C1E);
    final Color navBackground = isLight ? FBColor.glass : const Color(0xD91C1C1E);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: background,
      splashFactory: NoSplash.splashFactory,
      visualDensity: VisualDensity.standard,
      fontFamily: FBFont.sans,
      fontFamilyFallback: FBFont.sansFallback,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
          TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
        },
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleSpacing: FBSpace.page,
        titleTextStyle: FBTextStyle.h1,
        iconTheme: const IconThemeData(color: FBColor.textPrimary, size: FBIcon.appBar),
        actionsIconTheme: const IconThemeData(color: FBColor.textPrimary, size: FBIcon.appBar),
        systemOverlayStyle: isLight
            ? SystemUiOverlayStyle.dark.copyWith(
                  statusBarColor: Colors.transparent,
                )
            : SystemUiOverlayStyle.light.copyWith(
                  statusBarColor: Colors.transparent,
                ),
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: FBRadius.mdAll),
        margin: EdgeInsets.zero,
        shadowColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: navBackground,
        elevation: 0,
        selectedItemColor: FBColor.brand,
        unselectedItemColor: FBColor.textSecondary,
        selectedLabelStyle: FBTextStyle.micro.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: FBTextStyle.micro,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: surface,
        shape: const RoundedRectangleBorder(borderRadius: FBRadius.topXl),
        elevation: 0,
        clipBehavior: Clip.antiAlias,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: FBColor.fill,
        selectedColor: FBColor.brandLight,
        disabledColor: FBColor.fill,
        labelStyle: FBTextStyle.caption,
        secondaryLabelStyle: FBTextStyle.caption.copyWith(
          color: FBColor.brand,
          fontWeight: FontWeight.w600,
        ),
        padding: const EdgeInsets.symmetric(horizontal: FBSpace.sm, vertical: FBSpace.xxs),
        shape: const RoundedRectangleBorder(borderRadius: FBRadius.pillAll),
        side: BorderSide.none,
      ),
      dividerTheme: const DividerThemeData(
        color: FBColor.separator,
        thickness: 1,
        space: 1,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: FBColor.textPrimary,
        unselectedLabelColor: FBColor.textSecondary,
        labelStyle: FBTextStyle.h2.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: FBTextStyle.h2.copyWith(fontWeight: FontWeight.w500),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(color: FBColor.brand, width: 3),
          borderRadius: BorderRadius.vertical(top: Radius.circular(1.5)),
        ),
        dividerColor: Colors.transparent,
        labelPadding: EdgeInsets.symmetric(horizontal: FBSpace.md),
      ),
      textTheme: TextTheme(
        displayLarge: FBTextStyle.display,
        displayMedium: FBTextStyle.largeTitle,
        displaySmall: FBTextStyle.largeTitle,
        headlineLarge: FBTextStyle.h1,
        headlineMedium: FBTextStyle.h1,
        headlineSmall: FBTextStyle.h2,
        titleLarge: FBTextStyle.h2,
        titleMedium: FBTextStyle.body.copyWith(fontWeight: FontWeight.w600),
        titleSmall: FBTextStyle.callout.copyWith(fontWeight: FontWeight.w600),
        bodyLarge: FBTextStyle.body,
        bodyMedium: FBTextStyle.body,
        bodySmall: FBTextStyle.caption,
        labelLarge: FBTextStyle.button,
        labelMedium: FBTextStyle.caption,
        labelSmall: FBTextStyle.micro,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: FBColor.brand,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: FBSpace.md, vertical: FBSpace.sm),
          shape: const RoundedRectangleBorder(borderRadius: FBRadius.pillAll),
          textStyle: FBTextStyle.button.copyWith(color: Colors.white),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: FBColor.brand,
          textStyle: FBTextStyle.button.copyWith(color: FBColor.brand),
          shape: const RoundedRectangleBorder(borderRadius: FBRadius.pillAll),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: FBColor.textPrimary,
          backgroundColor: FBColor.fill,
          side: BorderSide.none,
          padding: const EdgeInsets.symmetric(horizontal: FBSpace.md, vertical: FBSpace.sm),
          shape: const RoundedRectangleBorder(borderRadius: FBRadius.pillAll),
          textStyle: FBTextStyle.button,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: FBColor.fill,
        contentPadding: const EdgeInsets.symmetric(horizontal: FBSpace.md, vertical: FBSpace.sm),
        border: OutlineInputBorder(
          borderRadius: FBRadius.smAll,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: FBRadius.smAll,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: FBRadius.smAll,
          borderSide: const BorderSide(color: FBColor.brand, width: 1.5),
        ),
        hintStyle: FBTextStyle.body.copyWith(color: FBColor.textTertiary),
        labelStyle: FBTextStyle.callout,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: FBColor.glassDark,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: FBRadius.mdAll),
        contentTextStyle: FBTextStyle.body.copyWith(color: Colors.white),
        elevation: 0,
        width: 280,
        insetPadding: const EdgeInsets.only(bottom: FBSpace.xxl),
      ),
    );
  }
}
