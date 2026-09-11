import 'package:flutter/material.dart';

import '../core/theme.dart';

/// Apple 风格卡片
///
/// 白底、16px 圆角、柔和阴影。支持图片蒙版、顶部/底部渐变遮罩。
class FbCard extends StatelessWidget {
  const FbCard({
    super.key,
    required this.child,
    this.height,
    this.margin,
    this.padding = const EdgeInsets.all(FBSpace.md),
    this.backgroundColor = FBColor.surface,
    this.borderRadius = FBRadius.mdAll,
    this.shadow,
    this.onTap,
    this.image,
    this.imageOverlay,
  });

  final Widget child;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final List<BoxShadow>? shadow;
  final VoidCallback? onTap;
  final Widget? image;
  final Widget? imageOverlay;

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow: shadow ?? FBShadow.card,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: image != null
            ? Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  image!,
                  if (imageOverlay != null) imageOverlay!,
                  Padding(padding: padding, child: child),
                ],
              )
            : Padding(padding: padding, child: child),
      ),
    );

    if (onTap != null) {
      content = GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: content,
      );
    }

    return content;
  }
}

/// 卡片底部渐变蒙版
class FbCardImageOverlay extends StatelessWidget {
  const FbCardImageOverlay({
    super.key,
    this.child,
    this.beginColor = FBColor.maskStart,
    this.endColor = FBColor.maskEnd,
  });

  final Widget? child;
  final Color beginColor;
  final Color endColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[beginColor, endColor],
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(FBSpace.md),
      child: child,
    );
  }
}
