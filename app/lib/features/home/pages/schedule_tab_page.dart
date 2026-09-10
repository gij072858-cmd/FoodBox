import 'package:flutter/material.dart';

import '../../../widgets/fb_placeholder.dart';

/// 时序 · 今天做什么（构想 2.4，组长主攻）
///
/// 期1 技术重心所在。W1 仅落地页面骨架；
/// 待做清单在 W3 算法草案评审后、W5–W6 完成引擎与执行页。
class ScheduleTabPage extends StatelessWidget {
  const ScheduleTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FbPlaceholder(
      title: '时序 · 今天做什么',
      owner: '组长',
      milestone: 'W5–W6',
      icon: Icons.timeline_rounded,
      points: <String>[
        '三态页面：待做清单（可移除 / 调份数）→ 排程结果预览 → 歌词滚动执行视图',
        '规则引擎 v1：贪心初排 + 安全校正（生熟分离 / 同灶台互斥 / 腌制前置）+ 衔接校正 + 10% 缓冲',
        '开饭时间倒推：输入 18:00 即算出"几点开始动手"（Q7-A 期1 必做）',
        '步骤拖拽调整：拖后重算时刻并校验安全规则，违规震动 + 红条提示并回弹（Q8-A）',
        '执行完成闭环：扣库存 → 写做菜记录 → XP 结算与厨阶更新',
      ],
    );
  }
}
