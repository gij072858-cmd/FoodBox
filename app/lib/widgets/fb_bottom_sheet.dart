import 'package:flutter/material.dart';

import '../core/theme.dart';

/// Apple 风格底部 Sheet
///
/// 顶部 28px 圆角、抓手、背景 blur。
class FbBottomSheet extends StatelessWidget {
  const FbBottomSheet({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(FBSpace.lg),
    this.showHandle = true,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool showHandle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FBColor.surface,
        borderRadius: FBRadius.topXl,
        boxShadow: FBShadow.modal,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (showHandle)
            Padding(
              padding: const EdgeInsets.only(top: FBSpace.sm, bottom: FBSpace.xs),
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: FBColor.textTertiary,
                  borderRadius: FBRadius.pillAll,
                ),
              ),
            ),
          Padding(padding: padding, child: child),
        ],
      ),
    );
  }
}
