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
| PR（Pull Request） | "我改完了，请审核并合并进公共分支"的申请单（本项目日常直推 dev，**PR 仅保留给较大的功能分支合并**） |
| merge（合并）        | 把分支的改动并入目标分支             |

**本项目只有两条长期分支**：

- `main`：稳定版，**只有组长能把 dev 合并进来**，验收通过才并；
- `dev`：集成分支，所有人的工作直接提交到这里，每晚必须保持可运行。

> **协作方式**：日常改动**直接推到 `dev`**，不需要功能分支、不需要提 PR。只有当你改的是"较大、容易弄崩别人"的东西时，才开一个功能分支，写完合并回 dev。

---

## 三、每日黄金流程（照抄即可）

### 第 1 步：开工前，同步最新代码

```powershell
git checkout dev
git pull
```

### 第 2 步：确认自己在 dev 上（日常直推，不用开功能分支）

```powershell
git checkout dev
git pull
```

> 日常改动**就在 dev 上直接做**。只在改动较大、容易弄崩别人时才开功能分支：
>
> ```powershell
> git checkout -b feature/pantry-card-list   # 命名 feature/<模块>-<简述>
> ```

> 一个分支只做一件事（一个功能或一个修复）。做完合并回 dev 后删掉它。

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
- **改过共享区文件（`core/`、`data/`、`widgets/`、`接口约定.md`）必须在提交说明里加 `[shared]`**，并先在群里说一声

示例：`fix(recipe): 修复长菜名详情页溢出问题`、`docs: 更新接口约定`

### 第 4 步：推送到 GitHub（直推 dev）

```powershell
git push
```

（第一次推某个分支时用 `git push -u origin dev`。之后直接 `git push` 即可）

**只有组长把 dev 合进 main**。你**永远不推 `main`**。

### 第 5 步：如果你开了功能分支，合并回 dev

直推派可跳过本步。开了 `feature/...` 的，写完这样合并回 dev：

```powershell
git checkout dev
git pull
git merge feature/pantry-card-list     # 把功能分支并入 dev
git push                                # 推送，完成合回
git branch -d feature/pantry-card-list  # 删掉用过的功能分支
```

> 如果合并时报冲突，别慌，跳到第 5 章的"冲突自救"。
> **也不要推 main**。dev 合 main 是组长的事，你 push main 会被 GitHub 拒绝（main 受保护）。

---

## 四、共享区纪律（最重要的规矩）

```
lib/core/     lib/data/     lib/widgets/    ← 共享区，全组都在用
lib/features/<你的模块>/                       ← 你的自留地，自由改
```

- 改共享区文件之前，先群里说一声"我要改 XX 了"，避免和别人撞车；
- 提交说明里加 `[shared]` 前缀，push 后在群里广播一声，其他人尽快 `git pull`；
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

- ❌ 不直接 `commit` 到 `main`（`dev` 可以直推，见上文日常流程）；
- ❌ 不用 `git push --force`（强制推送会覆盖别人的工作）；
- ❌ 不提交密钥、密码、`.env` 文件；
- ❌ 不提交超过几十 MB 的大文件（图片素材走 `assets/` 规范，超大素材先问组长）；
- ❌ 合并冲突没解决完就提交（文件里残留 `<<<<<<<` 标记）。

## 八、每周节奏提醒

- **每天**：开工 `pull` → 收工 `push`（当天代码当天上云，电脑坏了也不丢）；
- **隔日**：更新 GitHub Projects 看板卡片状态；
- **周末验收前**：把你的改动 push 到 dev（留给组长 Review 与验收时间），看板必须最新；
- **周末**：组长对照当周里程碑逐条验收，关键链路录屏存档，结论发群；验收通过后由组长将 `dev` 合入 `main` 打 tag。

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
