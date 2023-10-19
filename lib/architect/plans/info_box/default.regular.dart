

part of devspace;


class DefaultInfoBoxRegular extends ArchBaseStatelessWidget<InfoBoxData> {

  DefaultInfoBoxRegular({
    super.key,
    required super.data
  }) : super(allowCustomVariants: false);


  @override
  bool hasMinimumRequirements() => data.message != null;
    
  
  @override
  void checkUnsupportedFields()
  {
    unsupported(data.subtitle, 'subtitle');
  }

  @override
  Widget build(BuildContext context)
  {
    Color signalColor = _signalColor(context);
    Color onSignalColor = _onSignalColor(context);

    Color borderColor = Color.lerp(signalColor, onSignalColor, 0.3)!;
    Color textColor = signalColor;
    Color backgroundColor = Color.lerp(signalColor, onSignalColor, 0.9)!;
    Color iconColor = Color.lerp(signalColor, backgroundColor, 0.5)!;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: context.dimensions.lineThicknessM,
        ),
        borderRadius: context.dimensions.borderRadiusL,
      ),
      padding: context.paddingM,
      child: Stack(
        fit: StackFit.passthrough,
        children: [

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              if (data.title != null) Padding(
                padding: data.subtitle != null ? EdgeInsets.zero : context.dimensions.paddingMOnly(bottom: true),
                child: TextTitle.medium(data.title!,
                  color: textColor,
                ),
              ),

              if (data.subtitle != null) Padding(
                padding: context.dimensions.paddingMOnly(bottom: true),
                child: TextTitle.small(data.subtitle!,
                  color: textColor,
                ),
              ),

              if (data.message != null) TextBody.medium(data.message!,
                color: textColor,
              ),
            ],
          ),


          if (data.icon != null) Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: context.paddingXS,
              child: Icon(data.icon!,
                size: context.dimensions.iconSizeS,
                color: iconColor,
              ),
            ),
          ),
        ],
      )
    );
  }

  Color _signalColor(BuildContext context)
  {
    return switch (data.type)
    {
      kInfoBoxType.error => context.colors.error,
      kInfoBoxType.warning => context.colors.warning,
      kInfoBoxType.success => context.colors.success,
      kInfoBoxType.info => context.colors.background,
      kInfoBoxType.congratulations => context.colors.congratulations,
    };
  }


  Color _onSignalColor(BuildContext context)
  {
    return switch (data.type)
    {
      kInfoBoxType.error => context.colors.onError,
      kInfoBoxType.warning => context.colors.onWarning,
      kInfoBoxType.success => context.colors.onSuccess,
      kInfoBoxType.info => context.colors.onBackground,
      kInfoBoxType.congratulations => context.colors.onCongratulations,
    };
  }
}















