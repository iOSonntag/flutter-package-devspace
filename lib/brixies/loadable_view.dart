

part of devspace;



class LoadableView extends StatelessWidget {

  final bool isLoading;
  final Widget child;

  const LoadableView({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context)
  {
    return Stack(
      children: [

        Visibility(
          visible: !isLoading,
          maintainState: true,
          maintainAnimation: true,
          maintainSize: true,
          child: child,
        ),

        if (isLoading) const Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(child: ArchLoadingIndicator()),
        ),

      ],
    );
  }
}