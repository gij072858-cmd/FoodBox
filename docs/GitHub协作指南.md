# 食匣 FoodBox — GitHub 协作指南

> 适用对象：本组全体成员（第一次用 Git/GitHub 协作）。
> 本文只讲"怎么操作"；为什么这么定（分支模型、共享区纪律、看板）见《02-开发总计划.md》第六章。
> 遇到本文没覆盖的情况：**先停手，群里问组长**，不要自己乱试危险命令。

---

## 一、一次性准备（只做一遍）

### 1. 安装与注册

1. 注册 GitHub 账号，把用户名发给组长，组长把你加为仓库协作者（Collaborator）；
2. 安装 Git：https://git-scm.com/download/win （一路下一步即可）；
3. 可选：安装 GitHub Desktop（图形界面，适合过渡），但本文命令以 Git 命令行为准——学会命令行，界面工具自然就会了。

### 2. 配置身份（提交记录里显示的名字）

```powershell
git config --global user.name "你的名字或GitHub用户名"
git config --global user.email "你的GitHub注册邮箱"
```

### 3. 克隆仓库到本地

```powershell
# 建议放到你常用的项目目录，例如 D 盘
cd D:\你的项目目录
git clone https://github.com/组长用户名/FoodBox.git
cd FoodBox
```

首次 push 时会弹出登录窗口，按提示授权即可（Windows 会记住凭据）。

---

## 二、核心概念 60 秒速通

| 概念               | 大白话                      |
| ---------------- | ------------------------ |
| 仓库（repo）         | 项目在云端的家，GitHub 上那份是"总仓库" |
| clone            | 把总仓库完整复制一份到你电脑           |
| commit（提交）       | 给改动拍一张"存档快照"，附一句说明       |
| push（推送）         | 把你电脑上的快照上传到 GitHub       |
| pull（拉取）         | 把别人上传到 GitHub 的新快照下载到你电脑 |
| branch（分支）       | 平行世界：你在自己的分支随便改，不影响别人    |
| PR（Pull Request） | "我改完了，请审核并合并进公共分支"的申请单   |
| merge（合并）        | 把分支的改动并入目标分支             |

**本项目只有两条长期分支**：

- `main`：稳定版，只有组长能合并，每周五更新一次；
- `dev`：集成分支，所有人的工作最终汇到这里，每晚必须保持可运行。

**你永远不直接往 `main` 和 `dev` 上提交代码**，你自己的改动永远写在功能分支上。

---

## 三、每日黄金流程（照抄即可）

### 第 1 步：开工前，同步最新代码

```powershell
git checkout dev
git pull
```

### 第 2 步：从 dev 切一个自己的功能分支

命名规则：`feature/<模块>-<简述>`，模块用英文：pantry（库）/ recipe（菜式）/ schedule（时序）/ feed（动态）/ profile（我的）/ widgets（组件）。

```powershell
git checkout -b feature/pantry-card-list
```

> 一个分支只做一件事（一个功能或一个修复）。做完合并后再切下一个。

### 第 3 步：写代码，勤提交

每完成一小步就提交一次，别攒一整天：

```powershell
git add .
git commit -m "feat(pantry): 库页面双分区布局"
```

提交信息格式（Conventional Commits）：

```
<类型>(<模块>): <一句话说明>
```

- 类型：`feat`（新功能）/ `fix`（修 bug）/ `docs`（文档）/ `style`（格式样式）/ `refactor`（重构）/ `test`（测试）
- 说明用中文，一句话讲清做了什么

示例：`fix(recipe): 修复长菜名详情页溢出问题`、`docs: 更新接口约定`

### 第 4 步：推送到 GitHub

```powershell
git push -u origin feature/pantry-card-list
```

（同一个分支第二次推送起，直接 `git push` 即可）

### 第 5 步：在 GitHub 网页上提 PR

