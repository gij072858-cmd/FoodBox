import 'package:flutter/material.dart';

import '../../../widgets/fb_placeholder.dart';

/// 库 · 现有食材与调料（构想 2.2，成员二主攻）
///
/// W1 仅落地页面骨架；本节顶部标题行、双分区、排列切换等由成员二在 W3 实现。
class PantryTabPage extends StatelessWidget {
  const PantryTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FbPlaceholder(
      title: '库 · 现有食材与调料',
      owner: '成员二',
      milestone: 'W3',
      icon: Icons.kitchen_outlined,
      points: <String>[
        '上半区「现有食材」+ 下半区「现有调料」，各自独立滚动',
        '默认 3:4 大卡片水平轮转（闲置自动滚动、触碰暂停，组件由成员四 W2 打样）',
        '排列模式切换：水平大卡 ⇄ 竖直紧凑列表（300ms 过渡）',
        '卡片详情页：顶部大图 → 有效期区 → 简介四段 → 操作区',
        '手动录入与扫码录入（预置条码 + 未命中自学习记忆）',
      ],
    );
  }
}
