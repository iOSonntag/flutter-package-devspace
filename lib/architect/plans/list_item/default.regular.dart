

part of devspace;


class DefaultListItemRegular extends ArchBaseStatelessWidget<ListItemData> {

  DefaultListItemRegular({
    super.key,
    required super.data
  }) : super(allowCustomVariants: false);


  @override
  bool hasMinimumRequirements() => true;
    
  
  @override
  void checkUnsupportedFields()
  {
    throw UnsupportedError('not implemented');
    
    // ignore: dead_code
    unsupported(data.onSecondaryAction, 'onSecondaryAction');
    unsupported(data.onTertiaryAction, 'onTertiaryAction');
    
  }

  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      height: _height(context),
    );
  }


  double _height(BuildContext context)
  {
    return switch (data.size)
    {
      kSize3.S => context.dimensions.listItemHeightS,
      kSize3.M => context.dimensions.listItemHeightM,
      kSize3.L => context.dimensions.listItemHeightL,
    };
  }

}















