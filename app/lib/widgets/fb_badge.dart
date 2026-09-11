import 'package:flutter/material.dart';

import '../core/theme.dart';

/// 角标组件
///
/// 支持小圆点或数字胶囊。
class FbBadge extends StatelessWidget {
  const FbBadge.dot({super.key})
      : count = null,
        size = 8;

  const FbBadge.count(this.count, {super.key})
      : size = null;

  final int? count;
  final double? size;

  @override
  Widget build(BuildContext context) {
    if (size != null) {
      return Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: FBColor.brand,
          shape: BoxShape.circle,
        ),
      );
    }

    final String text = count == null || count! > 99 ? '99+' : '$count';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: const BoxDecoration(
        color: FBColor.brand,
        borderRadius: FBRadius.pillAll,
      ),
      child: Text(
        text,
        style: FBTextStyle.micro.copyWith(
          color: FBColor.textInverse,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
