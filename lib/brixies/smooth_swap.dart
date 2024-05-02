
part of devspace;

typedef ValueBasedBuilder<T> = Widget Function(BuildContext context, T value);

class SmoothSwap<T> extends StatefulWidget {

  final ValueBasedBuilder<T> builder;
  final T value;
  final BoxFit? fit;
  final Duration duration;
  final Curve curve;

  const SmoothSwap({
    super.key,
    required this.value,
    this.fit,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
    required this.builder,
  });

  @override
  State<SmoothSwap<T>> createState() => _SmoothSwapState<T>();
}

class _SmoothSwapState<T> extends State<SmoothSwap<T>> {

  Key _buildKey = UniqueKey();

  
  @override
  void didUpdateWidget(covariant SmoothSwap<T> oldWidget)
  {
    if (widget.value != oldWidget.value)
    {
      _buildKey = UniqueKey();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context)
  {
    return _SmoothSwapByKey(
      duration: widget.duration, 
      curve: widget.curve,
      child: Container(
        key: _buildKey,
        // ignore: null_check_on_nullable_type_parameter
        child: widget.builder(context, widget.value),
      ),
    );
  }
}



/// The child needs to have a key, if the key changes the animation will be performed.
class _SmoothSwapByKey extends StatefulWidget {

  final Duration duration;
  final Curve curve;
  final Widget child;

  _SmoothSwapByKey({
    required this.duration,
    this.curve = Curves.easeInOut,
    required this.child,
  }) :
    assert(child.key != null);

  @override
  State<_SmoothSwapByKey> createState() => _SmoothSwapByKeyState();
}

class _SmoothSwapByKeyState extends State<_SmoothSwapByKey> {

  double _currentToAnimateOpacity = 1.0;
  double _currentValidatedOpacity = 1.0;
  Duration? _halfDuration;
  Widget? _currentInputChild;
  Widget? _currentDisplayChild;

  @override
  void initState()
  {
    super.initState();

    _currentInputChild = widget.child;
    _currentDisplayChild = widget.child;
    _halfDuration = Duration(microseconds: widget.duration.inMicroseconds ~/ 2);
  }

  @override
  void didUpdateWidget(covariant _SmoothSwapByKey oldWidget)
  {
    if (widget.duration != oldWidget.duration)
    {
      _halfDuration = Duration(microseconds: widget.duration.inMicroseconds ~/ 2);
    }

    super.didUpdateWidget(oldWidget);
  }


  @override
  Widget build(BuildContext context)
  {
    if (widget.child.key != _currentInputChild!.key)
    {
      // child changed
      _currentInputChild = widget.child;

      if (_currentValidatedOpacity == 1.0)
      {
        // trigger animation
        _currentToAnimateOpacity = 0.0;
      }
      // else:
      // still in another animation
      // wait for it to finish
    }

    return AnimatedOpacity(
      curve: widget.curve,
      opacity: _currentToAnimateOpacity,
      duration: _halfDuration!,
      onEnd: _onAnimationEnd,
      child: _currentDisplayChild,
    );
  }

  void _onAnimationEnd()
  {
    if (_currentToAnimateOpacity == 0.0)
    {
      setState(()
      {
        _currentValidatedOpacity = _currentToAnimateOpacity;
        _currentDisplayChild = _currentInputChild;
        _currentToAnimateOpacity = 1.0;
      });
    }
    else
    {
      if (_currentDisplayChild!.key != _currentInputChild!.key)
      {
        setState(()
        {
          _currentValidatedOpacity = _currentToAnimateOpacity;
          _currentToAnimateOpacity = 0.0;
        });
      }
      else
      {
        setState(()
        {
          _currentValidatedOpacity = _currentToAnimateOpacity;
        });
      }
    }
  }
}