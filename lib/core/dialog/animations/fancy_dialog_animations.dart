part of devspace;



class FancyDialogAnimationA extends material.StatefulWidget {

  final WidgetBuilder builder;

  const FancyDialogAnimationA({
    super.key,
    required this.builder,
  });

  @override
  material.State<FancyDialogAnimationA> createState() => _FancyDialogAnimationAState();
}

class _FancyDialogAnimationAState extends material.State<FancyDialogAnimationA> {
  final opacityProp = MovieTweenProperty<double>();

  final offsetProp = MovieTweenProperty<Offset>();

  @override
  Widget build(BuildContext context)
  {
    final moveStep = context.screenSize.height / 300;
    return InOutMovie(
      intro: MovieTween()
        ..scene(duration: 500.asDuration, curve: Curves.easeInOut)
        .tween(opacityProp, Tween(begin: 0.0, end: 1.0))

        ..scene(duration: 500.asDuration, curve: Curves.easeInOutBack)
        .tween(offsetProp, Tween(begin: Offset(0, -(context.screenSize.height / 3)), end: Offset.zero))

        .thenFor(duration: 850.asDuration, curve: Curves.easeOutQuad)
        .tween(offsetProp, Tween(begin: Offset.zero, end: Offset(0, -moveStep))),

      stay: MovieTween()
        ..scene(duration: 1500.asDuration, curve: Curves.easeInOut)
        .tween(offsetProp, Tween(begin: Offset(0, -moveStep), end: Offset(0, moveStep)))

        .thenFor(duration: 1500.asDuration, curve: Curves.easeInOut)
        .tween(offsetProp, Tween(begin: Offset(0, moveStep), end: Offset(0, -moveStep))),
      child: RepaintBoundary(child: widget.builder(context)),
      builder: (context, moview, child)
      {
        return Opacity(
          opacity: moview.getOrDefault(opacityProp, 1.0),
          child: Transform.translate(
            offset: moview.getOrDefault(offsetProp, Offset.zero),
            child: child
          )
        );
      },
    );
  }
}