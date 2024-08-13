

part of devspace;


class DefaultBonusInfoRegular extends ArchBaseStatelessWidget<BonusInfoData> {

  DefaultBonusInfoRegular({
    super.key,
    required super.data
  }) : super(allowCustomVariants: false);


  @override
  bool hasMinimumRequirements() => true;
    
  
  @override
  void checkUnsupportedFields()
  {
    unsupported(data.title, 'title');
    
  }

  @override
  Widget build(BuildContext context)
  {
    BoxShadow shadow = context.highlights.boxShadowM;
    Color color = context.colors.inverseSurface;
    double iconSize = _iconSize(context);
    double arrowLength = context.dimensions.spaceMValue;
    double arrowBaseWidth = context.dimensions.spaceXLValue;
    double arrowTipDistance = iconSize / 2 + context.dimensions.spaceXSValue;

    return ControllerHolder<SuperTooltipController>(
      create: () => SuperTooltipController(),
      builder: (context, controller) => GestureDetector(
        onTap: () => controller.showTooltip(),
        child: SuperTooltip(
          controller: controller,
          // showBarrier: false,
          sigmaX: 0.0,
          sigmaY: 0.0,
          arrowLength: arrowLength,
          arrowBaseWidth: arrowBaseWidth,
          shadowColor: shadow.color,
          shadowBlurRadius: shadow.blurRadius,
          shadowSpreadRadius: shadow.spreadRadius,
          barrierColor: Colors.transparent,
          borderColor: color,
          backgroundColor: color,
          arrowTipDistance: arrowTipDistance,
          content: Container(
            constraints: const BoxConstraints(
              // IMPROVE: improve
              maxWidth: 300.0,
            ),
            child: Column(  
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                TextBody.small(data.message,
                  color: context.colors.onInverseSurface,
                ),
                
              ],
            ),
          ),

          child: Icon(
            data.icon,
            size: iconSize,
            color: data.iconColor ?? context.colors.onBackgroundLessFocus,
          ),
        ),
      ),
    );
  }

  double _iconSize(BuildContext context)
  {
    return switch (data.size)
    {
      kSize3.S => context.dimensions.iconSizeXS,
      kSize3.M => context.dimensions.iconSizeS,
      kSize3.L => context.dimensions.iconSizeM,
    };
  }
}















