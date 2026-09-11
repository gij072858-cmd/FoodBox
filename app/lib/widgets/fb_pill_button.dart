import 'package:flutter/material.dart';

import '../core/theme.dart';
import 'fb_animations.dart';

/// Apple 风格胶囊按钮
///
/// 支持 primary / secondary / ghost 三种风格，全圆角。
///
/// 动效：
///   - 按下：scale 0.96 + 轻微下移
///   - 主按钮带品牌渐变 + 光晕
enum FbPillVariant { primary, secondary, ghost }

class FbPillButton extends StatelessWidget {
  const FbPillButton.primary({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.height = 40,
    this.expanded = false,
  }) : variant = FbPillVariant.primary;

  const FbPillButton.secondary({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.height = 40,
    this.expanded = false,
  }) : variant = FbPillVariant.secondary;

  const FbPillButton.ghost({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.height = 40,
    this.expanded = false,
  }) : variant = FbPillVariant.ghost;

  final String label;
  final VoidCallback? onTap;
  final IconData? icon;
  final double height;
  final bool expanded;
  final FbPillVariant variant;

  Gradient? get _gradient {
    switch (variant) {
      case FbPillVariant.primary:
        return FBGradient.brand;
      case FbPillVariant.secondary:
      case FbPillVariant.ghost:
        return null;
    }
  }

  Color get _background {
    switch (variant) {
      case FbPillVariant.primary:
        return FBColor.brand;
      case FbPillVariant.secondary:
        return FBColor.fill;
      case FbPillVariant.ghost:
        return Colors.transparent;
    }
  }

  Color get _foreground {
    switch (variant) {
      case FbPillVariant.primary:
        return Colors.white;
      case FbPillVariant.secondary:
        return FBColor.textPrimary;
      case FbPillVariant.ghost:
        return FBColor.brand;
    }
  }

  List<BoxShadow> get _shadow {
    switch (variant) {
      case FbPillVariant.primary:
        return FBShadow.brandGlow;
      case FbPillVariant.secondary:
      case FbPillVariant.ghost:
        return const <BoxShadow>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget content = Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: expanded ? 0 : FBSpace.md),
      decoration: BoxDecoration(
        color: _gradient == null ? _background : null,
        gradient: _gradient,
        borderRadius: FBRadius.pillAll,
        boxShadow: _shadow,
      ),
      child: Row(
        mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(icon, size: 16, color: _foreground),
            const SizedBox(width: FBSpace.xs),
          ],
          Text(
            label,
            style: FBTextStyle.button.copyWith(color: _foreground),
          ),
        ],
      ),
    );

    if (onTap == null) {
      return Opacity(opacity: 0.5, child: content);
    }

    return FbPressFeedback(
      onTap: onTap,
      pressedScale: FBMotion.buttonPressedScale,
      pressedY: FBMotion.buttonPressedY,
      child: content,
    );
  }
}
