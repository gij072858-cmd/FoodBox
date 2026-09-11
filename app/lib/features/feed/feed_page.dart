import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../widgets/fb_placeholder.dart';

/// 动态（构想 2.5，成员四主攻）
///
/// 期1 范围：UI 完整 + 本地演示数据占位（显著标注"演示数据"），
/// 不实现发布 / 点赞 / 关注 / 服务端同步；真实化在期2 v1.2。
class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FBColor.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: FBSpace.page,
        title: Text('动态', style: FBTextStyle.h2),
      ),
      body: const FbPlaceholder(
        title: '动态 · 敬请期待',
        owner: '成员四',
        milestone: 'W5',
        icon: Icons.explore_outlined,
        points: <String>[
          '信息流骨架 + 发布按钮（期1 按钮仅占位，不实现发布）',
          '5–8 条本地演示数据，页面内显著标注「演示数据」',
          '精致空态设计（占位体验优先于空白页面）',
          '期2 v1.2 真实化：发布 / 点赞收藏 / 关注 / 「调入时序」闭环',
        ],
      ),
    );
  }
}
