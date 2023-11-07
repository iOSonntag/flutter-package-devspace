

part of devspace;


class DefaultCardRegular extends ArchBaseChildfulStatelessWidget<CardData, Widget> {

  DefaultCardRegular({
    super.key,
    required super.data,
    required super.child,
  }) : super(allowCustomVariants: false);


  @override
  bool hasMinimumRequirements() => true;
    
  
  @override
  void checkUnsupportedFields()
  {
    
    
  }

  @override
  Widget build(BuildContext context)
  {
    return Container(
      decoration: BoxDecoration(
        color: data.color ?? context.colors.surface,
        borderRadius: context.dimensions.borderRadiusM,
        boxShadow: [
          context.highlights.boxShadowM
        ]
      ),
      child: child
    );
  }

}















