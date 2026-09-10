import 'dart:async';

import 'package:flutter/foundation.dart';

/// ===========================================================================
/// 倒计时控制器 —— **结束时间戳方案**（构想第四章改进 7，技术规范）
///
/// 严禁用 Timer 周期计数累加时间。本类里：
///   - 唯一事实来源是 [_endAt]（结束时刻）；
///   - Timer 只负责"隔一会儿让 UI 重绘一次"，不参与时间计算；
///   - 剩余时间永远由 `结束时刻 - 当前时刻` 现算。
///
/// 因此以下三种情况天然正确、无需任何补偿逻辑：
///   1. 页面切走再切回；
///   2. App 被后台挂起 / 系统休眠后恢复；
///   3. 多倒计时并行（时序模式下的刚需，构想 2.3.3）。
///
/// 使用方（成员三的菜式详情、组长的时序执行页）直接 `ListenableBuilder`
/// 订阅本对象即可；成员四的 `CountdownBar` 组件内部如需逐帧平滑，
/// 自行叠加 Ticker 驱动重绘，但**不得**改写本类的取时逻辑。
///
/// 负责人：组长（W1 提供基础工具，W1–W2 跨周项）。
/// ===========================================================================
class CountdownController extends ChangeNotifier {
  CountdownController({
    required this.duration,
    DateTime? endAt,
    this.onDone,
    this.tickInterval = const Duration(milliseconds: 200),
  }) : _endAt = endAt ?? DateTime.now().add(duration);

  /// 总时长
  final Duration duration;

  /// 完成回调（播放提示音 + Toast，构想 2.3.3）
  final VoidCallback? onDone;

  /// 重绘节拍；仅影响 UI 刷新频率，不影响计时精度
  final Duration tickInterval;

  DateTime _endAt;

  /// 暂停时冻结的剩余时长
  Duration? _frozenRemaining;

  Timer? _ticker;
  bool _doneNotified = false;

  /// 结束时刻（可持久化后用于后台恢复：重建时传回本值即可续算）
  DateTime get endAt => _endAt;

  bool get isRunning => _ticker != null;

  bool get isPaused => _frozenRemaining != null;

  bool get isFinished => remaining == Duration.zero;

  /// 剩余时长（现算，不累加）
  Duration get remaining {
    final Duration? frozen = _frozenRemaining;
    if (frozen != null) return frozen;
    final Duration left = _endAt.difference(DateTime.now());
    return left.isNegative ? Duration.zero : left;
  }

  /// 进度 0.0 → 1.0（从左向右生长至满格即完成，构想 2.3.3）
  double get progress {
    final int total = duration.inMilliseconds;
    if (total <= 0) return 1;
    final double value = 1 - remaining.inMilliseconds / total;
    return value < 0
        ? 0
        : value > 1
        ? 1
        : value;
  }

  /// 剩余时间的 mm:ss 文案
  String get remainingLabel {
    final Duration left = remaining;
    final String mm = left.inMinutes.remainder(60).toString().padLeft(2, '0');
    final String ss = left.inSeconds.remainder(60).toString().padLeft(2, '0');
    final int hours = left.inHours;
    return hours > 0 ? '$hours:$mm:$ss' : '$mm:$ss';
  }

  /// 开始 / 继续
  void start() {
    final Duration? frozen = _frozenRemaining;
    if (frozen != null) {
      _endAt = DateTime.now().add(frozen);
      _frozenRemaining = null;
    }
    if (remaining > Duration.zero) {
      _doneNotified = false;
    }
    _ticker ??= Timer.periodic(tickInterval, _onTick);
    notifyListeners();
  }

  /// 暂停：把此刻的剩余时长冻结（不改计时口径，只是暂时不读时钟）
  void pause() {
    if (isPaused) return;
    _frozenRemaining = remaining;
    _stopTicker();
    notifyListeners();
  }

  /// 恢复
  void resume() {
    if (!isPaused) return;
    start();
  }

  /// 重置：重新计一轮完整时长
  void reset() {
    _stopTicker();
    _frozenRemaining = null;
    _endAt = DateTime.now().add(duration);
    _doneNotified = false;
    notifyListeners();
  }

  /// 从持久化的结束时刻恢复（后台挂起回来后调用；剩余为 0 则直接完成）
  void restore(DateTime endAt) {
    _frozenRemaining = null;
    _endAt = endAt;
    _doneNotified = false;
    start();
  }

  void _onTick(Timer timer) {
    if (remaining == Duration.zero) {
      _stopTicker();
      if (!_doneNotified) {
        _doneNotified = true;
        onDone?.call();
      }
    }
    notifyListeners();
  }

  void _stopTicker() {
    _ticker?.cancel();
    _ticker = null;
  }

  @override
  void dispose() {
    _stopTicker();
    super.dispose();
  }
}
