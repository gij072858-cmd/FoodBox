import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../widgets/fb_animations.dart';
import '../../widgets/fb_avatar.dart';
import '../../widgets/fb_card.dart';
import '../../widgets/fb_list_tile.dart';

/// 我的页（成员四主攻，W5 接入真实数据）
///
/// 精修后结构：
///   1. 身份区（大标题式：头像 + 昵称 + 等级 + XP 进度条 + 统计）
///   2. 三栏切换（喜欢 / 做过 / 想做）
///   3. 功能列表
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        // 身份 Hero 区
        SliverToBoxAdapter(
          child: _IdentityHero(),
        ),

        // 三栏统计
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(FBSpace.page, 0, FBSpace.page, 0),
            child: FbFadeInUp(
              delay: const Duration(milliseconds: 200),
              child: _ThreeStats(),
            ),
          ),
        ),

        // 三栏切换
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(FBSpace.page, FBSpace.xl, FBSpace.page, 0),
            child: FbFadeInUp(
              delay: const Duration(milliseconds: 280),
              child: _SegmentedControl(),
            ),
          ),
        ),

        // 功能列表
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(FBSpace.page, FBSpace.section, FBSpace.page, 0),
            child: FbFadeInUp(
              delay: const Duration(milliseconds: 360),
              child: FbCard(
                padding: EdgeInsets.zero,
                child: Column(
                  children: <Widget>[
                    FbListTile(
                      leading: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: FBColor.brandLight,
                          borderRadius: FBRadius.smAll,
                        ),
                        child: const Icon(Icons.favorite_border_rounded, size: 18, color: FBColor.brand),
                      ),
                      title: '我喜欢的',
                      subtitle: '12 道菜式',
                      onTap: () {},
                      padding: const EdgeInsets.symmetric(horizontal: FBSpace.md, vertical: FBSpace.sm),
                      showChevron: true,
                    ),
                    _divider(),
                    FbListTile(
                      leading: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: FBColor.successLight,
                          borderRadius: FBRadius.smAll,
                        ),
                        child: const Icon(Icons.check_circle_outline_rounded, size: 18, color: FBColor.freshGreen),
                      ),
                      title: '我做过的',
                      subtitle: '28 道菜式 · 累计 45 顿',
                      onTap: () {},
                      padding: const EdgeInsets.symmetric(horizontal: FBSpace.md, vertical: FBSpace.sm),
                      showChevron: true,
                    ),
                    _divider(),
                    FbListTile(
                      leading: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0x1FFF9500),
                          borderRadius: FBRadius.smAll,
                        ),
                        child: const Icon(Icons.bookmark_border_rounded, size: 18, color: FBColor.warning),
                      ),
                      title: '我想做的',
                      subtitle: '15 道菜式',
                      onTap: () {},
                      padding: const EdgeInsets.symmetric(horizontal: FBSpace.md, vertical: FBSpace.sm),
                      showChevron: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // 设置列表
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(FBSpace.page, FBSpace.md, FBSpace.page, 0),
            child: FbFadeInUp(
              delay: const Duration(milliseconds: 440),
              child: FbCard(
                padding: EdgeInsets.zero,
                child: Column(
                  children: <Widget>[
                    FbListTile(
                      leading: const Icon(Icons.notifications_outlined, size: 20, color: FBColor.textSecondary),
                      title: '提醒设置',
                      onTap: () {},
                      padding: const EdgeInsets.symmetric(horizontal: FBSpace.md, vertical: FBSpace.sm),
                      showChevron: true,
                    ),
                    _divider(),
                    FbListTile(
                      leading: const Icon(Icons.settings_outlined, size: 20, color: FBColor.textSecondary),
                      title: '偏好设置',
                      onTap: () {},
                      padding: const EdgeInsets.symmetric(horizontal: FBSpace.md, vertical: FBSpace.sm),
                      showChevron: true,
                    ),
                    _divider(),
                    FbListTile(
                      leading: const Icon(Icons.info_outline_rounded, size: 20, color: FBColor.textSecondary),
                      title: '关于食匣',
                      subtitle: 'v1.0.0',
                      onTap: () {},
                      padding: const EdgeInsets.symmetric(horizontal: FBSpace.md, vertical: FBSpace.sm),
                      showChevron: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // 底部留白
        const SliverToBoxAdapter(
          child: SizedBox(height: FBSpace.xxxl),
        ),
      ],
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.only(left: FBSpace.md + 32 + FBSpace.md),
      child: Divider(height: 1, thickness: 0.5),
    );
  }
}

/// 身份 Hero 区：暖色渐变背景 + 大头像 + XP 进度
class _IdentityHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FbFadeInUp(
      delay: Duration.zero,
      duration: FBMotion.heroEntrance,
      curve: FBMotion.easeOutQuart,
      child: Container(
        padding: EdgeInsets.only(
          top: FBSpace.md + MediaQuery.paddingOf(context).top,
          bottom: FBSpace.xl,
          left: FBSpace.page,
          right: FBSpace.page,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xFFFFF0E8),
              Color(0xFFFFE0D0),
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            // 装饰光晕
            Positioned(
              top: -20,
              right: -40,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: FBGradient.heroGlow(
                    color: FBColor.glowBrand,
                    radius: 0.7,
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                const SizedBox(height: FBSpace.sm),
                Row(
                  children: <Widget>[
                    FbFloat(
                      amplitude: 4,
                      child: FbAvatar(size: 72),
                    ),
                    const SizedBox(width: FBSpace.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '食匣君',
                            style: FBTextStyle.largeTitle.copyWith(fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: FBColor.brandLight,
                                  borderRadius: FBRadius.pillAll,
                                ),
                                child: Text(
                                  'Lv.5 · 主厨学徒',
                                  style: FBTextStyle.micro.copyWith(
                                    color: FBColor.brand,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: FBSpace.xs),
                              Text(
                                '累计 45 顿',
                                style: FBTextStyle.micro,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: FBSpace.lg),
                // XP 进度条
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('经验值', style: FBTextStyle.caption),
                        Row(
                          children: <Widget>[
                            FbCountUp(
                              value: 2340,
                              style: FBTextStyle.caption.copyWith(fontWeight: FontWeight.w700),
                            ),
                            Text(' / 3000 XP', style: FBTextStyle.caption),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: FBSpace.xs),
                    FbAnimatedProgress(
                      value: 2340 / 3000,
                      height: 8,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '再做 3 顿饭就能升级啦 🎉',
                      style: FBTextStyle.micro.copyWith(color: FBColor.brand),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 三栏统计（喜欢 / 做过 / 想做）
class _ThreeStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FbCard(
      padding: const EdgeInsets.symmetric(vertical: FBSpace.md),
      child: Row(
        children: <Widget>[
          _statItem('12', '我喜欢的', FBColor.brand),
          _dividerV(),
          _statItem('28', '我做过的', FBColor.freshGreen),
          _dividerV(),
          _statItem('15', '我想做的', FBColor.warning),
        ],
      ),
    );
  }

  Widget _statItem(String count, String label, Color color) {
    return Expanded(
      child: Column(
        children: <Widget>[
          FbCountUp(
            value: int.parse(count),
            style: FBTextStyle.numberTitle.copyWith(color: color),
          ),
          const SizedBox(height: 2),
          Text(label, style: FBTextStyle.micro),
        ],
      ),
    );
  }

  Widget _dividerV() {
    return Container(
      width: 1,
      height: 32,
      color: FBColor.separator,
    );
  }
}

/// 分段控制器（喜欢 / 做过 / 想做）
class _SegmentedControl extends StatefulWidget {
  @override
  State<_SegmentedControl> createState() => _SegmentedControlState();
}

class _SegmentedControlState extends State<_SegmentedControl> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const List<String> items = <String>['我喜欢的', '我做过的', '我想做的'];
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: FBColor.fill,
        borderRadius: FBRadius.pillAll,
      ),
      child: Row(
        children: List<Widget>.generate(items.length, (int index) {
          final bool selected = _selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: AnimatedContainer(
                duration: FBMotion.quick,
                curve: FBMotion.easeInOut,
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: selected ? FBColor.surface : Colors.transparent,
                  borderRadius: FBRadius.pillAll,
                  boxShadow: selected ? FBShadow.card : const <BoxShadow>[],
                ),
                alignment: Alignment.center,
                child: Text(
                  items[index],
                  style: FBTextStyle.caption.copyWith(
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                    color: selected ? FBColor.textPrimary : FBColor.textSecondary,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