1. 打开仓库页面，GitHub 会提示你刚推送的分支，点 **Compare & pull request**；
2. 确认合并方向：**你的分支 → `dev`**（千万别选成 main！）；
3. 标题写清改动，**改过共享区文件（`core/`、`data/`、`widgets/`）必须在标题加 `[shared]`**；
4. 描述里填两条：① 改了什么 ② 怎么自测的（附截图更好）；
5. 点 Create，然后把 PR 链接发群里 @组长 求 Review。

### 第 6 步：Review 与合并

- 组长 Review 后如有意见，在 PR 里会留评论；你在**原分支**继续改、继续 push，PR 会自动更新；
- 通过后组长合并。合并完成后你可以删掉本地分支开下一个：

```powershell
git checkout dev
git pull
git branch -d feature/pantry-card-list
```

---

## 四、共享区纪律（最重要的规矩）

```
lib/core/     lib/data/     lib/widgets/    ← 共享区，全组都在用
lib/features/<你的模块>/                       ← 你的自留地，自由改
```

- 改共享区文件之前，先群里说一声"我要改 XX 了"，避免和别人撞车；
- PR 标题加 `[shared]`，合并后组长会在群里广播，其他人尽快 `git pull`；
- 拿不准某个文件算不算共享区 → 问组长。

---

## 五、冲突自救（遇到别慌）

`git pull` 时出现 `CONFLICT` 字样 = 你和别人改了同一个文件的同一处。按这个流程来：

1. 打开冲突文件，找到这样的标记：

```
<<<<<<< HEAD
你的内容
=======
别人的内容
>>>>>>> dev
```

2. 手动改成正确的最终内容（可以保留一边，也可以两边都留），**删掉所有 `<`、`=`、`>` 标记行**；
3. 拿不定主意就截图发群里，约对方一起定（共享区冲突必须结对解决）；
4. 改完后：

```powershell
git add .
git commit -m "merge: 解决与 dev 的冲突"
```

---

## 六、翻车急救表

| 我不小心…               | 怎么办                                  |
| ------------------- | ------------------------------------ |
| 提交信息写错了（还没 push）    | `git commit --amend -m "新信息"`        |
| 改乱了想全部放弃（还没 commit） | `git restore .`（**未提交的改动会丢失，确认后再用**） |
| 提交到了错误的分支（还没 push）  | 先别动，找组长                              |
| 想看看自己改了哪些文件         | `git status`                         |
| 想看代码和别人差多少          | `git diff`                           |
| 完全不知道现在处于什么状态       | `git status` + 截图发群里                 |

## 七、红线（永远不要做）

- ❌ 不直接 `commit` 到 `main` 或 `dev`；
- ❌ 不用 `git push --force`（强制推送会覆盖别人的工作）；
- ❌ 不提交密钥、密码、`.env` 文件；
- ❌ 不提交超过几十 MB 的大文件（图片素材走 `assets/` 规范，超大素材先问组长）；
- ❌ 合并冲突没解决完就提交（文件里残留 `<<<<<<<` 标记）。

## 八、每周节奏提醒

- **每天**：开工 `pull` → 收工 `push`（当天代码当天上云，电脑坏了也不丢）；
- **隔日**：更新 GitHub Projects 看板卡片状态；
- **周五组会前**：你的 PR 必须已提交（留给 Review 时间），看板必须最新；
- **周五晚**：组长把 `dev` 合入 `main` 打 tag，全组验收录屏。

## 九、命令速查（收藏本页）

```powershell
git status                  # 看状态
git pull                    # 拉取最新
git checkout -b <分支名>     # 新建并切换分支
git checkout <分支名>        # 切换分支
git add .                   # 暂存全部改动
git commit -m "信息"         # 提交
git push                    # 推送
git branch                  # 看本地有哪些分支
git log --oneline -5        # 看最近 5 条提交
```

## 十、进阶学习资源

- Git 官方书（免费，有中文版）：https://git-scm.com/book/zh/v2
- GitHub 官方文档（PR/Issues 用法）：https://docs.github.com/zh
- 可视化练分支（边玩边学）：https://learngitbranching.js.org/?locale=zh_CN

---

*有疑问先查本文，再查总计划第六章*
