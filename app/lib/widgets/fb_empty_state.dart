import 'package:flutter/material.dart';

import '../core/theme.dart';
import 'fb_animations.dart';
import 'fb_pill_button.dart';

/// Apple 风格空态页
///
/// 大图标 + LargeTitle + 说明 + 主操作按钮。
/// 图标带轻微浮动动画，增加呼吸感。
class FbEmptyState extends StatelessWidget {
  const FbEmptyState({
    super.key,
    required this.title,
    this.message,
    this.icon,
    this.actionLabel,
    this.onAction,
    this.subActionLabel,
    this.onSubAction,
  });

  final String title;
  final String? message;
  final IconData? icon;
  final String? actionLabel;
  final VoidCallback? onAction;
  final String? subActionLabel;
  final VoidCallback? onSubAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: FBSpace.pageAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (icon != null)
              FbFloat(
                amplitude: 8,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: FBColor.brandLight,
                    shape: BoxShape.circle,
                    boxShadow: FBShadow.brandGlow,
                  ),
                  child: Icon(icon, size: 36, color: FBColor.brand),
                ),
              ),
            if (icon != null) const SizedBox(height: FBSpace.xl),
            FbFadeInUp(
              delay: const Duration(milliseconds: 100),
              child: Text(
                title,
                style: FBTextStyle.largeTitle,
                textAlign: TextAlign.center,
              ),
            ),
            if (message != null) ...<Widget>[
              const SizedBox(height: FBSpace.sm),
              FbFadeInUp(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  message!,
                  style: FBTextStyle.callout,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            if (actionLabel != null) ...<Widget>[
              const SizedBox(height: FBSpace.xxl),
              FbFadeInUp(
                delay: const Duration(milliseconds: 300),
                child: FbPillButton.primary(
                  label: actionLabel!,
                  onTap: onAction,
                  expanded: false,
                ),
              ),
            ],
            if (subActionLabel != null) ...<Widget>[
              const SizedBox(height: FBSpace.sm),
              FbFadeInUp(
                delay: const Duration(milliseconds: 400),
                child: FbPillButton.ghost(
                  label: subActionLabel!,
                  onTap: onSubAction,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
