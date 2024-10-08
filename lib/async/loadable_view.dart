

part of devspace;



class LoadableView extends StatelessWidget {

  final bool isLoading;
  final kSize3 loadingIndicatorSize;
  final bool justOverlay;
  final bool maintainState;
  final StackFit stackFit;
  final Widget child;

  const LoadableView({
    super.key,
    required this.isLoading,
    this.loadingIndicatorSize = kSize3.M,
    this.justOverlay = false,
    this.maintainState = true,
    this.stackFit = StackFit.loose,
    required this.child,
  }) : assert(!(justOverlay && !maintainState));

  @override
  Widget build(BuildContext context)
  {
    if (!maintainState)
    {
      if (!isLoading)
      {
        return child;
      }

      return Center(
        child: ArchLoadingIndicator(
          size: loadingIndicatorSize,
        )
      );
    }

    return Stack(
      fit: stackFit,
      children: [

        Visibility(
          visible: !isLoading || justOverlay,
          maintainState: true,
          maintainAnimation: true,
          maintainSize: true,
          child: child,
        ),

        if (isLoading) Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(child: ArchLoadingIndicator(
            size: loadingIndicatorSize,
          )),
        ),

      ],
    );
  }
}