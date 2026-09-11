import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'core/app_router.dart';
import 'core/theme.dart';

/// 应用根组件
///
/// 主题一律通过 [FBTheme.light] 装配；页面内禁止硬编码色值（见 core/theme.dart）。
class FoodBoxApp extends StatefulWidget {
  const FoodBoxApp({super.key, this.router});

  /// 便于测试注入起始路由；正式运行传 null 使用默认路由表
  final GoRouter? router;

  @override
  State<FoodBoxApp> createState() => _FoodBoxAppState();
}

class _FoodBoxAppState extends State<FoodBoxApp> {
  /// 路由只创建一次：热重载 / 重建不得重置导航栈
  late final GoRouter _router = widget.router ?? createAppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '食匣 FoodBox',
      debugShowCheckedModeBanner: false,
      theme: FBTheme.light(),
      routerConfig: _router,
      locale: const Locale('zh', 'CN'),
      supportedLocales: const <Locale>[Locale('zh', 'CN'), Locale('en', 'US')],
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // 取消 Android 默认 overscroll glow，统一为 iOS 弹性滚动
      scrollBehavior: const _FoodBoxScrollBehavior(),
      builder: (BuildContext context, Widget? child) {
        return CupertinoTheme(
          data: const CupertinoThemeData(
            primaryColor: FBColor.brand,
            barBackgroundColor: FBColor.glass,
            scaffoldBackgroundColor: FBColor.background,
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}

/// 统一滚动行为：iOS 弹性 + 无 glow
class _FoodBoxScrollBehavior extends ScrollBehavior {
  const _FoodBoxScrollBehavior();

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
