



part of devspace;

class _FormInputContainerWidget extends StatelessWidget {

  final String? description;
  final Widget child;

  const _FormInputContainerWidget({
    // ignore: unused_element
    super.key,
    this.description,
    required this.child,
  });

  @override
  Widget build(BuildContext context)
  {
    List<Widget> children = [];

    if (description != null)
    {
      children.addAll([

        TextBody.small(description!,
          textAlign: TextAlign.center,
        ),

        context.spaceL,

      ]);
    }

    children.addAll([

      child,

      context.spaceL,

    ]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}