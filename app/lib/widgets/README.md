# lib/widgets/ —— 公共组件库（共享区）

> 负责人：**成员四**（设计规范守护者）。其他成员可提需求，但组件实现统一在这里收口。
>
> 📖 **详细用法看 [`docs/组件使用说明.md`](../../../docs/组件使用说明.md)**
> 👀 **看效果**：跑 App →「我的」页底部「组件库 Showcase」，或走路由 `/showcase`（源码 `showcase_page.dart`）

## 为什么有这一层

同一个视觉元素被两个人各写一遍，是本项目最容易踩的坑（构想第四章改进 6 专门点名了
「自动滚动卡片区」）。所以凡是**两个及以上模块会用到的组件**，一律先在这里打样，再被引用。

## 组件清单（设计系统 v2.0 + 动效系统 v2.1）

| 文件 | 组件 | 用途 |
|---|---|---|
| `fb_card.dart` | `FbCard` / `FbHeroCard` / `FbCardImageOverlay` | 标准白卡 / 展示级大卡 / 图片底部蒙版 |
| `fb_list_tile.dart` | `FbListTile` | iOS 风格列表行（左图 + 双行文本） |
| `fb_pill_button.dart` | `FbPillButton.primary/.secondary/.ghost` | 胶囊按钮三态 |
| `fb_section_header.dart` | `FbSectionHeader` | 模块标题行 |
| `fb_avatar.dart` | `FbAvatar` | 圆形头像（带徽章 slot） |
| `fb_badge.dart` | `FbBadge.dot()` / `FbBadge.count()` | 角标：小圆点 / 数字胶囊 |
| `fb_empty_state.dart` | `FbEmptyState` | 空态页（浮动图标 + 主次操作） |
| `fb_glass_container.dart` | `FbGlassContainer` | 毛玻璃容器 |
| `fb_bottom_sheet.dart` | `FbBottomSheet` | 底部弹层（28 圆角 + 抓手） |
| `fb_toast.dart` | `FbToast.show()` | 轻提示 |
| `fb_animations.dart` | `FbFadeInUp` `FbStaggerList` `FbPressFeedback` `FbFloat` `FbPulse` `FbCountUp` `FbAnimatedProgress` `FbGradientBackground` | 动效组件（v2.1） |
| `fb_placeholder.dart` | `FbPlaceholder` | ⚠️ W1 空壳期**临时件**，随各模块页面落地逐步消失，新页面不要再引入 |
| `showcase_page.dart` | `ShowcasePage` | 组件走查基准页（共享区，同样要维护） |

**配套但不在此目录**：`core/theme.dart` 是常量源头（颜色 / 字号 / 圆角 / 间距 / 阴影 / 动效），
改它同样属共享区改动。

## 纪律

1. 组件内部**只能** import `core/theme.dart` 取常量，禁止硬编码色值 / 圆角 / 字号 / 间距；
2. 改动本目录属共享区：**提交说明加 `[shared]`**，并在群里同步；
3. **新增组件必须同步在 `showcase_page.dart` 补一个演示区** —— 走查看不到 = 等于没有；
4. 组件 API 一旦发布，修改必须**向后兼容**（加参数给默认值）或**全组同步**；
5. 只有一个页面会用的组件，先放自己 `features/` 目录，别急着进公共库。

## W3 待补缺件

| 组件（暂定名） | 规格 |
|---|---|
| `FbCountdownBar` | 水平倒计时条（构想 2.3.3）—— **全组最大共用件**，优先保证 API 稳定 |
| `FbAutoScrollRow` | 水平自动滚动（闲置启动 / 触碰暂停，构想 2.2.1） |
| `FbTabStrip` | 二级 Tab 选中态 + 水平自动滚动 |
| `AppDrawer` | 侧边抽屉（低频设置入口） |

完整规格与验收标准见 `docs/分工/成员四-动态我的与UI规范.md` §B。
