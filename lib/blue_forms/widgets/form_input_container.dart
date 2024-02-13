



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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [

        if (description != null) Padding(
          padding: context.dimensions.paddingXLOnly(bottom: true),
          child: TextBody.medium(description!,
            textAlign: TextAlign.center,
          ),
        ),

        child

      ],
    );
  }
}