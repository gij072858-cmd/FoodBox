import 'package:flutter_test/flutter_test.dart';
import 'package:foodbox/core/countdown.dart';

/// 倒计时控制器测试（技术规范：结束时间戳方案，严禁 Timer 累加）
void main() {
  test('剩余时间由结束时刻现算，不依赖周期计数', () async {
    final CountdownController controller = CountdownController(
      duration: const Duration(milliseconds: 300),
      tickInterval: const Duration(milliseconds: 50),
    );
    addTearDown(controller.dispose);

    expect(controller.remaining.inMilliseconds, closeTo(300, 40));
    controller.start();
    await Future<void>.delayed(const Duration(milliseconds: 150));
    expect(controller.remaining.inMilliseconds, lessThan(250));
    expect(controller.isFinished, isFalse);
  });

  test('传入过去的结束时刻立即判定完成（后台挂起恢复场景）', () async {
    bool done = false;
    final CountdownController controller = CountdownController(
      duration: const Duration(minutes: 5),
      endAt: DateTime.now().subtract(const Duration(seconds: 1)),
      onDone: () => done = true,
      tickInterval: const Duration(milliseconds: 20),
    );
    addTearDown(controller.dispose);

    expect(controller.isFinished, isTrue);
    expect(controller.progress, 1);

    controller.start();
    await Future<void>.delayed(const Duration(milliseconds: 60));
    expect(done, isTrue);
    expect(controller.isRunning, isFalse); // 完成后自动停表
  });

  test('暂停冻结剩余时长，恢复后继续走', () async {
    final CountdownController controller = CountdownController(
      duration: const Duration(milliseconds: 400),
      tickInterval: const Duration(milliseconds: 20),
    );
    addTearDown(controller.dispose);

    controller.start();
    await Future<void>.delayed(const Duration(milliseconds: 100));
    controller.pause();
    final Duration frozen = controller.remaining;
    expect(controller.isPaused, isTrue);

    await Future<void>.delayed(const Duration(milliseconds: 150));
    expect(controller.remaining, frozen); // 暂停期间不走

    controller.resume();
    expect(controller.isPaused, isFalse);
    expect(controller.isRunning, isTrue);
  });

  test('restore 用持久化的结束时刻续算', () {
    final CountdownController controller = CountdownController(
      duration: const Duration(minutes: 10),
      tickInterval: const Duration(milliseconds: 20),
    );
    addTearDown(controller.dispose);

    final DateTime savedEnd = DateTime.now().add(const Duration(minutes: 3));
    controller.restore(savedEnd);
    expect(controller.endAt, savedEnd);
    expect(controller.remaining.inMinutes, 2); // 约 3 分钟，容忍取值瞬间
    controller.pause();
  });
}
