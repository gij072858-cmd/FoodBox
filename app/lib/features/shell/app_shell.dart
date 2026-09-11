import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme.dart';
import '../../widgets/fb_glass_container.dart';

/// 底部导航承载壳（构想 2.1）
///
/// - 极简三段式「首页 / 动态 / 我的」，无描边；
/// - 图标线性，激活态实心加粗、文字加粗；
/// - 底部导航与宽屏 NavigationRail 均采用 Apple 毛玻璃质感；
/// - 宽屏（≥ [FBBreakpoint.wide]）按构想 2.7 自动转为左侧 NavigationRail。
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  /// go_router 的分支导航壳，负责保留各 Tab 自己的导航栈
  final StatefulNavigationShell navigationShell;

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

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // 再次点击当前 Tab → 回到该分支的初始页面
      initialLocation: index == navigationShell.currentIndex,
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
      body: navigationShell,
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  /// 电脑端：左侧导航栏（构想 2.7）
  Widget _buildWideLayout() {
    return Scaffold(
      backgroundColor: FBColor.background,
      body: Row(
        children: <Widget>[
          FbGlassContainer(
            borderRadius: BorderRadius.zero,
            child: NavigationRail(
              backgroundColor: Colors.transparent,
              selectedIndex: navigationShell.currentIndex,
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
          Expanded(child: navigationShell),
        ],
      ),
    );
  }

  /// 手机端：极简三段式底部 TabBar
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
          child: Row(
            children: List<Widget>.generate(
              _destinations.length,
              _buildBottomItem,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomItem(int index) {
    final _ShellDestination destination = _destinations[index];
    final bool selected = navigationShell.currentIndex == index;
    final Color color = selected ? FBColor.brand : FBColor.textSecondary;

    return Expanded(
      child: GestureDetector(
        key: Key('bottom-nav-$index'),
        onTap: () => _goBranch(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              selected ? destination.activeIcon : destination.icon,
              size: FBIcon.nav,
              color: color,
            ),
            const SizedBox(height: 2),
            Text(
              destination.label,
              style: FBTextStyle.micro.copyWith(
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
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
