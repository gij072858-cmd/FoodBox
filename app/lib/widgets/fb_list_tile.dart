import 'package:flutter/material.dart';

import '../core/theme.dart';

/// iOS 风格列表行
///
/// 左图（40×40，圆角 10）+ 标题 + 副标题 + 右箭头/操作 slot。
class FbListTile extends StatelessWidget {
  const FbListTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.showChevron = true,
    this.padding = const EdgeInsets.symmetric(vertical: FBSpace.sm),
  });

  final Widget? leading;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool showChevron;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          if (leading != null) ...<Widget>[
            leading!,
            const SizedBox(width: FBSpace.md),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: FBTextStyle.body.copyWith(fontWeight: FontWeight.w500)),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: FBTextStyle.callout,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
          if (showChevron && trailing == null)
            const Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: FBColor.textTertiary,
            ),
        ],
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
