part of devspace;



class AnimatedIntBuilder extends StatefulWidget {

  final int value;
  final Duration? duration;
  final Curve curve;
  final Widget Function(BuildContext context, int value) builder;

  const AnimatedIntBuilder({
    super.key,
    required this.value,
    this.duration,
    this.curve = Curves.linear,
    required this.builder
  });

  @override
  State<AnimatedIntBuilder> createState() => _AnimatedIntBuilderState();
}

class _AnimatedIntBuilderState extends State<AnimatedIntBuilder> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;
  bool _initialized = false;
  final Tween<double> _tween = Tween<double>(begin: 0, end: 1);

  late int _currentValue;
  int? _fromValue;

  @override
  void didChangeDependencies()
  {
    super.didChangeDependencies();

    if (!_initialized)
    {
      _currentValue = widget.value;
      _initialized = true;
      _controller = AnimationController(
        vsync: this,
        duration: widget.duration ?? context.animations.durationGeneral,
        value: 0,
      );

      _animation = _tween.animate(
        CurvedAnimation(
          parent: _controller,
          curve: widget.curve,
        ),
      );
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedIntBuilder oldWidget)
  {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value)
    {
      _fromValue = _currentValue;
      _currentValue = widget.value;
      _controller.forward(from: 0);
    }
  }



  @override
  Widget build(BuildContext context)
  {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child)
      {
        int value = _fromValue != null ? ((_currentValue - _fromValue!) * _animation.value).toInt() + _fromValue! : _currentValue;
        return widget.builder(context, value);
      },
    );
  }


  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }
}