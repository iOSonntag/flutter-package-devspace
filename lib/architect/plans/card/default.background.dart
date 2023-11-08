

part of devspace;


class DefaultCardBackground extends ArchBaseStatelessWidget<CardData> {

  DefaultCardBackground({
    super.key,
    required super.data,
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
      child: data.child
    );
  }

}















