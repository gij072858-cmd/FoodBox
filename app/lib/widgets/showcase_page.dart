import 'package:flutter/material.dart';

import '../core/theme.dart';
import 'fb_animations.dart';
import 'fb_avatar.dart';
import 'fb_badge.dart';
import 'fb_bottom_sheet.dart';
import 'fb_card.dart';
import 'fb_empty_state.dart';
import 'fb_glass_container.dart';
import 'fb_list_tile.dart';
import 'fb_pill_button.dart';
import 'fb_section_header.dart';
import 'fb_toast.dart';

/// 组件 Showcase 页（开发期 UI 走查基准）
///
/// 三个用途：
///   1. **走查** —— 对照《组件使用说明》逐项核对视觉，W3/W7 两轮 UI 走查的基准页；
///   2. **查用法** —— 写页面前先来这里看组件长什么样、有哪些参数、怎么组合；
///   3. **回归** —— 改 `core/theme.dart` 或任一 `fb_*` 后，从这一页一眼看出观感变化。
///
/// 进入方式：路由 `/showcase`（见 `AppRoutes.showcase`），
/// 「我的」页底部也有「组件库 Showcase」入口。
///
/// 维护纪律（本页属共享区 `widgets/`，改动加 `[shared]`）：
/// **新增组件必须同步在本页补一区** —— 走查看不到 = 等于没有。
class ShowcasePage extends StatefulWidget {
  const ShowcasePage({super.key});

