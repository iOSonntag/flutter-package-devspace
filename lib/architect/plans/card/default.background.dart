

part of devspace;


class DefaultCardBackground extends ArchBaseChildfulStatelessWidget<CardData, Widget> {

  DefaultCardBackground({
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
        borderRadius: context.dimensions.borderRadiusXS,
        boxShadow: [
          context.highlights.boxShadowXS
        ]
      ),
      child: child
    );
  }

}















