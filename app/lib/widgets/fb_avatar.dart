import 'package:flutter/material.dart';

import '../core/theme.dart';

/// 圆形头像
///
/// 支持尺寸、白色描边、柔和阴影，右下角可放徽章 slot。
class FbAvatar extends StatelessWidget {
  const FbAvatar({
    super.key,
    this.image,
    this.size = 80,
    this.borderWidth = 3,
    this.badge,
  });

  final Widget? image;
  final double size;
  final double borderWidth;
  final Widget? badge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: FBColor.fill,
              shape: BoxShape.circle,
              border: Border.all(color: FBColor.surface, width: borderWidth),
              boxShadow: FBShadow.avatar,
              image: image != null
                  ? null
                  : null,
            ),
            child: ClipOval(child: image ?? _defaultContent()),
          ),
          if (badge != null)
            Positioned(
              right: 0,
              bottom: 0,
              child: badge!,
            ),
        ],
      ),
    );
  }

  Widget _defaultContent() {
    return Center(
      child: Icon(
        Icons.person_rounded,
        size: size * 0.4,
        color: FBColor.textTertiary,
      ),
    );
  }
}
