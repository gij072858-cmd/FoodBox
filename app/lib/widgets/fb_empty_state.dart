import 'package:flutter/material.dart';

import '../core/theme.dart';
import 'fb_pill_button.dart';

/// Apple 风格空态页
///
/// 大图标 + LargeTitle + 说明 + 主操作按钮。
class FbEmptyState extends StatelessWidget {
  const FbEmptyState({
    super.key,
    required this.title,
    this.message,
    this.icon,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String? message;
  final IconData? icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: FBSpace.pageAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (icon != null)
              Icon(icon, size: 56, color: FBColor.textTertiary),
            if (icon != null) const SizedBox(height: FBSpace.lg),
            Text(title, style: FBTextStyle.largeTitle, textAlign: TextAlign.center),
            if (message != null) ...<Widget>[
              const SizedBox(height: FBSpace.sm),
              Text(
                message!,
                style: FBTextStyle.callout,
                textAlign: TextAlign.center,
              ),
            ],
            if (actionLabel != null) ...<Widget>[
              const SizedBox(height: FBSpace.xl),
              FbPillButton.primary(label: actionLabel!, onTap: onAction),
            ],
          ],
        ),
      ),
    );
  }
}
