

part of devspace;


class DefaultLoadingIndicatorRegular extends ArchBaseStatelessWidget<LoadingIndicatorData> {

  DefaultLoadingIndicatorRegular({
    super.key,
    required super.data
  }) : super(allowCustomVariants: false);


  @override
  bool hasMinimumRequirements() => true;
    
  
  @override
  void checkUnsupportedFields()
  {
    // unsupportedIf(data.size != kSize3.M, 'size', 'only size [kSize3.M] is supported');
    
  }

  @override
  Widget build(BuildContext context)
  {
    double dimensions = _dimensions(context);

    return SizedBox(
      width: dimensions,
      height: dimensions,
      child: LoadingIndicator(
        indicatorType: Indicator.cubeTransition,
        colors: [
          context.colors.primary,
        ],
        strokeWidth: _strokeWidth(context)
      ),
    );
  }

  double _strokeWidth(BuildContext context)
  {
    return switch (data.size)
    {
      kSize3.S => 2.0,
      kSize3.M => 4.0,
      kSize3.L => 6.0,
    };
  }

  double _dimensions(BuildContext context)
  {
    return switch (data.size)
    {
      kSize3.S => context.dimensions.barHeightXS,
      kSize3.M => context.dimensions.barHeightS,
      kSize3.L => context.dimensions.barHeightM,
    };
  }

}















