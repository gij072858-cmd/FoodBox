import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme.dart';
import '../../widgets/fb_animations.dart';
import '../../widgets/fb_glass_container.dart';

/// 底部导航承载壳（v2.1）
///
/// - 三段式「首页 / 动态 / 我的」，毛玻璃质感；
/// - 激活态：底部滑动指示胶囊 + 图标弹跳 + 文字加粗；
/// - 宽屏（≥ [FBBreakpoint.wide]）自动转为左侧 NavigationRail；
/// - 切换 Tab 时带轻微淡入与触觉反馈。
///
/// **切换动画的实现约束（勿改回 AnimatedSwitcher）**：
/// `StatefulNavigationShell` 内部持有 GlobalKey，而 `AnimatedSwitcher` 在过渡期会
/// 同时保留新旧 child —— 同一个 GlobalKey 出现在两处，抛
/// `Duplicate GlobalKey detected in widget tree` 并截断 widget 子树
/// （真机表现为切 Tab 时内容闪断/状态丢失）。
/// 这里改用**重放式淡入**：监听 `currentIndex` 变化，让整块内容淡入一次，
/// 既保留过渡观感，又不会同时存在两份 navigationShell。
class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.navigationShell});

  /// go_router 的分支导航壳，负责保留各 Tab 自己的导航栈
  final StatefulNavigationShell navigationShell;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> with SingleTickerProviderStateMixin {
  static const List<_ShellDestination> _destinations = <_ShellDestination>[
    _ShellDestination(
      label: '首页',
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
    ),
    _ShellDestination(
      label: '动态',
      icon: Icons.explore_outlined,
      activeIcon: Icons.explore_rounded,
    ),
    _ShellDestination(
      label: '我的',
      icon: Icons.person_outline_rounded,
      activeIcon: Icons.person_rounded,
    ),
  ];

  late final AnimationController _switchController;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    // value: 1 —— 首帧即为完成态，启动时不额外播放一次
    _switchController = AnimationController(
      vsync: this,
      duration: FBMotion.normal,
      value: 1,
    );
    final CurvedAnimation curved = CurvedAnimation(
      parent: _switchController,
      curve: FBMotion.easeOutQuart,
    );
    _fade = curved;
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.02),
      end: Offset.zero,
    ).animate(curved);
  }

  @override
  void didUpdateWidget(AppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.navigationShell.currentIndex !=
        widget.navigationShell.currentIndex) {
      _switchController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _switchController.dispose();
    super.dispose();
  }

  void _goBranch(int index) {
    if (index != widget.navigationShell.currentIndex) {
      HapticFeedback.selectionClick();
    }
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool wide = MediaQuery.sizeOf(context).width >= FBBreakpoint.wide;
    if (wide) {
      return _buildWideLayout();
    }
    return Scaffold(
      backgroundColor: FBColor.background,
      body: _buildAnimatedBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  /// 重放式淡入：唯一包含 `navigationShell` 的入口，两侧布局共用
  Widget _buildAnimatedBody() {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: widget.navigationShell,
      ),
    );
  }

  /// 电脑端：左侧导航栏
  Widget _buildWideLayout() {
    return Scaffold(
      backgroundColor: FBColor.background,
      body: Row(
        children: <Widget>[
          FbGlassContainer(
            borderRadius: BorderRadius.zero,
            child: NavigationRail(
              backgroundColor: Colors.transparent,
              selectedIndex: widget.navigationShell.currentIndex,
              onDestinationSelected: _goBranch,
              labelType: NavigationRailLabelType.all,
              indicatorColor: FBColor.brandLight,
              selectedIconTheme: const IconThemeData(color: FBColor.brand),
              unselectedIconTheme: const IconThemeData(
                color: FBColor.textSecondary,
              ),
              selectedLabelTextStyle: FBTextStyle.micro.copyWith(
                fontWeight: FontWeight.w600,
                color: FBColor.brand,
              ),
              unselectedLabelTextStyle: FBTextStyle.micro,
              destinations: _destinations
                  .map(
                    (_ShellDestination d) => NavigationRailDestination(
                      icon: Icon(d.icon),
                      selectedIcon: Icon(d.activeIcon),
                      label: Text(d.label),
                    ),
                  )
                  .toList(growable: false),
            ),
          ),
          const VerticalDivider(width: 1, color: FBColor.separator),
          Expanded(
            child: _buildAnimatedBody(),
          ),
        ],
      ),
    );
  }

  /// 手机端：底部 TabBar + 滑动指示胶囊
  Widget _buildBottomBar() {
    return FbGlassContainer(
      borderRadius: BorderRadius.zero,
      border: const Border(
        top: BorderSide(color: FBColor.separator, width: 0.5),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double itemWidth =
                  constraints.maxWidth / _destinations.length;
              return Stack(
                children: <Widget>[
                  // 滑动指示胶囊
                  AnimatedPositioned(
                    duration: FBMotion.normal,
                    curve: FBMotion.springLight,
                    left: widget.navigationShell.currentIndex * itemWidth +
                        itemWidth / 2 -
                        20,
                    top: 4,
                    child: Container(
                      width: 40,
                      height: 3,
                      decoration: BoxDecoration(
                        color: FBColor.brand,
                        borderRadius: FBRadius.pillAll,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: FBColor.brand.withValues(alpha: 0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Tab 按钮
                  Row(
                    children: List<Widget>.generate(
                      _destinations.length,
                      _buildBottomItem,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBottomItem(int index) {
    final _ShellDestination destination = _destinations[index];
    final bool selected = widget.navigationShell.currentIndex == index;

    return Expanded(
      child: FbPressFeedback(
        pressedScale: 0.9,
        onTap: () => _goBranch(index),
        child: Container(
          color: Colors.transparent,
          key: Key('bottom-nav-$index'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedScale(
                scale: selected ? 1.1 : 1.0,
                duration: FBMotion.quick,
                curve: FBMotion.springLight,
                child: Icon(
                  selected ? destination.activeIcon : destination.icon,
                  size: FBIcon.nav,
                  color: selected ? FBColor.brand : FBColor.textSecondary,
                ),
              ),
              const SizedBox(height: 2),
              AnimatedDefaultTextStyle(
                duration: FBMotion.quick,
                curve: FBMotion.easeInOut,
                style: FBTextStyle.micro.copyWith(
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  color: selected ? FBColor.brand : FBColor.textSecondary,
                ),
                child: Text(destination.label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 底部导航项定义
class _ShellDestination {
  const _ShellDestination({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
}
