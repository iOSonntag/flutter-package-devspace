

part of devspace;




class CircleBadge extends StatelessWidget {

  final bool show;
  final String content;
  final badges.BadgePosition? position;
  final Widget? child;

  const CircleBadge({
    super.key,
    this.show = true,
    required this.content,
    this.position,
    this.child,
  });

  @override
  Widget build(BuildContext context)
  {
    if (!show)
    {
      return child ?? EmptyWidget();
    }

    return badges.Badge(
      badgeStyle: badges.BadgeStyle(
        elevation: 0,
        badgeColor: context.colors.primary,
      ),
      position: position ?? badges.BadgePosition.topEnd(top: -context.dimensions.spaceSValue, end: 0),
      badgeAnimation: const badges.BadgeAnimation.fade(
        toAnimate: false
      ),
      stackFit: StackFit.passthrough,
      badgeContent: Padding(
        padding: context.paddingXXS,
        child: TextBody.small(content,
          color: context.colors.onPrimary,
        ),
      ),
      child: child,
    );
  }
}