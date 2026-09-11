import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../widgets/fb_placeholder.dart';

/// 我的（构想 2.6，成员四主攻）
///
/// 结构：身份区（头像 + 昵称 + 等级 + 累计顿数）→ XP 进度条 →
///      三栏菜式清单（喜欢 / 做过 / 想做，长按挪移）。
/// 数据来自 `ProfileRepository`（W2 起可用），
/// XP 数值表已在 `data/models/profile.dart` 落地（构想 2.6 定稿）。
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
        title: Text('我的', style: FBTextStyle.h2),
        actions: <Widget>[
          IconButton(
            key: const Key('profile-menu'),
            tooltip: '菜单',
            color: FBColor.textPrimary,
            // TODO(成员四/W5): 呼出侧边抽屉（设置 / 数据备份 / 关于，构想 2.6 第 4 点）
            onPressed: () {},
            icon: const Icon(Icons.menu_rounded),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: const FbPlaceholder(
        title: '我的 · 身份与清单',
        owner: '成员四',
        milestone: 'W5',
        icon: Icons.person_outline_rounded,
        points: <String>[
          '身份区：88px 圆头像 + 昵称 + 等级数 + 累计做过 N 顿饭',
          'XP 进度条：显示「距下一级还差 N XP」（等级表见 data/models/profile.dart）',
          '三栏清单：我喜欢的 / 我做过的 / 我想做的，歌单行样式',
          '长按条目弹出挪移菜单，可移入另外两栏',
          '侧边抽屉：库开关、提醒设置、数据备份与导出、关于食匣',
        ],
      ),
    );
  }
}
