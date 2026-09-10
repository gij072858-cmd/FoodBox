# app/ —— 食匣 Flutter 工程

## 运行

```bash
flutter pub get
flutter run -d windows          # Windows 桌面端
flutter run -d <device-id>      # 安卓端（flutter devices 查看设备）
```

## 提交 PR 前必须跑

```bash
flutter analyze     # 静态检查，需无 error
flutter test        # 测试全绿
dart format .
```

## 目录职责

| 目录 | 归属 | 说明 |
|---|---|---|
| `lib/core/` | ★共享区 | 设计常量（`theme.dart`）、路由（`app_router.dart`）、倒计时（`countdown.dart`）、DI（`providers.dart`） |
| `lib/data/` | ★共享区 | `models/` 领域模型、`local/` Drift 表与映射、`repositories/` 接口、`services/` 算法 |
| `lib/features/` | 各人自留地 | 见下表 |
| `lib/widgets/` | ★共享区 | 公共组件库，owner 成员四（见该目录 README） |
| `assets/data/` | 数据 | 预置 JSON（食材库、菜式、别名表） |
| `assets/images/` | 素材 | 图片资源，目录可整体替换 |

### features 归属

| 目录 | 负责人 | 计划周次 |
|---|---|---|
| `features/home/` | 组长 | W1（框架完成） |
| `features/shell/` | 组长 | W1（框架完成） |
| `features/pantry/` | 成员二 | W3 |
| `features/recipe/` | 成员三 | W4 |
| `features/schedule/` | 组长 | W5–W6 |
| `features/feed/` | 成员四 | W5（占位） |
| `features/profile/` | 成员四 | W5 |

## 三条硬纪律

1. **不许硬编码色值 / 圆角 / 字号** —— 一律引用 `lib/core/theme.dart`（这是深色模式零重构上线的前提）；
2. **不许在页面里直接操作数据库** —— 只能调 `lib/data/repositories/` 的接口；
3. **倒计时不许用 Timer 周期计数累加** —— 统一用 `lib/core/countdown.dart` 的结束时间戳方案。

## 改了数据库表结构之后

```bash
dart run build_runner build --force-jit
```

`--force-jit` 是为了绕开部分机器上 AOT 产物写入失败的问题（见《Flutter环境搭建指南》第六节）。

> 改表结构属于**接口变更**：需先在群里提案 → 组长裁决 → 更新 `docs/接口约定.md` → 相关方确认，之后才能改代码。
