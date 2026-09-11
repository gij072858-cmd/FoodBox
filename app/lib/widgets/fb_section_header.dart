import 'package:flutter/material.dart';

import '../core/theme.dart';

/// 模块标题
///
/// 左侧 17px Semibold 标题，右侧可放置计数/操作 slot。
class FbSectionHeader extends StatelessWidget {
  const FbSectionHeader({
    super.key,
    required this.title,
    this.trailing,
    this.padding = FBSpace.pageH,
  });

  final String title;
  final Widget? trailing;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
            Text(title, style: FBTextStyle.h2),
            ?trailing,
          ],
      ),
    );
  }
}
