# 食匣 FoodBox —— Flutter 环境搭建指南

> 适用对象：全组四人（第一次搭 Flutter 环境）。
> 目标：**一次搭好，全组版本一致**。版本不一致是新手组最隐蔽的坑——同一份代码你能跑别人报错，往往就是这个原因。
> 遇到本文没写的情况：先别乱试，群里问组长。

---

## 〇、版本基线（冻结，不要自作主张升级）

| 组件 | 版本 | 说明 |
|---|---|---|
| Flutter | **3.47.2 stable** | 组长实测基线 |
| Dart | **3.13.2** | 随 Flutter 附带，不用单独装 |
| JDK | 17 及以上 | Android 构建需要 |
| Visual Studio 2022 | 社区版即可，需勾选「使用 C++ 的桌面开发」 | Windows 桌面端构建需要 |

校验命令（搭完后必须输出与上表一致）：

```bash
flutter --version
```

**不要**执行 `flutter upgrade`、`flutter channel master` 之类的命令。要升级先群里说。

---

## 一、先把路径搞对（最容易翻车的一步）

Flutter 工程路径**不要含中文、空格、特殊符号**。

- ✅ `D:\dev\flutter`（SDK 位置）
- ✅ `D:\dev\FoodBox`（工程位置）
- ❌ `D:\我的项目\食匣\...`

原因：Gradle、NDK、CMake 这些底层工具链对非 ASCII 路径的处理并不可靠，
报错往往还看不出跟路径有关。这条踩过一次就够，别试。

---

## 二、Windows 桌面端（先搭这个，最快能跑起来）

### 1. 下载并解压 Flutter SDK

1. 打开 https://docs.flutter.dev/get-started/install/windows
2. 下载 **stable** 版 zip（约 1GB）
3. 解压到 `D:\dev\flutter`（解压后该目录下应能看到 `bin`、`packages` 等文件夹）

### 2. 把 Flutter 加进 PATH

`Win + R` → 输入 `sysdm.cpl` → 高级 → 环境变量 → 用户变量 `Path` → 新建：

```
D:\dev\flutter\bin
```

确定后**重开一个终端**（旧终端不会刷新环境变量）。

### 3. 配置国内镜像（重要）

不配镜像，`pub get` 会慢到怀疑人生甚至超时。在用户环境变量里新建两个：

| 变量名 | 值 |
|---|---|
| `PUB_HOSTED_URL` | `https://pub.flutter-io.cn` |
| `FLUTTER_STORAGE_BASE_URL` | `https://storage.flutter-io.cn` |

### 4. 安装 Visual Studio 2022

https://visualstudio.microsoft.com/zh-hans/downloads/ → 社区版（免费）。

安装时在「工作负载」页勾选：

- ☑ **使用 C++ 的桌面开发**（必须，Flutter Windows 端靠它编译）
- ☑ Windows 10/11 SDK（勾选工作负载后默认会带上）

安装完重启电脑。

### 5. 启用桌面端并自检

```bash
flutter config --enable-windows-desktop
flutter doctor
```

`flutter doctor` 里 **"Windows (desktop)" 和 "Flutter" 两项必须是 ✓**。
其余项先不管（Android 见下一节）。

---

## 三、Android 端

### 1. 安装 Android Studio

https://developer.android.com/studio → 下载安装（一路下一步）。

首次启动会引导装 SDK，默认位置 `C:\Users\<你>\AppData\Local\Android\Sdk` 即可。

在 **More Actions → SDK Manager** 里确认已安装：

- Android SDK Platform（API 34 / 35 任一即可）
- Android SDK Platform-Tools
- Android SDK Build-Tools
- Android SDK Command-line Tools（**这个必须勾**，否则 `flutter doctor` 会报 licenses 问题）

### 2. 接受许可

```bash
flutter doctor --android-licenses
```

一路 `y`。

### 3. 建一个模拟器（或直接用真机）

- **模拟器**：Android Studio → Device Manager → Create Device → 选一款 Pixel → 系统镜像选 API 34 → 完成。
- **真机**（推荐，更快）：手机设置里打开「开发者选项 → USB 调试」，用数据线连电脑，手机上点「允许调试」。

### 4. 验收

```bash
flutter devices
```

应能看到 `Windows (desktop)` 和你的安卓设备/模拟器。

