import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme.dart';
import '../../widgets/fb_placeholder.dart';

/// 全局搜索（构想 2.1 右上角搜索图标）
///
/// 入口已通路（/home/search）；检索范围覆盖食材、调料、菜式，
/// 数据接入依赖 D 区 Repository 的 search 方法（W2 起可用）。
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FBColor.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          key: const Key('search-back'),
          tooltip: '返回',
          color: FBColor.textPrimary,
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text('搜索', style: FBTextStyle.h2),
      ),
      body: const FbPlaceholder(
        title: '全局搜索',
        owner: '组长',
        milestone: 'W3',
        icon: Icons.search_rounded,
        points: <String>[
          '检索范围：食材、调料、菜式（PantryRepository.search / RecipeRepository.search）',
          '空态与加载态按设计规范：精致空态优先于空白页面',
          '结果分组展示，点击直达对应详情页',
        ],
      ),
    );
  }
}
