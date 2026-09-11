import 'package:flutter/material.dart';

import '../core/theme.dart';

/// 入场动画：淡入 + 从下方滑入
///
/// 用于页面加载时元素依次出现的效果。
class FbFadeInUp extends StatefulWidget {
  const FbFadeInUp({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = FBMotion.entrance,
    this.curve = FBMotion.easeOutQuart,
    this.offset = FBMotion.entranceOffset,
    this.autoStart = true,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final double offset;
  final bool autoStart;

  @override
  State<FbFadeInUp> createState() => _FbFadeInUpState();
}

class _FbFadeInUpState extends State<FbFadeInUp>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _translate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
    _translate = Tween<Offset>(
      begin: Offset(0, widget.offset),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );

    if (widget.autoStart) {
      _startWithDelay();
    }
  }

  Future<void> _startWithDelay() async {
    if (widget.delay != Duration.zero) {
      await Future<void>.delayed(widget.delay);
    }
    if (mounted) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.translate(
            offset: _translate.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

/// 列表错位入场：给每个子项按 index 增加延迟
class FbStaggerList extends StatelessWidget {
  const FbStaggerList({
    super.key,
    required this.children,
    this.duration = FBMotion.entrance,
    this.step = FBMotion.staggerStep,
    this.offset = FBMotion.entranceOffset,
    this.curve = FBMotion.easeOutQuart,
  });

  final List<Widget> children;
  final Duration duration;
  final Duration step;
  final double offset;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(children.length, (int index) {
        final Duration delay = Duration(
          milliseconds: (index * step.inMilliseconds).clamp(
            0,
            (FBMotion.maxStaggerItems * step.inMilliseconds),
          ),
        );
        return FbFadeInUp(
          delay: delay,
          duration: duration,
          offset: offset,
          curve: curve,
          child: children[index],
        );
      }),
    );
  }
}

/// 按压反馈：按下时缩小 + 阴影减弱，释放回弹
///
/// 用于所有可交互卡片、按钮、列表行。
class FbPressFeedback extends StatefulWidget {
  const FbPressFeedback({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.pressedScale = FBMotion.cardPressedScale,
    this.pressedY = 0,
    this.duration = FBMotion.instant,
    this.curve = FBMotion.easeInOut,
    this.behavior = HitTestBehavior.opaque,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double pressedScale;
  final double pressedY;
  final Duration duration;
  final Curve curve;
  final HitTestBehavior behavior;

  @override
  State<FbPressFeedback> createState() => _FbPressFeedbackState();
}

class _FbPressFeedbackState extends State<FbPressFeedback> {
  bool _isPressed = false;

  void _setPressed(bool value) {
    if (_isPressed == value) return;
    setState(() => _isPressed = value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: widget.behavior,
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: AnimatedContainer(
        duration: widget.duration,
        curve: widget.curve,
        transform: Matrix4.diagonal3Values(
          _isPressed ? widget.pressedScale : 1,
          _isPressed ? widget.pressedScale : 1,
          1,
        )..translateByDouble(0, _isPressed ? widget.pressedY : 0, 0, 0),
        transformAlignment: Alignment.center,
        child: widget.child,
      ),
    );
  }
}

/// 浮动动画：上下轻微浮动，用于空态插画、Hero 装饰
class FbFloat extends StatefulWidget {
  const FbFloat({
    super.key,
    required this.child,
    this.amplitude = 6,
    this.duration = const Duration(seconds: 3),
  });

  final Widget child;
  final double amplitude;
  final Duration duration;

  @override
  State<FbFloat> createState() => _FbFloatState();
}

class _FbFloatState extends State<FbFloat>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: -widget.amplitude,
      end: widget.amplitude,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

/// 脉冲动画：用于新消息、提醒、角标
class FbPulse extends StatefulWidget {
  const FbPulse({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.minScale = 1,
    this.maxScale = 1.08,
  });

  final Widget child;
  final Duration duration;
  final double minScale;
  final double maxScale;

  @override
  State<FbPulse> createState() => _FbPulseState();
}

class _FbPulseState extends State<FbPulse>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    _scale = Tween<double>(
      begin: widget.minScale,
      end: widget.maxScale,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scale,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(scale: _scale.value, child: child);
      },
      child: widget.child,
    );
  }
}

/// 数字递增动画：从 0 滚动到目标值
class FbCountUp extends StatefulWidget {
  const FbCountUp({
    super.key,
    required this.value,
    this.duration = FBMotion.normal,
    this.curve = FBMotion.easeOutQuart,
    this.style,
    this.prefix = '',
    this.suffix = '',
  });

  final int value;
  final Duration duration;
  final Curve curve;
  final TextStyle? style;
  final String prefix;
  final String suffix;

  @override
  State<FbCountUp> createState() => _FbCountUpState();
}

class _FbCountUpState extends State<FbCountUp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  int _previousValue = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = IntTween(begin: 0, end: widget.value).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(FbCountUp oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _previousValue = oldWidget.value;
      _controller.duration = widget.duration;
      _animation = IntTween(begin: _previousValue, end: widget.value).animate(
        CurvedAnimation(parent: _controller, curve: widget.curve),
      );
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Text(
          '${widget.prefix}${_animation.value}${widget.suffix}',
          style: widget.style ?? FBTextStyle.numberDisplay,
        );
      },
    );
  }
}

/// 进度条动画：从 0 填充到目标值
class FbAnimatedProgress extends StatelessWidget {
  const FbAnimatedProgress({
    super.key,
    required this.value,
    this.height = 6,
    this.backgroundColor = FBColor.fill,
    this.gradient = FBGradient.progress,
    this.duration = FBMotion.normal,
    this.curve = FBMotion.easeOutQuart,
    this.borderRadius = FBRadius.pillAll,
  });

  final double value; // 0.0 - 1.0
  final double height;
  final Color backgroundColor;
  final Gradient gradient;
  final Duration duration;
  final Curve curve;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxWidth = constraints.maxWidth;
        return Container(
          height: height,
          width: maxWidth,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: Stack(
            children: <Widget>[
              AnimatedContainer(
                duration: duration,
                curve: curve,
                width: maxWidth * value.clamp(0.0, 1.0),
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: borderRadius,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// 渐变背景容器：用于 Hero 区、空态等需要氛围的场景
class FbGradientBackground extends StatelessWidget {
  const FbGradientBackground({
    super.key,
    required this.child,
    this.gradient = FBGradient.warm,
    this.glowColor,
    this.glowRadius = 0.6,
  });

  final Widget child;
  final Gradient gradient;
  final Color? glowColor;
  final double glowRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: Stack(
        children: <Widget>[
          if (glowColor != null)
            Positioned(
              top: -100,
              right: -80,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: FBGradient.heroGlow(
                    color: glowColor!,
                    radius: glowRadius,
                  ),
                ),
              ),
            ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
