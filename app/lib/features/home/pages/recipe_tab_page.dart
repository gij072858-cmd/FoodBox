import 'package:flutter/material.dart';

import '../../../widgets/fb_placeholder.dart';

/// 菜式 · 推荐与分类（构想 2.3，成员三主攻）
///
/// W1 仅落地页面骨架；推荐区与分类歌单由成员三在 W4 实现，
/// 推荐数据来源为组长 W4 交付的 `RecipeMatcher.matchAll`。
class RecipeTabPage extends StatelessWidget {
  const RecipeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FbPlaceholder(
      title: '菜式 · 推荐与分类',
      owner: '成员三',
      milestone: 'W4',
      icon: Icons.restaurant_menu_rounded,
      points: <String>[
        '上半区推荐横滑：绿点=现在就能做、橙点=差一点（缺 ≤2 种），蒙版标注缺失项',
        '下半区分类歌单：按主食材 / 按菜系 双维度，点进为歌单式列表页',
        '菜式详情页：成品大图 → 标题胶囊 → 缺失食材区 → 清单（份量换算）→ 步骤流',
        '长按卡片加入时序（只调 ScheduleRepository.add，不关心时序实现）',
        '步骤分割线点击唤出倒计时条（复用成员四的 CountdownBar）',
      ],
    );
  }
}
