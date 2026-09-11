import 'package:flutter/material.dart';

import '../../../core/theme.dart';
import '../../../widgets/fb_animations.dart';
import '../../../widgets/fb_card.dart';
import '../../../widgets/fb_section_header.dart';

/// 首页 · 库 Tab（成员二主攻，W3 接入真实数据）
///
/// 精修后结构：
///   1. Hero 大卡（今日推荐菜式 / 临期提醒）
///   2. 快速统计（总食材 / 临期 / 分类数）
///   3. 分类横向轮转
///   4. 最近添加列表
class PantryTabPage extends StatelessWidget {
  const PantryTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(FBSpace.page, 0, FBSpace.page, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Hero 大卡
                FbFadeInUp(
                  delay: const Duration(milliseconds: 0),
                  duration: FBMotion.heroEntrance,
                  curve: FBMotion.easeOutQuart,
                  child: FbHeroCard(
                    title: '今晚做点什么？',
                    subtitle: '3 样食材即将过期，快用掉它们',
                    tag: '今日推荐',
                    onTap: () {},
                    height: 180,
                  ),
                ),
                const SizedBox(height: FBSpace.xl),

                // 快速统计
                FbFadeInUp(
                  delay: const Duration(milliseconds: 80),
                  child: Row(
                    children: <Widget>[
                      _StatCard(
                        value: '28',
                        label: '食材',
                        color: FBColor.freshGreen,
                        bgColor: FBColor.successLight,
                      ),
                      const SizedBox(width: FBSpace.sm),
                      _StatCard(
                        value: '5',
                        label: '临期',
                        color: FBColor.warning,
                        bgColor: FBColor.warningLight,
                      ),
                      const SizedBox(width: FBSpace.sm),
                      _StatCard(
                        value: '8',
                        label: '分类',
                        color: FBColor.brand,
                        bgColor: FBColor.brandLight,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: FBSpace.section),
              ],
            ),
          ),
        ),

        // 分类轮转
        SliverToBoxAdapter(
          child: FbSectionHeader(
            title: '分类浏览',
            trailing: TextButton(
              onPressed: () {},
              child: Text('全部', style: FBTextStyle.callout),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 96,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: FBSpace.page),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 6,
              separatorBuilder: (_, _) => const SizedBox(width: FBSpace.sm),
              itemBuilder: (BuildContext context, int index) {
                final List<String> names = <String>[
                  '蔬菜', '水果', '肉禽', '海鲜', '蛋奶', '主食',
                ];
                final List<Color> colors = FBColor.categoryAccent;
                return FbFadeInUp(
                  delay: Duration(milliseconds: 150 + index * 40),
                  child: _CategoryChip(
                    name: names[index],
                    color: colors[index % colors.length],
                    count: 3 + index * 2,
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ),

        // 最近添加
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              top: FBSpace.section,
              bottom: FBSpace.section,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FbSectionHeader(
                  title: '最近添加',
                  trailing: TextButton(
                    onPressed: () {},
                    child: Text('查看全部', style: FBTextStyle.callout),
                  ),
                ),
                const SizedBox(height: FBSpace.sm),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: FBSpace.page),
                  child: Column(
                    children: List<Widget>.generate(4, (int index) {
                      final List<String> names = <String>[
                        '西红柿', '鸡蛋', '鸡胸肉', '牛奶',
                      ];
                      final List<String> exps = <String>[
                        '还有 5 天', '还有 12 天', '还有 2 天', '还有 7 天',
                      ];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: FBSpace.sm),
                        child: FbFadeInUp(
                          delay: Duration(milliseconds: 300 + index * 50),
                          child: _FoodItemRow(
                            name: names[index],
                            expiry: exps[index],
                            category: index.isEven ? '蔬菜' : '蛋奶',
                            color: FBColor.categoryAccent[index % FBColor.categoryAccent.length],
                            isExpiringSoon: index == 2,
                            onTap: () {},
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
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
}

/// Hero 下的统计小卡片
class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.value,
    required this.label,
    required this.color,
    required this.bgColor,
  });

  final String value;
  final String label;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FbCard(
        padding: const EdgeInsets.all(FBSpace.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: FBRadius.smAll,
              ),
              child: Icon(Icons.inventory_2_outlined, size: 18, color: color),
            ),
            const SizedBox(height: FBSpace.sm),
            FbCountUp(
              value: int.parse(value),
              style: FBTextStyle.numberTitle,
            ),
            const SizedBox(height: 2),
            Text(label, style: FBTextStyle.micro),
          ],
        ),
      ),
    );
  }
}

/// 分类圆形卡片（横向轮转用）
class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.name,
    required this.color,
    required this.count,
    this.onTap,
  });

  final String name;
  final Color color;
  final int count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FbPressFeedback(
      onTap: onTap,
      pressedScale: 0.96,
      child: Container(
        width: 72,
        decoration: BoxDecoration(
          color: FBColor.surface,
          borderRadius: FBRadius.mdAll,
          boxShadow: FBShadow.card,
        ),
        padding: const EdgeInsets.all(FBSpace.xs),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: FBRadius.smAll,
              ),
            ),
            const SizedBox(height: FBSpace.xxs),
            Text(name, style: FBTextStyle.micro.copyWith(fontWeight: FontWeight.w500)),
            Text('$count 样', style: FBTextStyle.micro.copyWith(color: FBColor.textSecondary, fontSize: 10)),
          ],
        ),
      ),
    );
  }
}

/// 食材列表行
class _FoodItemRow extends StatelessWidget {
  const _FoodItemRow({
    required this.name,
    required this.expiry,
    required this.category,
    required this.color,
    this.isExpiringSoon = false,
    this.onTap,
  });

  final String name;
  final String expiry;
  final String category;
  final Color color;
  final bool isExpiringSoon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FbPressFeedback(
      onTap: onTap,
      pressedScale: 0.99,
      child: Container(
        padding: const EdgeInsets.all(FBSpace.sm),
        decoration: BoxDecoration(
          color: FBColor.surface,
          borderRadius: FBRadius.mdAll,
          boxShadow: FBShadow.card,
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color,
                borderRadius: FBRadius.smAll,
              ),
            ),
            const SizedBox(width: FBSpace.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: FBTextStyle.body.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(
                          color: FBColor.fill,
                          borderRadius: FBRadius.pillAll,
                        ),
                        child: Text(
                          category,
                          style: FBTextStyle.micro,
                        ),
                      ),
                      const SizedBox(width: FBSpace.xs),
                      Text(
                        expiry,
                        style: FBTextStyle.micro.copyWith(
                          color: isExpiringSoon ? FBColor.warning : FBColor.textSecondary,
                          fontWeight: isExpiringSoon ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: FBColor.textTertiary,
            ),
          ],
        ),
      ),
    );
  }
}
