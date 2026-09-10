import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme.dart';

/// 底部导航承载壳（构想 2.1）
///
/// - 极简三段式「首页 / 动态 / 我的」，无描边；
/// - 图标线性，激活态实心加粗、文字加粗；
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
          NavigationRail(
            backgroundColor: FBColor.surface,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _goBranch,
            labelType: NavigationRailLabelType.all,
            indicatorColor: FBColor.brand.withValues(alpha: 0.12),
            selectedIconTheme: const IconThemeData(color: FBColor.brand),
            unselectedIconTheme: const IconThemeData(
              color: FBColor.textSecondary,
            ),
            selectedLabelTextStyle: const TextStyle(
              fontSize: FBText.micro,
              fontWeight: FontWeight.bold,
              color: FBColor.brand,
            ),
            unselectedLabelTextStyle: const TextStyle(
              fontSize: FBText.micro,
              color: FBColor.textSecondary,
            ),
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
          const VerticalDivider(width: 1, color: FBColor.divider),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }

  /// 手机端：极简三段式底部 TabBar
  Widget _buildBottomBar() {
    return Container(
      decoration: const BoxDecoration(
        color: FBColor.surface,
        border: Border(top: BorderSide(color: FBColor.divider)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 56,
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
      child: InkWell(
        key: Key('bottom-nav-$index'),
        onTap: () => _goBranch(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(selected ? destination.activeIcon : destination.icon, size: 22, color: color),
            const SizedBox(height: 2),
            Text(
              destination.label,
              style: TextStyle(
                fontSize: FBText.micro,
                fontWeight: selected ? FontWeight.bold : FontWeight.w500,
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
