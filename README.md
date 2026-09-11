# 食匣 FoodBox

> 像网易云用歌单管理音乐一样，食匣用「库—菜式—时序」管理你的厨房。

**当前阶段：W2 组件与数据周（W1 地基已完成：双端空壳可跑 + 设计系统组件库）**

---

## 这是什么

面向「在家做饭的人」的厨房管理工具，解决三个真实痛点：

1. **不知道冰箱里还有什么** → 「库」管理现有食材与调料，临期自动提醒；
2. **不知道这些能做什么菜** → 「菜式」按库存推荐可做的菜、按分类学新菜；
3. **做多个菜时手忙脚乱** → 「时序」把所有菜的步骤重排成一条时间线，像歌词滚动一样引导操作。

技术栈：Flutter（Dart）· Riverpod · Drift(SQLite) · go_router · 安卓 + Windows 双端。

---

## 文档索引（`docs/` 是唯一事实源）

| 文档 | 说明 |
|---|---|
| [`docs/01-食匣详细构想.md`](docs/01-食匣详细构想.md) | 产品定位、设计规范、功能详述、数据模型草案——**最高依据** |
| [`docs/02-开发总计划.md`](docs/02-开发总计划.md) | 八周时间线、协作机制、接口机制、风险管理 |
| [`docs/软件开发计划.md`](docs/软件开发计划.md) | 课程交付物①（W1 定稿） |
| [`docs/需求分析.md`](docs/需求分析.md) | 课程交付物②（W1 启动，W2 定稿） |
| [`docs/接口约定.md`](docs/接口约定.md) | **数据模型与跨模块契约（W1 已冻结）** |
| [`docs/Flutter环境搭建指南.md`](docs/Flutter环境搭建指南.md) | 统一开发环境，含踩坑表 |
| [`docs/GitHub协作指南.md`](docs/GitHub协作指南.md) | Git 工作流操作细则，**开工前必读** |
| [`docs/分工/`](docs/分工/) | 四份成员任务书 |

> ⚠️ 禁止用聊天软件传"最新版"文档。仓库里的版本才是唯一有效的。

---

## 快速开始

```bash
git clone https://github.com/gij072858-cmd/FoodBox.git
cd FoodBox
git checkout dev

cd app
flutter pub get
flutter run -d windows      # 或 flutter run -d <安卓设备>
```

首次搭环境请先看 [`docs/Flutter环境搭建指南.md`](docs/Flutter环境搭建指南.md)。

---

## 仓库结构

```
FoodBox/
├── app/                    # Flutter 工程
│   ├── lib/
│   │   ├── core/           # ★共享区：主题常量、路由、倒计时工具、依赖注入
│   │   ├── data/           # ★共享区：数据库、领域模型、Repository 接口
│   │   ├── features/       # 各模块页面（pantry / recipe / schedule / feed / profile）
│   │   └── widgets/        # ★共享区：公共组件库
│   ├── assets/             # 预置数据 JSON、图片素材
│   └── test/               # 单元测试 / 组件测试
├── docs/                   # 全部文档
└── .github/                # PR 模板、工作流
```

★ 为共享区：改动必须在提交说明加 `[shared]` 并在群里同步。

---

## 开发命令

```bash
dart analyze                                # 静态检查（工程路径含中文时 flutter analyze 会崩，用这条等同替代）
flutter test                                 # 测试
dart format .                                # 格式化
dart run build_runner build --force-jit      # 改表结构后重新生成数据库代码
```

---

## 团队与分工（W1–W8）

| 角色 | 模块 | 横向职责 |
|---|---|---|
| 组长 | 架构 + 数据层 + 时序模块 | 统筹、接口裁决、Code Review、课程文档主笔、答辩 |
| 成员二 | 库（食材 / 调料） | 食材基础数据整理、库相关测试用例 |
| 成员三 | 菜式 | 官方菜式内容录入、菜式相关测试用例 |
| 成员四 | 动态占位 + 我的 + 公共组件库 | UI 规范守护与走查、测试文档主笔 |

详见 [`docs/02-开发总计划.md`](docs/02-开发总计划.md) 第二章。

---

## 协作规矩（摘要）

- `main` 受保护，仅组长在里程碑验收后合并；`dev` 每晚保持可运行；个人分支 `feature/<模块>-<简述>`（可选）；
- **日常改动直接 push 到 `dev`（免 PR）**；改动较大容易弄崩别人时才开功能分支；
- 提交信息用 Conventional Commits：`feat(pantry): …` / `fix(recipe): …` / `docs: …`；
- 不用 force push，不提交密钥与大文件。

详见 [`docs/GitHub协作指南.md`](docs/GitHub协作指南.md)。
