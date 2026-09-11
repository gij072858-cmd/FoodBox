import 'package:flutter/material.dart';

import '../core/theme.dart';
import 'fb_card.dart';

/// 脚手架占位组件（W1 临时件）
///
/// 用途：空壳阶段让每个模块页面都有统一、可见的「待开工」框架，
///      避免四个人各自造一套页面骨架后再返工。
///
/// 归属说明：`lib/widgets/` 是共享区（全组都在用）。
///   - 本组件由组长在 W1 提供，属于脚手架临时件；
///   - 成员四在 W2 交付公共组件 v1 后，本组件即可删除或替换为正式组件；
///   - 期间如需修改本组件，请按共享区纪律在 PR 标题加 `[shared]`。
class FbPlaceholder extends StatelessWidget {
  const FbPlaceholder({
    super.key,
    required this.title,
    required this.owner,
    required this.milestone,
    this.icon = Icons.construction_rounded,
    this.points = const <String>[],
  });

  /// 页面主标题
  final String title;

  /// 负责人（组长 / 成员二 / 成员三 / 成员四）
  final String owner;

  /// 计划交付周次，如「W3」
  final String milestone;

  final IconData icon;

  /// 该页后续要实现的能力要点
  final List<String> points;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: FBSpace.pageAll,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    color: FBColor.brandLight,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: FBColor.brand, size: 30),
                ),
              ),
              const SizedBox(height: FBSpace.section),
              Text(title, style: FBTextStyle.h2),
              const SizedBox(height: FBSpace.xs),
              Wrap(
                spacing: FBSpace.xs,
                runSpacing: FBSpace.xs,
                children: <Widget>[
                  _Chip(text: '负责人 $owner'),
                  _Chip(text: '计划交付 $milestone'),
                  const _Chip(text: 'W1 空壳框架'),
                ],
              ),
              if (points.isNotEmpty) ...<Widget>[
                const SizedBox(height: FBSpace.section),
                FbCard(
                  padding: FBSpace.pageAll,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('本页待实现要点', style: FBTextStyle.caption),
                      const SizedBox(height: FBSpace.sm),
                      ...points.map(
                        (String point) => Padding(
                          padding: const EdgeInsets.only(bottom: FBSpace.xs),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 4,
                                height: 4,
                                margin: const EdgeInsets.only(top: 9, right: 8),
                                decoration: const BoxDecoration(
                                  color: FBColor.textSecondary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  point,
                                  style: FBTextStyle.caption.copyWith(
                                    color: FBColor.textPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: FBSpace.section),
              Text(
                '页面骨架已就位：路由、主题常量、目录归属均已接入，'
                '正文内容按上方计划直接填充即可。',
                style: FBTextStyle.micro,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: const BoxDecoration(
        borderRadius: FBRadius.pillAll,
        color: FBColor.fill,
      ),
      child: Text(text, style: FBTextStyle.micro),
    );
  }
}
