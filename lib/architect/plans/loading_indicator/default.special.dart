

part of devspace;


class DefaultLoadingIndicatorSpecial extends ArchBaseStatelessWidget<LoadingIndicatorData> {

  DefaultLoadingIndicatorSpecial({
    super.key,
    required super.data
  }) : super(allowCustomVariants: false);


  @override
  bool hasMinimumRequirements() => true;
    
  
  @override
  void checkUnsupportedFields()
  {
    unsupportedIf(data.size != kSize3.M, 'size', 'only size [kSize3.M] is supported');
    
  }

  @override
  Widget build(BuildContext context)
  {
    return CircularProgressIndicator(
      strokeWidth: _strokeWidth(context)
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
}















