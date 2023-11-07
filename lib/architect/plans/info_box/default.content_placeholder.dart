

part of devspace;


class DefaultInfoBoxContentPlaceholder extends ArchBaseStatelessWidget<InfoBoxData> {

  DefaultInfoBoxContentPlaceholder({
    super.key,
    required super.data
  }) : super(allowCustomVariants: false);


  @override
  bool hasMinimumRequirements() => data.message != null;
    
  
  @override
  void checkUnsupportedFields()
  {
    
  }

  @override
  Widget build(BuildContext context)
  {
    Color signalColor = _signalColor(context);

    Color titleColor = signalColor;
    Color subtitleColor = signalColor;
    Color textColor = context.colors.onBackground;
    Color iconColor = context.colors.onBackgroundLeastFocus;
    // Color iconColor = signalColor;

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          if (data.icon != null) Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: context.paddingXS,
              child: Icon(data.icon!,
                size: context.dimensions.iconSizeXL,
                color: iconColor,
              ),
            ),
          ),

          if (data.title != null) Padding(
            padding: data.subtitle != null ? EdgeInsets.zero : context.dimensions.paddingMOnly(bottom: true),
            child: TextTitle.medium(data.title!,
              color: titleColor,
            ),
          ),

          if (data.subtitle != null) Padding(
            padding: context.dimensions.paddingMOnly(bottom: true),
            child: TextTitle.small(data.subtitle!,
              color: subtitleColor,
            ),
          ),

          if (data.message != null) TextBody.medium(data.message!,
            color: textColor,
            textAlign: TextAlign.center,
          ),

          if (data.onAction != null) Padding(
            padding: context.dimensions.paddingXLOnly(top: true),
            child: ArchButton(
              data: ButtonData(
                title: data.actionTitle ?? LibStrings.lib_general_actionRetry.tr(),
                type: kButtonType.primary,
                onPrimaryAction: data.onAction,
              ),
            ),
          )
        ],
      ),
    );
  }

  Color _signalColor(BuildContext context)
  {
    return switch (data.type)
    {
      kInfoBoxType.error => context.colors.error,
      kInfoBoxType.warning => context.colors.warning,
      kInfoBoxType.success => context.colors.success,
      kInfoBoxType.info => context.colors.primary,
      kInfoBoxType.congratulations => context.colors.congratulations,
    };
  }


}















