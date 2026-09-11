import 'package:flutter/material.dart';

import '../core/theme.dart';
import 'fb_avatar.dart';
import 'fb_badge.dart';
import 'fb_card.dart';
import 'fb_empty_state.dart';
import 'fb_glass_container.dart';
import 'fb_list_tile.dart';
import 'fb_pill_button.dart';
import 'fb_section_header.dart';

/// 组件 Showcase 页
///
/// 集中展示所有 Apple 风格公共组件，作为 UI 走查基准。
class ShowcasePage extends StatelessWidget {
  const ShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FBColor.background,
      appBar: AppBar(title: const Text('组件 Showcase')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: FBSpace.lg),
        children: <Widget>[
          const FbSectionHeader(title: '字体层级'),
          _section(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('LargeTitle 28px', style: FBTextStyle.largeTitle),
                Text('H1 20px', style: FBTextStyle.h1),
                Text('H2 17px Semibold', style: FBTextStyle.h2),
                Text('Body 15px', style: FBTextStyle.body),
                Text('Callout 14px', style: FBTextStyle.callout),
                Text('Caption 12px', style: FBTextStyle.caption),
                Text('Micro 11px', style: FBTextStyle.micro),
              ],
            ),
          ),
          const FbSectionHeader(title: '按钮'),
          _section(
            child: const Wrap(
              spacing: FBSpace.sm,
              runSpacing: FBSpace.sm,
              children: <Widget>[
                FbPillButton.primary(label: '主要'),
                FbPillButton.secondary(label: '次要'),
                FbPillButton.ghost(label: '文字'),
              ],
            ),
          ),
          const FbSectionHeader(title: '卡片'),
          _section(
            child: Column(
              children: <Widget>[
                FbCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('标准卡片', style: FBTextStyle.h2),
                      const SizedBox(height: FBSpace.xs),
                      Text('白底、16px 圆角、柔和阴影', style: FBTextStyle.callout),
                    ],
                  ),
                ),
                const SizedBox(height: FBSpace.md),
                FbCard(
                  height: 160,
                  image: Container(color: FBColor.categoryAccent[2]),
                  imageOverlay: FbCardImageOverlay(
                    child: Text('图片卡片', style: FBTextStyle.h2),
                  ),
                  child: const SizedBox.shrink(),
                ),
              ],
            ),
          ),
          const FbSectionHeader(title: '列表行'),
          _section(
            child: Column(
              children: <Widget>[
                FbListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: FBColor.fill,
                      borderRadius: FBRadius.smAll,
                    ),
                  ),
                  title: '列表标题',
                  subtitle: '辅助说明文字',
                  onTap: () {},
                ),
                const FbListTile(
                  leading: Icon(Icons.settings_rounded, color: FBColor.textSecondary),
                  title: '设置项',
                  subtitle: '带右箭头',
                ),
              ],
            ),
          ),
          const FbSectionHeader(title: '毛玻璃'),
          _section(
            child: FbGlassContainer(
              borderRadius: FBRadius.mdAll,
              child: Container(
                height: 80,
                alignment: Alignment.center,
                child: Text('Glass Container', style: FBTextStyle.h2),
              ),
            ),
          ),
          const FbSectionHeader(title: '头像与角标'),
          _section(
            child: const Row(
              children: <Widget>[
                FbAvatar(size: 56),
                SizedBox(width: FBSpace.md),
                FbBadge.dot(),
                SizedBox(width: FBSpace.md),
                FbBadge.count(8),
              ],
            ),
          ),
          const FbSectionHeader(title: '空态'),
          _section(
            child: const FbEmptyState(
              title: '还没有内容',
              message: '点击下面按钮开始添加你的第一条记录。',
              icon: Icons.inbox_outlined,
              actionLabel: '立即添加',
            ),
          ),
        ],
      ),
    );
  }

  Widget _section({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(FBSpace.page, 0, FBSpace.page, FBSpace.section),
      child: child,
    );
  }
}
