part of devspace;




class DefaultDialog extends StatelessWidget {

  final bool isLoading;
  final String title;
  final Widget? content;
  final Axis actionsAlignment;
  final List<DialogAction> actions;

  const DefaultDialog({
    super.key,
    this.isLoading = false,
    required this.title,
    required this.content,
    required this.actions,
    this.actionsAlignment = Axis.horizontal,
  });



  @override
  Widget build(BuildContext context)
  {
    List<Widget> buttons = actions.mapToList((action, i)
    {
      if (action.isCustom)
      {
        return (action as CustomDialogAction).child;
      }

      Widget button = ArchButton(
        type: action.type,
        title: action.title,
        titleBold: true,
        icon: action.getIcon(context),
        onPressed: action.onPressed,
        size: kSize3.L,
        enabled: action.enabled,
        onSurface: true,
      );

      if (action.type == kButtonType.fancy1)
      {
        button = button.glassShimmerRepeated(delay: 500.asDuration);
      }

      button = ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: context.dimensions.reasonableButtonWidth(context)
        ),
        child: button,
      );

      if (actionsAlignment == Axis.horizontal)
      {
        button = Flexible(
          child: button,
        );
      }

      return button;
    });



    List<Widget> children = [

      context.spaceL,

      Padding(
        padding: context.paddingM_0,
        child: TextHeadline.medium(title,
          shrinkIfNeeded: true,
          maxLines: 1,
        ),
      ),

      context.spaceS,
    ];

    if (content != null)
    {
      children.addAll([
        Flexible(
          child: content!,
        ),
        context.spaceM,
      ]);
    }


    if (buttons.isNotEmpty)
    {
      if (actionsAlignment == Axis.horizontal)
      {
        children.add(
          Padding(
            padding: context.paddingS,
            child: SpacedRow.L(
              mainAxisSpacing: MainAxisSpacing.between,
              crossAxisSpacing: CrossAxisSpacing.none,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: buttons,
            ),
          ),
        );
      }
      else
      {
        children.add(context.spaceM);
        children.add(
          SpacedColumn.S(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buttons,
          )
        );
      }
    }

    return material.Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: context.isPhoneSmall ? context.paddingL_0 : context.paddingXXL_0,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: context.dimensions.dialogMaxWidth(context)
        ),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: context.dimensions.borderRadiusXL,
        ),
        child: LoadableView(
          isLoading: isLoading,
          child: Padding(
            padding: context.paddingM,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}

