import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodbox/app.dart';
import 'package:foodbox/core/app_router.dart';

/// 空壳 App 骨架测试（W1 里程碑：双端空壳可运行）
///
/// 覆盖：启动落位、顶部二级 Tab、底部三段式 TabBar、横滑切换、深链直达。
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

    // 初始展示「库」频道内容
    expect(find.text('库 · 现有食材与调料'), findsOneWidget);
  });

  testWidgets('首页顶部二级 Tab 支持左右横滑切换', (WidgetTester tester) async {
    await tester.pumpWidget(bootstrap());
    await tester.pumpAndSettle();

    await tester.drag(find.byType(TabBarView), const Offset(-500, 0));
    await tester.pumpAndSettle();
    expect(find.text('菜式 · 推荐与分类'), findsOneWidget);

    await tester.drag(find.byType(TabBarView), const Offset(-500, 0));
    await tester.pumpAndSettle();
    expect(find.text('时序 · 今天做什么'), findsOneWidget);
  });

  testWidgets('底部 TabBar 三段式可切换到动态与我的', (WidgetTester tester) async {
    await tester.pumpWidget(bootstrap());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('bottom-nav-1')));
    await tester.pumpAndSettle();
    expect(find.text('动态 · 敬请期待'), findsOneWidget);

    await tester.tap(find.byKey(const Key('bottom-nav-2')));
    await tester.pumpAndSettle();
    expect(find.text('我的 · 身份与清单'), findsOneWidget);

    // 切回首页，二级 Tab 状态应保留（IndexedStack 分支独立导航栈）
    await tester.tap(find.byKey(const Key('bottom-nav-0')));
    await tester.pumpAndSettle();
    expect(find.text('库 · 现有食材与调料'), findsOneWidget);
  });

  testWidgets('深链直达 /profile 可正常渲染', (WidgetTester tester) async {
    await tester.pumpWidget(bootstrap(initialLocation: AppRoutes.profile));
    await tester.pumpAndSettle();

    expect(find.text('我的 · 身份与清单'), findsOneWidget);
  });

  testWidgets('首页右上角搜索入口可进入 /home/search 并返回', (WidgetTester tester) async {
    await tester.pumpWidget(bootstrap());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('home-search')));
    await tester.pumpAndSettle();
    expect(find.text('全局搜索'), findsOneWidget);

    await tester.tap(find.byKey(const Key('search-back')));
    await tester.pumpAndSettle();
    expect(find.text('库 · 现有食材与调料'), findsOneWidget);
  });
}
