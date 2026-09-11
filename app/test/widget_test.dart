import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodbox/app.dart';
import 'package:foodbox/core/app_router.dart';
import 'package:foodbox/features/feed/feed_page.dart';
import 'package:foodbox/features/home/pages/pantry_tab_page.dart';
import 'package:foodbox/features/home/pages/recipe_tab_page.dart';
import 'package:foodbox/features/home/pages/schedule_tab_page.dart';
import 'package:foodbox/features/profile/profile_page.dart';

/// 导航骨架测试（W1 里程碑：双端空壳可运行）
///
/// 覆盖：启动落位、顶部二级 Tab、底部三段式 TabBar、横滑切换、深链直达。
///
/// 修订说明（W1 收官）：原断言绑定 `FbPlaceholder` 的占位文案
/// （「库 · 现有食材与调料」「我的 · 身份与清单」），库页与我的页在 v2.0/v2.1
/// 精修后已接入真实内容，这些文案不复存在，导致 3 个用例长期报红。
/// 现改为断言**页面类型**——不受后续文案调整影响；
/// 仅「库 / 菜式 / 时序」Tab 标签与「全局搜索」这类稳定文案保留文本断言。
void main() {
  Widget bootstrap({String initialLocation = AppRoutes.home}) {
    return ProviderScope(
      child: FoodBoxApp(
        router: createAppRouter(initialLocation: initialLocation),
      ),
    );
  }

  testWidgets('启动后落在首页，顶部「库 / 菜式 / 时序」三个二级 Tab 就位', (WidgetTester tester) async {
    await tester.pumpWidget(bootstrap());
    await tester.pumpAndSettle();

    expect(find.text('库'), findsOneWidget);
    expect(find.text('菜式'), findsOneWidget);
    expect(find.text('时序'), findsOneWidget);

    // 初始展示「库」频道（该页已接入真实内容，不再依赖占位文案）
    expect(find.byType(PantryTabPage), findsOneWidget);
  });

  testWidgets('首页顶部二级 Tab 支持左右横滑切换', (WidgetTester tester) async {
    await tester.pumpWidget(bootstrap());
    await tester.pumpAndSettle();

    await tester.drag(find.byType(TabBarView), const Offset(-500, 0));
    await tester.pumpAndSettle();
    expect(find.byType(RecipeTabPage), findsOneWidget);

    await tester.drag(find.byType(TabBarView), const Offset(-500, 0));
    await tester.pumpAndSettle();
    expect(find.byType(ScheduleTabPage), findsOneWidget);
  });

  testWidgets('底部 TabBar 三段式可切换到动态与我的', (WidgetTester tester) async {
    await tester.pumpWidget(bootstrap());
    await tester.pumpAndSettle();

    expect(find.byType(PantryTabPage), findsOneWidget);

    await tester.tap(find.byKey(const Key('bottom-nav-1')));
    await tester.pumpAndSettle();
    expect(find.byType(FeedPage), findsOneWidget);

    // 「我的」页身份区含 FbFloat 循环动效，pumpAndSettle 永不收敛 → 改用定时 pump
    await tester.tap(find.byKey(const Key('bottom-nav-2')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.byType(ProfilePage), findsOneWidget);

    // 切回首页，二级 Tab 状态应保留（IndexedStack 分支独立导航栈）
    await tester.tap(find.byKey(const Key('bottom-nav-0')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.byType(PantryTabPage), findsOneWidget);
  });

  testWidgets('深链直达 /profile 可正常渲染', (WidgetTester tester) async {
    await tester.pumpWidget(bootstrap(initialLocation: AppRoutes.profile));
    // 身份区含 FbFloat 循环动效 → 用定时 pump 而非 pumpAndSettle
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 800));

    expect(find.byType(ProfilePage), findsOneWidget);
  });

  testWidgets('首页右上角搜索入口可进入 /home/search 并返回', (WidgetTester tester) async {
    await tester.pumpWidget(bootstrap());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('home-search')));
    await tester.pumpAndSettle();
    expect(find.text('全局搜索'), findsOneWidget);

    await tester.tap(find.byKey(const Key('search-back')));
    await tester.pumpAndSettle();
    expect(find.byType(PantryTabPage), findsOneWidget);
  });
}
