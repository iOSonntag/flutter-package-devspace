part of devspace;




class DefaultDialog extends StatelessWidget {

  final String title;
  final Widget content;
  final List<DialogAction> actions;

  const DefaultDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });



  @override
  Widget build(BuildContext context)
  {
    List<Widget> buttons = actions.mapToList((action, i) =>ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: context.dimensions.reasonableButtonWidth(context)
      ),
      child: ArchButton(
        type: action.type,
        title: action.title,
        icon: action.getIcon(context),
        onPressed: action.onPressed,
        enabled: action.enabled,
      ),
    ));



    List<Widget> children = [

      context.spaceXS,

      TextHeadline.medium(title),

      context.spaceS,

      content,

      context.spaceS,
    ];

    if (buttons.isNotEmpty)
    {
      children.add(
        SpacedRow.S(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: buttons,
        ),
      );
    }

    return material.Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: context.dimensions.borderRadiusL,
        ),
        child: Padding(
          padding: context.paddingM,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      ),
    );
  }
}

