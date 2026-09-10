import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/feed/feed_page.dart';
import '../features/home/home_page.dart';
import '../features/home/search_page.dart';
import '../features/profile/profile_page.dart';
import '../features/shell/app_shell.dart';

/// 全局路由路径常量
///
/// 约定：跨模块跳转一律引用本类常量，禁止在页面里写裸字符串路径。
/// 新增路由需在 PR 里说明，涉及共享区的改动按纪律加 `[shared]`。
abstract final class AppRoutes {
  /// 首页（内嵌顶部二级 Tab：库 / 菜式 / 时序）
  static const String home = '/home';

  /// 全局搜索（首页右上角搜索图标）
  static const String search = '/home/search';

  /// 动态（期1 UI 占位）
  static const String feed = '/feed';

  /// 我的
  static const String profile = '/profile';

  // ---- 后续模块页面挂载点（W3 起逐模块填充，路径先占位）----
  /// 库 · 条目详情页
  static const String pantryDetail = '/home/pantry/:id';
}

/// 创建路由表（go_router 声明式路由，双端一致）
///
/// 结构：底部三 Tab 用 [StatefulShellRoute.indexedStack] 各持一条独立导航栈，
/// 保证「在库页面深入几层后切到我的，再切回来位置还在」。
/// 首页顶部的「库 / 菜式 / 时序」是页内二级 Tab（TabBarView，支持横滑），
/// 不单独占路由 —— 具体菜式、条目详情等由各模块后续按 [AppRoutes] 追加。
GoRouter createAppRouter({String initialLocation = AppRoutes.home}) {
  return GoRouter(
    initialLocation: initialLocation,
    debugLogDiagnostics: false,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder:
            (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
            ) => AppShell(navigationShell: navigationShell),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.home,
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage(),
                routes: <RouteBase>[
                  GoRoute(
                    // 相对路径父路径拼接 → /home/search
                    path: 'search',
                    builder: (BuildContext context, GoRouterState state) =>
                        const SearchPage(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.feed,
                builder: (BuildContext context, GoRouterState state) =>
                    const FeedPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.profile,
                builder: (BuildContext context, GoRouterState state) =>
                    const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
