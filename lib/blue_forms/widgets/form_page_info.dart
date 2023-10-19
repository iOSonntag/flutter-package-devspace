
part of devspace;


class _FormPageInfoWidget extends StatelessWidget {

    final FormPageInfo definition;

    const _FormPageInfoWidget({
      // ignore: unused_element
      super.key,
      required this.definition,
    });

    @override
    Widget build(BuildContext context)
    {
      return SingleChildScrollView(
        physics: context.animations.scrollPhysics,
        child: Container(
          padding: context.paddingL,
          child: Column(
            children: [

              context.spaceXL,
              context.spaceL,

              TextTitle.medium(definition.title,
                textAlign: TextAlign.center,
              ),

              context.spaceL,
              
              TextBody.small(definition.description,
                textAlign: TextAlign.center,
                lineHeight: 1.4,
              ),

              context.spaceL,
            ],
          ),
        ),
      );
    }
}