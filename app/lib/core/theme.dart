import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ===========================================================================
/// 食匣 FoodBox 设计系统常量（v2.0 Apple 极简 / 毛玻璃风格）
///
/// 依据：Apple Design Library 约束 + 食匣品牌红。
///
/// 纪律（全组必须遵守）：
///   1. 禁止在页面里硬编码色值、圆角、字号、间距 —— 一律引用本文件常量；
///   2. 期2 深色模式（F5）能做到"零重构上线"，唯一前提就是这条纪律。
///
/// 变更摘要（v2.0）：
///   - 背景由冷灰 #F7F8FA 改为 iOS systemGroupedBackground #F2F2F7；
///   - 文字、图标、分割线全面 Apple 语义化（primary/secondary/tertiary）；
///   - 新增毛玻璃（FBGlass）、阴影（FBShadow）、4pt 间距网格、圆角家族；
///   - 字体层级扩展为 LargeTitle / H1 / H2 / Body / Callout / Caption / Footnote。
/// ===========================================================================

/// 色彩
abstract final class FBColor {
  // ---- 页面背景层（Background）----

  /// 页面底色（iOS systemGroupedBackground）
  static const Color background = Color(0xFFF2F2F7);

  /// 卡片与分组容器（纯白）
  static const Color surface = Color(0xFFFFFFFF);

  /// 第三层背景：输入框、骨架屏、禁用区
  static const Color fill = Color(0xFFE5E5EA);

  /// 毛玻璃浮层底色（约 85% 白）
  static const Color glass = Color(0xD9FFFFFF);

  /// 更浅的毛玻璃底色（约 70% 白）
  static const Color glassLight = Color(0xB3FFFFFF);

  // ---- 品牌强调色 ----

  /// 品牌强调色 —— 食匣红（微调后更沉稳）
  static const Color brand = Color(0xFFE23B25);

  /// 品牌浅填充（激活态、指示器背景）
  static const Color brandLight = Color(0x1FE23B25);

  /// 辅助强调（话题标签、链接型文字）
  static const Color link = Color(0xFF007AFF);

  // ---- 文字（Apple 语义）----

  /// 主文字（87% 黑）
  static const Color textPrimary = Color(0xDE000000);

  /// 次要文字（60% #3C3C43）
  static const Color textSecondary = Color(0x993C3C43);

  /// 占位 / 禁用 / 最弱文字（30% #3C3C43）
  static const Color textTertiary = Color(0x4D3C3C43);

  // ---- 状态色（锚定 Apple system colors）----

  /// 安全 / 完成（倒计时完成、库存充足）
  static const Color success = Color(0xFF34C759);

  /// 成功浅底
  static const Color successLight = Color(0x1F34C759);

  /// 预警（食材临期 ≤3 天）
  static const Color warning = Color(0xFFFF9500);

  /// 危险（食材已过期；复用品牌红，保证克制）
  static const Color danger = Color(0xFFE23B25);

  /// 危险浅底
  static const Color dangerLight = Color(0x1FE23B25);

  // ---- 分割线 / 描边 ----

  /// 半透明分割线（替代原硬 divider）
  static const Color separator = Color(0x99C6C6C8);

  /// 旧版 divider 保留别名，值为 separator
  static const Color divider = separator;

  /// 禁用 / 已用尽灰显
  static const Color disabled = Color(0x4D3C3C43);

  // ---- 卡片底部渐变蒙版 ----

  /// 渐变起点（全透明）
  static const Color maskStart = Color(0x00000000);

  /// 渐变终点（45% 黑）
  static const Color maskEnd = Color(0x73000000);

  // ---- 分类点缀色（低饱和马卡龙；每屏不超过 3 种）----
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
  /// 小组件、标签、小缩略图
  static const double xs = 6;

  /// 按钮、输入框、列表图
  static const double sm = 10;

  /// 标准卡片（Apple 风格 16）
  static const double md = 16;

  /// 大卡片、Sheet 顶部
  static const double lg = 20;

  /// 底部弹层、抽屉内容区顶部
  static const double xl = 28;

  /// 外层卡片（旧版别名，现指向 md）
  static const double card = md;

  /// 卡片内嵌缩略图（旧版别名，现指向 xs）
  static const double thumb = xs;

  /// 按钮与胶囊（全圆角）
  static const double pill = 999;

  static const BorderRadius xsAll = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius smAll = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdAll = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgAll = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius xlAll = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius cardAll = mdAll;
  static const BorderRadius thumbAll = xsAll;
  static const BorderRadius pillAll = BorderRadius.all(Radius.circular(pill));

