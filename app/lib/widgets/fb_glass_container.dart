import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../core/theme.dart';

/// 通用毛玻璃容器
///
/// 用于导航栏、底部 Tab、浮层、Sheet、强调卡片等需要 Apple 磨砂玻璃质感的场景。
class FbGlassContainer extends StatelessWidget {
  const FbGlassContainer({
    super.key,
    required this.child,
    this.blur = FBGlass.blurNav,
    this.color = FBGlass.overlay,
    this.borderRadius,
    this.border,
    this.shadow,
    this.clipBehavior = Clip.antiAlias,
  });

  final Widget child;
  final double blur;
  final Color color;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? shadow;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      clipBehavior: clipBehavior,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
            border: border,
            boxShadow: shadow,
          ),
          child: child,
        ),
      ),
    );
  }
}
