import 'package:flutter/material.dart';

import '../core/theme.dart';

/// Apple 风格胶囊按钮
///
/// 支持 primary / secondary / ghost 三种风格，全圆角。
class FbPillButton extends StatelessWidget {
  const FbPillButton.primary({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.height = 36,
  }) : variant = FbPillVariant.primary;

  const FbPillButton.secondary({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.height = 36,
  }) : variant = FbPillVariant.secondary;

  const FbPillButton.ghost({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.height = 36,
  }) : variant = FbPillVariant.ghost;

  final String label;
  final VoidCallback? onTap;
  final IconData? icon;
  final double height;
  final FbPillVariant variant;

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: FBMotion.quick,
        curve: FBMotion.quickCurve,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: FBSpace.md),
        decoration: BoxDecoration(
          color: _background,
          borderRadius: FBRadius.pillAll,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
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
      ),
    );
  }
}

enum FbPillVariant { primary, secondary, ghost }