---

## 四、代码编辑器

任选其一，**别两个都用**（插件会打架）：

- **VS Code**（推荐，轻）：装扩展 `Flutter`（会自动带上 `Dart`）
- **Android Studio**：装插件 `Flutter`（会自动带上 `Dart`）

---

## 五、跑通「Hello FoodBox」

```bash
# 1. 克隆仓库（换成你的工作目录，注意不含中文）
cd D:\dev
git clone https://github.com/gij072858-cmd/FoodBox.git
cd FoodBox

# 2. 建 dev 分支并切过去
git checkout dev

# 3. 拉依赖
cd app
flutter pub get

# 4. 跑起来（先跑 Windows，最快）
flutter run -d windows
```

看到底部「首页 / 动态 / 我的」三段式导航、首页顶部「库 / 菜式 / 时序」三个 Tab —— **你的环境就算搭好了**。

再跑一次安卓端：

```bash
flutter run -d <你的设备 id>
```

双端都能起来，就可以去领任务了。

---

## 六、常见坑（踩过的都记在这，一人踩坑全组受益）

| 现象 | 原因 | 解决 |
|---|---|---|
| `pub get` 卡住 / 超时 | 没配镜像或网络问题 | 回到第二节第 3 步配 `PUB_HOSTED_URL` |
| 各种莫名其妙的构建错误 | 工程路径含中文 / 空格 | 换到纯英文路径重新克隆 |
| `flutter analyze` 直接崩溃退出，报 <br>`Unhandled exception` + `FormatException: Unterminated string` | **已知 Flutter 工具缺陷**（2026-09-11 组长实测确认）：分析服务器解析含中文路径的 JSON 消息时崩溃，发生在代码被检查之前，**不是你的代码问题**——`flutter test` 能全绿即可证明 | 改用 `dart analyze`：读的是**同一份** `analysis_options.yaml`（含 flutter_lints 与项目规则），检出结果完全等同；根治办法是把工程迁到纯英文路径 |
| `flutter doctor` 说 Android licenses 未接受 | 没装 Command-line Tools | SDK Manager 里补装后 `flutter doctor --android-licenses` |
| Windows 端构建报缺少 C++ 工具链 | Visual Studio 没勾「使用 C++ 的桌面开发」 | 打开 VS Installer → 修改 → 勾上 |
| `dart run build_runner build` 报 <br>`Unable to write file: ...build.dart.aot` | 本机 AOT 编译产物写入失败（杀软 / 权限 / 路径） | 加参数改为 JIT 模式：<br>`dart run build_runner build --force-jit`（**组内统一用这条**） |
| 改了数据库表结构但代码没变化 | 忘了跑代码生成 | 见下方第七节 |
| 提交时提示行尾符 `CRLF/LF` 警告 | Windows 与仓库行尾符差异 | 无害可忽略；或在仓库根执行 `git config core.autocrlf input` |

---

## 七、日常命令速查

```bash
# 依赖
flutter pub get                 # 拉依赖（每次 pull 到 pubspec 变更后执行）

# 运行
flutter run -d windows          # 跑 Windows 桌面端
flutter run -d <device-id>      # 跑安卓端
flutter devices                 # 看有哪些设备

# 质量自查（推送前必须跑，三条全过才推）
flutter analyze                 # 静态检查（中文路径下会崩溃，属已知工具缺陷，见第六节；等效替代 dart analyze）
dart analyze                    # flutter analyze 崩溃时的替代，结果完全等同
flutter test                    # 单元测试 / 组件测试
dart format .                   # 统一代码格式

# 数据库代码生成（改了 lib/data/local/database.dart 之后执行）
# 统一加 --force-jit：绕开部分机器上 AOT 产物写入失败的问题
dart run build_runner build --force-jit
```

---

## 八、搭好后请做两件事

1. 把 **GitHub 用户名**发给组长，拉你进 Collaborator；
2. 在仓库目录把提交身份配好（提交记录里显示的名字）：

```bash
git config --global user.name "你的名字"
git config --global user.email "你的GitHub注册邮箱"
```

然后照《docs/GitHub协作指南.md》完成**首次提交**——这是 W1 的硬验收指标。

---

*本文档随环境问题持续更新：谁踩了新的坑，就在第六节加一行，并向组长提交。*
