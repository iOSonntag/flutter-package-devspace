

part of devspace;


class NewBadge extends StatelessWidget {

  final Widget child;

  const NewBadge({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context)
  {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            margin: context.paddingS,
            padding: context.paddingS_XXS,
            decoration: BoxDecoration(
              color: context.colors.error,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [context.highlights.boxShadowS]
            ),
            child: TextBody.small(LibStrings.lib_general_flagNew.tr(), color: context.colors.onError),
          ),
        ),
      ], 
    );
  }
}