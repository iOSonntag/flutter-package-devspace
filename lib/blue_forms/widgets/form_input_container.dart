



part of devspace;

class _FormInputContainerWidget extends StatelessWidget {

  final String? description;
  final bool hasLabel;
  final FormElementButton? extraButton;
  final Widget child;

  const _FormInputContainerWidget({
    // ignore: unused_element
    super.key,
    this.description,
    this.extraButton,
    required this.hasLabel,
    required this.child,
  });

  @override
  Widget build(BuildContext context)
  {
    Widget child = this.child;

    if (extraButton != null)
    {
      Widget button = ArchButton(
        icon: extraButton!.icon,
        title: extraButton!.title,
        size: kSize3.S,
        onPressed: extraButton!.onPressed,
      );

      if (hasLabel)
      {
        button = material.Column(
          children: [
            Container(
              height: context.dimensions.spaceXLValue + context.dimensions.spaceXSValue,
            ),
            Expanded(child: material.Center(child: button)),
          ],
        );
      }

      child = material.IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: child),
            context.spaceM,
            button,
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [


        child,


        if (description != null) Padding(
          padding: context.paddingM_0.setTop(context.dimensions.spaceLValue),
          child: TextBody.medium(description!,
            italic: true,
            color: context.colors.onBackgroundLessFocus,
          ),
        ),

      ],
    );
  }
}