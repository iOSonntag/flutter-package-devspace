part of devspace;


typedef AnimationBuilderCallback<T> = Widget Function(BuildContext context, T value);
typedef AnimationEndCallback = void Function(bool completed);

/// If no duration is specified, the [context.animations.durationGeneral] is
/// used. 
/// 
/// If no curve is specified, the [context.animations.curveGeneral] is used.
class AnimationBuilder<T> extends StatefulWidget {

  final bool playAnimation;
  final Duration? duration;
  final Curve? curve;
  final Duration? delay;
  final Tween<T>? tween;
  final AnimationEndCallback? onEnd;
  final AnimationBuilderCallback<T> builder;

  const AnimationBuilder({
    super.key,
    this.playAnimation = true,
    this.duration,
    this.curve,
    this.delay,
    this.tween,
    this.onEnd,
    required this.builder,
  });

  @override
  State<AnimationBuilder> createState() => _AnimationBuilderState<T>();
}

class _AnimationBuilderState<T> extends State<AnimationBuilder<T>> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<T> _animation;
  Timer? _delayTimer;


  bool _initialized = false;
  @override
  void didChangeDependencies()
  {
    super.didChangeDependencies();

    if (!_initialized)
    {
      _initialized = true;
      _controller = AnimationController(
        vsync: this,
        duration: widget.duration ?? context.animations.durationGeneral,
        value: 0,
      );

      _controller.addStatusListener(_onAnimationStatus);

      Tween<T>? tween = widget.tween;

      if (tween == null)
      {
        if (T != double && T != dynamic)
        {
          throw Exception('No tween was provided, so it tried to apply the default tween. The default tween type is double but the type $T was provided, thus a type mismatch occurs.');
        }

        tween = Tween<double>(begin: 0, end: 1) as Tween<T>;
      }



      _animation = tween.animate(
        CurvedAnimation(
          parent: _controller,
          curve: widget.curve ?? context.animations.curveGeneral,
        ),
      );

      if (widget.playAnimation)
      {
        _requestAnimationProcessStart();
      }
    }
  }

  @override
  void didUpdateWidget(covariant AnimationBuilder<T> oldWidget)
  {
    super.didUpdateWidget(oldWidget);

    if (widget.playAnimation != oldWidget.playAnimation)
    {
      if (widget.playAnimation)
      {
        _requestAnimationProcessStart();
      }
      else
      {
        if (_controller.isAnimating || (_delayTimer != null && _delayTimer!.isActive))
        {
          _controller.stop();
          _delayTimer?.cancel();
          widget.onEnd?.call(false);
        }
      }
    }
  }

  void _requestAnimationProcessStart()
  {
    if (widget.delay != null)
    {
      _delayTimer = Timer(widget.delay!, ()
      {
        if (widget.playAnimation)
        {
          _controller.forward(from: 0);
        }
      });
    }
    else
    {
      _controller.forward(from: 0);
    }
  }

  void _onAnimationStatus(AnimationStatus status)
  {
    if (status == AnimationStatus.completed)
    {
      widget.onEnd?.call(true);
    }
    else if (status == AnimationStatus.dismissed)
    {
      widget.onEnd?.call(false);
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => widget.builder(context, _animation.value),
    );
  }

  @override
  void dispose()
  {
    _controller.dispose();
    _delayTimer?.cancel();
    super.dispose();
  }
}