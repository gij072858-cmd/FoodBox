import 'package:flutter/material.dart';

import '../core/theme.dart';

/// Apple 风格 Toast
///
/// 深色半透明圆角胶囊，居中显示。
class FbToast {
  FbToast._();

  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          left: FBSpace.xl,
          right: FBSpace.xl,
          bottom: MediaQuery.paddingOf(context).bottom + FBSpace.xxl,
        ),
        padding: const EdgeInsets.symmetric(vertical: FBSpace.sm, horizontal: FBSpace.md),
        shape: const RoundedRectangleBorder(borderRadius: FBRadius.pillAll),
        backgroundColor: const Color(0xE61C1C1E),
      ),
    );
  }
}