  /// 顶部大圆角（Sheet / Drawer）
  static const BorderRadius topXl = BorderRadius.only(
    topLeft: Radius.circular(xl),
    topRight: Radius.circular(xl),
  );
}

/// 字体层级（字号）
abstract final class FBText {
  /// 大标题（我的页顶部、空态大标题）
  static const double largeTitle = 28;

  /// H1 页面大标题 / 步骤大字
  static const double h1 = 20;

  /// H2 模块标题 / 卡片标题
  static const double h2 = 17;

  /// 正文（区间 15）
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

  /// 西文/数字行距倍数
  static const double lineHeightTight = 1.25;
}

/// 字体族
abstract final class FBFont {
  /// 默认无衬线字体栈：iOS 自动回退到 SF Pro / PingFang SC
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
}

/// 预设文本样式（直接引用，避免各页各写一套）
abstract final class FBTextStyle {
  static TextStyle get _base => const TextStyle(
    fontFamily: FBFont.sans,
    fontFamilyFallback: FBFont.sansFallback,
    letterSpacing: 0,
  );

  static TextStyle get largeTitle => _base.copyWith(
    fontSize: FBText.largeTitle,
    fontWeight: FontWeight.w700,
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

  /// 按钮文字（Medium 字重）
  static TextStyle get button => _base.copyWith(
    fontSize: FBText.callout,
    fontWeight: FontWeight.w600,
    color: FBColor.textPrimary,
    height: 1,
  );
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

  /// 页面左右边距（旧版别名，提升为 20）
  static const double page = lg;

  /// 卡片间距（旧版别名，提升为 16）
  static const double card = md;

  /// 模块间垂直间距（旧版别名）
  static const double section = xl;

  /// 瀑布流列间距（区间 8）
  static const double waterfall = xs;

  static const EdgeInsets pageH = EdgeInsets.symmetric(horizontal: page);
  static const EdgeInsets pageAll = EdgeInsets.all(page);
}

/// 毛玻璃效果常量
abstract final class FBGlass {
  /// 导航栏 blur 强度
  static const double blurNav = 20.0;

  /// Sheet blur 强度
  static const double blurSheet = 24.0;

  /// Modal blur 强度
  static const double blurModal = 30.0;

  /// 导航栏 / 浮层底色
  static const Color overlay = FBColor.glass;

  /// 更浅的浮层底色
  static const Color overlayLight = FBColor.glassLight;
}

/// 阴影系统
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

  /// 悬浮按钮 / 小浮层
  static List<BoxShadow> get floating => <BoxShadow>[
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.06),
      blurRadius: 16,
      offset: const Offset(0, 6),
    ),
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.03),
      blurRadius: 6,
      offset: const Offset(0, 2),
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

  /// 按钮 / 卡片悬停/按下过渡
  static const Duration quick = Duration(milliseconds: 180);
  static const Curve quickCurve = Curves.easeInOut;
}

/// 图标
abstract final class FBIcon {
  /// 全线性图标 stroke 宽度；激活态填充实色
  static const double stroke = 2;

  /// 底部导航图标大小
  static const double nav = 22;

  /// AppBar 操作图标大小
  static const double appBar = 24;

  /// 列表/卡片图标大小
  static const double list = 20;
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
    final ColorScheme scheme = const ColorScheme(
      brightness: Brightness.light,
      primary: FBColor.brand,
      onPrimary: Colors.white,
      secondary: FBColor.link,
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

  /// 深色主题 —— 期2 F5 落地位。此处先留结构，
  /// 只要页面严格遵守"引用常量"纪律，届时只需补全本方法即可零重构切换。
  static ThemeData dark() {
    final ColorScheme scheme = const ColorScheme(
      brightness: Brightness.dark,
      primary: FBColor.brand,
      onPrimary: Colors.white,
      secondary: FBColor.link,
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
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleSpacing: FBSpace.page,
        titleTextStyle: FBTextStyle.h1,
        iconTheme: IconThemeData(color: FBColor.textPrimary, size: FBIcon.appBar),
        actionsIconTheme: IconThemeData(color: FBColor.textPrimary, size: FBIcon.appBar),
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
      dividerTheme: DividerThemeData(
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
      ),
      textTheme: TextTheme(
        displayLarge: FBTextStyle.largeTitle,
        displayMedium: FBTextStyle.largeTitle,
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
        backgroundColor: const Color(0xE61C1C1E),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: FBRadius.mdAll),
        contentTextStyle: FBTextStyle.body.copyWith(color: Colors.white),
      ),
    );
  }
}
