# assets/data/ —— 预置数据

数据文件为 JSON，随 `flutter build` 打包进 App。

| 文件 | 内容 | 负责人 | 计划 |
|---|---|---|---|
| `food_items.json` | 食材 / 调料基础库（≥200 条：名称、分类、默认保质期、默认存放位置、简介四段）。**W1 模板已就位**（5 条示例），W2 起按同格式扩充 | 成员二 | W2 |
| `recipes.json` | 官方菜式 30–50 道（含步骤、耗时、资源占用、安全标记、适宜月份标签）。**W1 模板已就位**（1 道完整示例），W2–W4 按同格式扩充 | 成员三 | W4 |
| `alias_map.json` | 食材别名表（西红柿=番茄、土豆=马铃薯 …），供 `RecipeMatcher` 归一 | 组长 | W4 |
| `glossary.json` | 步骤术语表（焯水 / 勾芡 / 爆香 …，F8 期1 范围） | 成员四 | W5 |
| `feed_demo.json` | 动态页演示数据（5–8 条，页面内需标注"演示数据"） | 成员四 | W5 |

校验方式：组长在 W2 提供字段完整性校验脚本，JSON 通过校验才算完成。

## 字段口径（W1 模板约定）

- JSON 键名一律与 Dart 领域模型字段同名（camelCase）；
- 枚举字段填枚举 `name` 字符串，取值见 `lib/data/models/enums.dart` 与《接口约定.md》第 2 章：
  - `kind`：`ingredient` / `seasoning`
  - `storageLocation`：`fridge` / `freezer` / `room`
  - `difficulty`：`easy` / `medium` / `hard`
  - 步骤 `resources`：`stove` / `board` / `hand` / `waiting` 的数组
  - 步骤 `safetyTag`：`none` / `rawMeat` / `readyToEat` / `highHeat`

### `food_items.json`

- 顶层为数组，一个元素一条食材 / 调料；
- 必填：`name`、`category`、`kind`、`shelfLifeDays`、`storageLocation`、简介四段（`introWhat` / `introHow` / `introStore` / `introTip`）；
- 调料可附 `opened`（默认未开封）与 `barcode`（扫码自学习种子数据）；
- 数量、到期日等由用户入库时填写，预置库不写。

### `recipes.json`

- 顶层为数组，一个元素一道菜，`steps` 内嵌步骤数组（导入时拆为 `recipes` + `steps` 两张表）；
- `ingredients` 元素结构与《接口约定.md》2.2 一致；`isRequired` 决定「可做」判定，`isSeasoning` 决定详情页分列；
- **步骤质量三必填**：`durationMinutes`（支持小数）、`resources`、`safetyTag` —— 缺一项时序引擎就无法正确排程；
- `seasonMonths` 填 1–12 的整数数组，是 F12 时令推荐的数据源，每道菜都要标。
