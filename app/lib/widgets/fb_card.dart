import 'package:flutter/material.dart';

import '../core/theme.dart';
import 'fb_animations.dart';

/// Apple 风格卡片
///
/// 白底、16px 圆角、柔和阴影。支持图片蒙版、按压反馈。
///
/// 动效：
///   - 按下：scale 0.98 + 阴影减弱
///   - 入场：淡入 + 上滑（可选，通过 [fadeInDelay] 开启）
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
    this.fadeInDelay,
    this.heroTag,
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

  /// 入场延迟；为 null 则不入场动画
  final Duration? fadeInDelay;

  /// Hero 动画 tag
  final String? heroTag;

  Widget _buildContent({required List<BoxShadow> boxShadow}) {
    Widget content = Container(
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
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

    if (heroTag != null) {
      content = Hero(tag: heroTag!, child: content);
    }

    return content;
  }

  @override
  Widget build(BuildContext context) {
    Widget card = _buildContent(boxShadow: shadow ?? FBShadow.card);

    if (onTap != null) {
      card = FbPressFeedback(
        onTap: onTap,
        pressedScale: FBMotion.cardPressedScale,
        child: card,
      );
    }

    if (fadeInDelay != null) {
      card = FbFadeInUp(
        delay: fadeInDelay!,
        child: card,
      );
    }

    return card;
  }
}

/// Hero 级大卡片（展示推荐菜式）
class FbHeroCard extends StatelessWidget {
  const FbHeroCard({
    super.key,
    required this.title,
    this.subtitle,
    this.image,
    this.onTap,
    this.tag,
    this.height = 220,
    this.badge,
  });

  final String title;
  final String? subtitle;
  final Widget? image;
  final VoidCallback? onTap;
  final String? tag;
  final double height;
  final Widget? badge;

  @override
  Widget build(BuildContext context) {
    return FbPressFeedback(
      onTap: onTap,
      pressedScale: 0.985,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: FBRadius.xlAll,
          boxShadow: FBShadow.hero,
        ),
        child: ClipRRect(
          borderRadius: FBRadius.xlAll,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              image ??
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color(0xFFFFB199),
                          Color(0xFFFF6B4D),
                        ],
                      ),
                    ),
                  ),
              Container(
                decoration: const BoxDecoration(
                  gradient: FBGradient.heroMask,
                ),
              ),
              if (badge != null)
                Positioned(
                  top: FBSpace.md,
                  left: FBSpace.md,
                  child: badge!,
                ),
              Positioned(
                left: FBSpace.md,
                right: FBSpace.md,
                bottom: FBSpace.md,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (tag != null) ...<Widget>[
                      Text(tag!, style: FBTextStyle.calloutInverse),
                      const SizedBox(height: 2),
                    ],
                    Text(
                      title,
                      style: FBTextStyle.largeTitle.copyWith(
                        color: FBColor.textInverse,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    if (subtitle != null) ...<Widget>[
                      const SizedBox(height: 4),
                      Text(subtitle!, style: FBTextStyle.calloutInverse),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
