part of devspace;


class TweenAnimationLoopBuilder<T extends Object?> extends StatefulWidget {

  final Tween<T> tween;
  final Duration duration;
  final Curve curve;
  final bool loopWithReverse;
  final ValueWidgetBuilder<T> builder;

  const TweenAnimationLoopBuilder({
    super.key,
    required this.tween,
    required this.duration,
    this.curve = Curves.linear,
    this.loopWithReverse = true,
    required this.builder
  });

  @override
  State<TweenAnimationLoopBuilder> createState() => _TweeLoopnBuilderState<T>();
}

class _TweeLoopnBuilderState<T extends Object?> extends State<TweenAnimationLoopBuilder<T>> {

  bool _animatingIn = true;
  Key _keyAnimationWidget = GlobalKey();
  final Key _keyChild = GlobalKey();

  @override
  Widget build(BuildContext context)
  {
    return  TweenAnimationBuilder<T>(
      key: _keyAnimationWidget,
      tween: _animatingIn || !widget.loopWithReverse ? widget.tween : ReverseTween(widget.tween),
      duration: widget.duration,
      curve: widget.curve,
      builder: (context, value, _)
      {
        return KeyedSubtree(
          key: _keyChild,
          child: widget.builder(context, value, null),
        );
      },
      onEnd: ()
      {
        if (!context.mounted) return;

        setState(() 
        {
          _animatingIn = !_animatingIn;
          _keyAnimationWidget = GlobalKey();
        });
      },
    );
  }
}





class FakeWidgetHolder extends StatelessWidget {

  final List<Widget> children;

  const FakeWidgetHolder({
    super.key, 
    required this.children
  });

  @override
  Widget build(BuildContext context)
  {
    throw Exception('This widget should not be rendered');
  }
}