  @override
  State<ShowcasePage> createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> {
  /// 变化时强制重建动效示范区，用来「重播」入场动画
  int _replayTick = 0;

  /// 进度条演示值
  double _progress = 0.62;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FBColor.background,
      appBar: AppBar(title: const Text('组件 Showcase')),
      body: ListView(
        padding: const EdgeInsets.only(bottom: FBSpace.xxxl),
        children: <Widget>[
          _intro(),
          _colorSection(),
          _gradientSection(),
          _foundationSection(),
          _typographySection(),
          _buttonSection(),
          _cardSection(),
          _listSection(),
          _containerSection(),
          _avatarBadgeSection(),
          _emptyStateSection(),
          _feedbackSection(),
          _motionSection(),
          _motionTokenSection(),
        ],
      ),
    );
  }

  // =========================================================================
  // 页头
  // =========================================================================

  Widget _intro() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        FBSpace.page,
        FBSpace.lg,
        FBSpace.page,
        FBSpace.section,
      ),
      child: FbCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('组件库总览（v2.0 设计系统 + v2.1 动效）', style: FBTextStyle.h2),
            const SizedBox(height: FBSpace.xs),
            Text(
              '本页是 UI 走查基准。所有组件都只引用 core/theme.dart 常量，'
              '页面里不得出现硬编码色值 / 圆角 / 字号。',
              style: FBTextStyle.callout,
            ),
            const SizedBox(height: FBSpace.sm),
            Text(
              '分区顺序：色彩 → 渐变 → 圆角/间距/阴影 → 字体 → 按钮 → 卡片 → 列表 → '
              '容器 → 头像角标 → 空态 → 轻提示 → 动效 → 动效 token。',
              style: FBTextStyle.micro,
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================================
  // 色彩 / 渐变
  // =========================================================================

  Widget _colorSection() {
    return _section(
      title: '色彩 FBColor',
      note: '具名色值一律走 FBColor；页面里出现 Color(0x…) 即视为违纪。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _subTitle('品牌'),
          _swatchRow(<Widget>[
            _swatch('brand', FBColor.brand),
            _swatch('brandDeep', FBColor.brandDeep),
            _swatch('brandSoft', FBColor.brandSoft),
            _swatch('brandLight', FBColor.brandLight),
            _swatch('brandGlow', FBColor.brandGlow),
          ]),
          _subTitle('背景与容器'),
          _swatchRow(<Widget>[
            _swatch('background', FBColor.background),
            _swatch('backgroundWarm', FBColor.backgroundWarm),
            _swatch('surface', FBColor.surface),
            _swatch('fill', FBColor.fill),
            _swatch('glass', FBColor.glass),
            _swatch('glassDark', FBColor.glassDark),
          ]),
          _subTitle('文字'),
          _swatchRow(<Widget>[
            _swatch('textPrimary', FBColor.textPrimary),
            _swatch('textSecondary', FBColor.textSecondary),
            _swatch('textTertiary', FBColor.textTertiary),
            _swatch('textInverse', FBColor.textInverse),
          ]),
          _subTitle('状态与点缀'),
          _swatchRow(<Widget>[
            _swatch('success', FBColor.success),
            _swatch('successLight', FBColor.successLight),
            _swatch('warning', FBColor.warning),
            _swatch('warningLight', FBColor.warningLight),
            _swatch('danger', FBColor.danger),
            _swatch('dangerLight', FBColor.dangerLight),
            _swatch('warmOrange', FBColor.warmOrange),
            _swatch('freshGreen', FBColor.freshGreen),
            _swatch('honeyYellow', FBColor.honeyYellow),
            _swatch('link', FBColor.link),
          ]),
          _subTitle('分类点缀色 categoryAccent（食材分类底色）'),
          _swatchRow(<Widget>[
            for (int i = 0; i < FBColor.categoryAccent.length; i++)
              _swatch('[$i]', FBColor.categoryAccent[i]),
          ]),
        ],
      ),
    );
  }

  Widget _gradientSection() {
    return _section(
      title: '渐变 FBGradient',
      note: '渐变一律取 FBGradient 预设，不要在页面里现写 LinearGradient 色值。',
      child: Wrap(
        spacing: FBSpace.sm,
        runSpacing: FBSpace.sm,
        children: <Widget>[
          _gradientChip('brand', FBGradient.brand),
          _gradientChip('warm', FBGradient.warm),
          _gradientChip('warmHero', FBGradient.warmHero),
          _gradientChip('heroFallback', FBGradient.heroFallback),
          _gradientChip('heroMask', FBGradient.heroMask),
          _gradientChip('cardMask', FBGradient.cardMask),
          _gradientChip('progress', FBGradient.progress),
          _gradientChip('success', FBGradient.success),
          _gradientChip('warning', FBGradient.warning),
        ],
      ),
    );
  }

  // =========================================================================
  // 圆角 / 间距 / 阴影
  // =========================================================================

  Widget _foundationSection() {
    return _section(
      title: '圆角 · 间距 · 阴影',
      note: '圆角嵌套法则：外大内小。间距一律 4pt 网格（FBSpace）。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _subTitle('圆角 FBRadius'),
          Wrap(
            spacing: FBSpace.md,
            runSpacing: FBSpace.sm,
            children: <Widget>[
              _radiusChip('xs 6', FBRadius.xsAll),
              _radiusChip('sm 10', FBRadius.smAll),
              _radiusChip('md 16', FBRadius.mdAll),
              _radiusChip('lg 20', FBRadius.lgAll),
              _radiusChip('xl 28', FBRadius.xlAll),
              _radiusChip('xxl 36', FBRadius.xxlAll),
              _radiusChip('pill', FBRadius.pillAll),
            ],
          ),
          _subTitle('间距 FBSpace（xxs 4 → xxxxl 64）'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _spaceBar('xxs', FBSpace.xxs),
              _spaceBar('xs', FBSpace.xs),
              _spaceBar('sm', FBSpace.sm),
              _spaceBar('md', FBSpace.md),
              _spaceBar('lg / page', FBSpace.lg),
              _spaceBar('xl / section', FBSpace.xl),
              _spaceBar('xxl', FBSpace.xxl),
              _spaceBar('xxxl / hero', FBSpace.xxxl),
              _spaceBar('xxxxl', FBSpace.xxxxl),
            ],
          ),
          _subTitle('阴影 FBShadow'),
          Wrap(
            spacing: FBSpace.md,
            runSpacing: FBSpace.md,
            children: <Widget>[
              _shadowChip('card', FBShadow.card),
              _shadowChip('cardHover', FBShadow.cardHover),
              _shadowChip('cardPressed', FBShadow.cardPressed),
              _shadowChip('floating', FBShadow.floating),
              _shadowChip('modal', FBShadow.modal),
              _shadowChip('avatar', FBShadow.avatar),
              _shadowChip('hero', FBShadow.hero),
              _shadowChip('brandGlow', FBShadow.brandGlow),
            ],
          ),
        ],
      ),
    );
  }

  Widget _typographySection() {
    return _section(
      title: '字体层级 FBTextStyle',
      note: '字号取 FBText，样式取 FBTextStyle；数字类一律 numberDisplay / numberTitle。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('display 34 · 展示级大字', style: FBTextStyle.display),
          Text('largeTitle 28 · 大标题', style: FBTextStyle.largeTitle),
          Text('h1 20 · 页面标题', style: FBTextStyle.h1),
          Text('h2 17 · 模块标题', style: FBTextStyle.h2),
          Text('body 15 · 正文', style: FBTextStyle.body),
          Text('callout 14 · 辅助说明', style: FBTextStyle.callout),
          Text('caption 12 · 副标题', style: FBTextStyle.caption),
          Text('micro 11 · 计数 / 时间', style: FBTextStyle.micro),
          Text('button 14 半粗 · 按钮文字', style: FBTextStyle.button),
          Text('numberDisplay 34 · 数字等宽', style: FBTextStyle.numberDisplay),
          Text('numberTitle 20 · 数字标题', style: FBTextStyle.numberTitle),
        ],
      ),
    );
  }

  // =========================================================================
  // 组件
  // =========================================================================

  Widget _buttonSection() {
    return _section(
      title: '按钮 FbPillButton',
      note: 'primary 带品牌渐变 + 光晕；onTap 为 null 时自动降为禁用态（50% 透明）。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Wrap(
            spacing: FBSpace.sm,
            runSpacing: FBSpace.sm,
            children: <Widget>[
              FbPillButton.primary(label: '主要'),
              FbPillButton.secondary(label: '次要'),
              FbPillButton.ghost(label: '文字'),
              FbPillButton.primary(label: '带图标', icon: Icons.add_rounded),
              FbPillButton.secondary(label: '禁用', icon: Icons.lock_outline_rounded),
            ],
          ),
          const SizedBox(height: FBSpace.md),
          const FbPillButton.primary(label: '撑满宽度 expanded: true', expanded: true),
          const SizedBox(height: FBSpace.sm),
          const FbPillButton.secondary(label: 'height: 48', height: 48),
        ],
      ),
    );
  }

  Widget _cardSection() {
    return _section(
      title: '卡片 FbCard / FbHeroCard',
      note: 'FbCard 可配 image + FbCardImageOverlay（图片卡）；FbHeroCard 为展示级大卡。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FbCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('标准卡片', style: FBTextStyle.h2),
                const SizedBox(height: FBSpace.xs),
                Text('白底 · 圆角 16 · 柔和阴影 · 内边距 16', style: FBTextStyle.callout),
              ],
            ),
          ),
          const SizedBox(height: FBSpace.md),
          FbCard(
            onTap: () {},
            child: Row(
              children: <Widget>[
                const Icon(Icons.touch_app_rounded, color: FBColor.brand),
                const SizedBox(width: FBSpace.sm),
                Text('可点击卡片（带按压缩放反馈）', style: FBTextStyle.body),
              ],
            ),
          ),
          const SizedBox(height: FBSpace.md),
          FbCard(
            height: 160,
            padding: EdgeInsets.zero,
            image: Container(color: FBColor.categoryAccent[2]),
            imageOverlay: FbCardImageOverlay(
              child: Text('图片卡片', style: FBTextStyle.h2Inverse),
            ),
            child: const SizedBox.shrink(),
          ),
          const SizedBox(height: FBSpace.md),
          FbHeroCard(
            title: '番茄炒蛋',
            subtitle: '家常快手 · 约 15 分钟',
            tag: '今天做这个',
            badge: FbBadge.count(3),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _listSection() {
    return _section(
      title: '列表行 FbListTile',
      note: '左图 40×40 + 双行文本 + 右箭头；传了 trailing 则不显示箭头。',
      child: FbCard(
        padding: FBSpace.pageH,
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
              title: '带缩略图的列表行',
              subtitle: '辅助说明文字，超长会自动省略号',
              onTap: () {},
            ),
            const Divider(),
            const FbListTile(
              leading: Icon(Icons.settings_rounded, color: FBColor.textSecondary),
              title: '带图标 + 右箭头',
              subtitle: 'showChevron 默认 true',
            ),
            const Divider(),
            const FbListTile(
              title: '无左图、无箭头',
              subtitle: 'showChevron: false',
              showChevron: false,
            ),
            const Divider(),
            const FbListTile(
              leading: Icon(Icons.bookmark_border_rounded, color: FBColor.warning),
              title: '带右侧自定义 slot',
              subtitle: '传了 trailing 就不显示默认箭头',
              trailing: FbBadge.count(15),
            ),
          ],
        ),
      ),
    );
  }

  Widget _containerSection() {
    return _section(
      title: '容器 FbGlassContainer / FbGradientBackground / FbBottomSheet',
      note: '毛玻璃强度取 FBGlass.blurNav(20) / blurLight(12) / blurSheet(24) / blurModal(30)。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 毛玻璃要压在内容上才看得出效果
          ClipRRect(
            borderRadius: FBRadius.mdAll,
            child: FbGradientBackground(
              glowColor: FBColor.glowWarm,
              child: SizedBox(
                height: 120,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: FBSpace.sm,
                      top: FBSpace.sm,
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: const BoxDecoration(
                          color: FBColor.brandSoft,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Center(
                      child: FbGlassContainer(
                        borderRadius: FBRadius.mdAll,
                        child: Padding(
                          padding: const EdgeInsets.all(FBSpace.md),
                          child: Text('FbGlassContainer', style: FBTextStyle.h2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: FBSpace.md),
          FbBottomSheet(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('FbBottomSheet', style: FBTextStyle.h2),
                const SizedBox(height: FBSpace.xs),
                Text('顶部 28 圆角 + 抓手 + modal 阴影', style: FBTextStyle.callout),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _avatarBadgeSection() {
    return _section(
      title: '头像与角标 FbAvatar / FbBadge',
      note: 'FbAvatar 默认 80（我的页身份区 88）；badge 走右下角 slot。',
      child: Wrap(
        spacing: FBSpace.lg,
        runSpacing: FBSpace.md,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          const FbAvatar(size: 40),
          const FbAvatar(size: 56),
          const FbAvatar(size: 80),
          const FbAvatar(size: 88, badge: FbBadge.dot()),
          const FbBadge.dot(),
          const FbBadge.count(3),
          const FbBadge.count(128),
        ],
      ),
    );
  }

  Widget _emptyStateSection() {
    return _section(
      title: '空态 FbEmptyState',
      note: '大图标带浮动动效，标题/说明/主次操作按钮按顺序淡入。',
      child: FbCard(
        padding: EdgeInsets.zero,
        child: FbEmptyState(
          title: '还没有内容',
          message: '点击下面按钮开始添加你的第一条记录。',
          icon: Icons.inbox_outlined,
          actionLabel: '立即添加',
          onAction: () {},
          subActionLabel: '稍后再说',
          onSubAction: () {},
        ),
      ),
    );
  }

  Widget _feedbackSection() {
    return _section(
      title: '轻提示 FbToast',
      note: 'FbToast.show(context, message) —— 深色毛玻璃胶囊，2 秒自动消失。',
      child: Wrap(
        spacing: FBSpace.sm,
        children: <Widget>[
          FbPillButton.secondary(
            label: '弹一个 Toast',
            icon: Icons.chat_bubble_outline_rounded,
            onTap: () => FbToast.show(context, '已加入「想做」清单'),
          ),
          FbPillButton.ghost(
            label: '长文案',
            onTap: () => FbToast.show(context, '库存已扣减到 0，该条目已置灰不再推荐'),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // 动效
  // =========================================================================

  Widget _motionSection() {
    return _section(
      title: '动效组件 fb_animations.dart',
      note: '入场类动效（FbFadeInUp / FbStaggerList）只在首次挂载时播放，点右侧「重播」再看一遍。',
      trailing: FbPillButton.ghost(
        label: '重播',
        icon: Icons.refresh_rounded,
        onTap: () => setState(() => _replayTick++),
      ),
      child: KeyedSubtree(
        key: ValueKey<int>(_replayTick),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _subTitle('FbFadeInUp · 淡入上滑'),
            FbFadeInUp(
              child: FbCard(
                child: Text('延迟 0ms 入场', style: FBTextStyle.body),
              ),
            ),

            _subTitle('FbStaggerList · 列表错位入场（每项 +50ms，最多 8 项）'),
            FbStaggerList(
              children: <Widget>[
                for (int i = 1; i <= 4; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: FBSpace.xs),
                    child: FbCard(
                      padding: const EdgeInsets.all(FBSpace.sm),
                      child: Text('第 $i 项', style: FBTextStyle.body),
                    ),
                  ),
              ],
            ),

            _subTitle('FbPressFeedback · 按压反馈（点一下看缩放）'),
            FbPressFeedback(
              onTap: () => FbToast.show(context, '按到了'),
              pressedScale: FBMotion.cardPressedScale,
              child: FbCard(
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.touch_app_rounded, color: FBColor.brand),
                    const SizedBox(width: FBSpace.sm),
                    Text('按下 scale ${FBMotion.cardPressedScale}', style: FBTextStyle.body),
                  ],
                ),
              ),
            ),

            _subTitle('FbFloat / FbPulse · 循环动效'),
            Row(
              children: <Widget>[
                const FbFloat(
                  child: FbAvatar(size: 56),
                ),
                const SizedBox(width: FBSpace.xl),
                const FbPulse(
                  child: FbAvatar(size: 56),
                ),
                const SizedBox(width: FBSpace.md),
                Text('左：浮动\n右：脉冲', style: FBTextStyle.micro),
              ],
            ),

            _subTitle('FbCountUp · 数字滚动（进场从 0 滚到目标值）'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                const FbCountUp(value: 1240, suffix: ' XP'),
                const SizedBox(width: FBSpace.sm),
                Text('→ 厨阶 Lv3', style: FBTextStyle.callout),
              ],
            ),

            _subTitle('FbAnimatedProgress · 进度条（切换数值看过渡）'),
            FbAnimatedProgress(value: _progress),
            const SizedBox(height: FBSpace.sm),
            Row(
              children: <Widget>[
                Text('value = ${_progress.toStringAsFixed(2)}', style: FBTextStyle.micro),
                const SizedBox(width: FBSpace.md),
                FbPillButton.ghost(
                  label: '切换数值',
                  onTap: () => setState(() {
                    _progress = _progress > 0.9 ? 0.25 : (_progress + 0.3).clamp(0.0, 1.0);
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _motionTokenSection() {
    return _section(
      title: '动效 token FBMotion',
      note: '所有动效时长 / 曲线 / 缩放必须引用 FBMotion，禁止魔法数字。',
      child: FbCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _tokenRow('instant', '${FBMotion.instant.inMilliseconds}ms', '即时反馈（按钮、开关）'),
            _tokenRow('quick', '${FBMotion.quick.inMilliseconds}ms', '状态切换（悬停、菜单、Tab）'),
            _tokenRow('normal', '${FBMotion.normal.inMilliseconds}ms', '布局变化（Modal、展开）'),
            _tokenRow('entrance', '${FBMotion.entrance.inMilliseconds}ms', '页面入场'),
            _tokenRow('pageTransition', '${FBMotion.pageTransition.inMilliseconds}ms', '页面转场'),
            _tokenRow('heroEntrance', '${FBMotion.heroEntrance.inMilliseconds}ms', 'Hero 元素入场'),
            _tokenRow('staggerStep', '${FBMotion.staggerStep.inMilliseconds}ms', '列表错位间隔（最多 ${FBMotion.maxStaggerItems} 项）'),
            const Divider(),
            _tokenRow('buttonPressedScale', '${FBMotion.buttonPressedScale}', '按钮按压缩放'),
            _tokenRow('cardPressedScale', '${FBMotion.cardPressedScale}', '卡片按压缩放'),
            _tokenRow('cardHoverScale', '${FBMotion.cardHoverScale}', '卡片悬浮放大'),
            _tokenRow('iconPressedScale', '${FBMotion.iconPressedScale}', '图标按钮按下'),
            _tokenRow('entranceOffset', '${FBMotion.entranceOffset}', '入场偏移距离'),
            const Divider(),
            Text(
              '曲线：easeOut / easeOutQuart / easeOutExpo / easeIn / easeInOut / springLight',
              style: FBTextStyle.caption,
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================================
  // 小组件
  // =========================================================================

  Widget _section({
    required String title,
    String? note,
    Widget? trailing,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FbSectionHeader(title: title, trailing: trailing),
        if (note != null)
          Padding(
            padding: const EdgeInsets.only(
              top: FBSpace.xxs,
              left: FBSpace.page,
              right: FBSpace.page,
            ),
            child: Text(note, style: FBTextStyle.micro),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            FBSpace.page,
            FBSpace.sm,
            FBSpace.page,
            FBSpace.section,
          ),
          child: child,
        ),
      ],
    );
  }

  Widget _subTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: FBSpace.md, bottom: FBSpace.xs),
      child: Text(text, style: FBTextStyle.caption),
    );
  }

  Widget _swatchRow(List<Widget> items) {
    return Wrap(
      spacing: FBSpace.sm,
      runSpacing: FBSpace.sm,
      children: items,
    );
  }

  Widget _swatch(String name, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color,
            borderRadius: FBRadius.smAll,
            border: Border.all(color: FBColor.separator, width: 0.5),
          ),
        ),
        const SizedBox(height: FBSpace.xxs),
        SizedBox(
          width: 60,
          child: Text(
            name,
            style: FBTextStyle.micro,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget _gradientChip(String name, Gradient gradient) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 104,
          height: 60,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: FBRadius.mdAll,
            border: Border.all(color: FBColor.separator, width: 0.5),
          ),
        ),
        const SizedBox(height: FBSpace.xxs),
        Text(name, style: FBTextStyle.micro),
      ],
    );
  }

  Widget _radiusChip(String label, BorderRadius radius) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: FBColor.surface,
            borderRadius: radius,
            border: Border.all(color: FBColor.separator, width: 1),
          ),
        ),
        const SizedBox(height: FBSpace.xxs),
        Text(label, style: FBTextStyle.micro),
      ],
    );
  }

  Widget _spaceBar(String label, double value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: FBSpace.xxs),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 96,
            child: Text(label, style: FBTextStyle.micro),
          ),
          Container(
            width: value,
            height: 12,
            decoration: const BoxDecoration(
              color: FBColor.brandSoft,
              borderRadius: FBRadius.xsAll,
            ),
          ),
        ],
      ),
    );
  }

  Widget _shadowChip(String label, List<BoxShadow> shadow) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 88,
          height: 56,
          decoration: BoxDecoration(
            color: FBColor.surface,
            borderRadius: FBRadius.mdAll,
            boxShadow: shadow,
          ),
        ),
        const SizedBox(height: FBSpace.xs),
        Text(label, style: FBTextStyle.micro),
      ],
    );
  }

  Widget _tokenRow(String name, String value, String usage) {
    return Padding(
      padding: const EdgeInsets.only(bottom: FBSpace.xs),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 150,
            child: Text(name, style: FBTextStyle.caption),
          ),
          SizedBox(
            width: 64,
            child: Text(value, style: FBTextStyle.micro),
          ),
          Expanded(
            child: Text(usage, style: FBTextStyle.micro),
          ),
        ],
      ),
    );
  }
}
