import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_router.dart';
import '../../core/theme.dart';
import 'pages/pantry_tab_page.dart';
import 'pages/recipe_tab_page.dart';
import 'pages/schedule_tab_page.dart';

/// 首页（构想 2.1）
///
/// 结构：
///   - AppBar：毛玻璃质感，顶部二级 Tab「库 / 菜式 / 时序」；
///             右上角搜索图标与「+」快捷录入；
///   - Body：TabBarView，支持左右滑动切换（构想 2.1 手势要求）。
///
/// 说明：二级 Tab 采用页内 TabController 而非独立路由 ——
///      这三个页面是同一层级的"频道"，不是可深链的独立资源；
///      菜式详情、条目详情等真正的资源页由各模块按 [AppRoutes] 追加路由。
///
/// TODO(组长/W2): 库开关（构想 2.2.7）接入后，本 Tab 数需按开关动态为 3 / 2。
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: FBColor.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleSpacing: FBSpace.page,
          title: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: <Widget>[
              Tab(text: '库'),
              Tab(text: '菜式'),
              Tab(text: '时序'),
            ],
          ),
          actions: <Widget>[
            IconButton(
              key: const Key('home-search'),
              tooltip: '搜索',
              color: FBColor.textPrimary,
              onPressed: () => context.go(AppRoutes.search),
              icon: const Icon(Icons.search_rounded),
            ),
            IconButton(
              key: const Key('home-quick-add'),
              tooltip: '快捷录入',
              color: FBColor.textPrimary,
              // TODO(成员二/W3): 跳转手动录入流程；库关闭时本按钮隐藏（构想 2.2.7）
              onPressed: () => _notYet(context, '快捷录入将随库模块在 W3 开放'),
              icon: const Icon(Icons.add_rounded),
            ),
            const SizedBox(width: 4),
          ],
        ),
        body: const TabBarView(
          children: <Widget>[
            PantryTabPage(),
            RecipeTabPage(),
            ScheduleTabPage(),
          ],
        ),
      ),
    );
  }

  void _notYet(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
  }
}
