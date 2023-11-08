

part of devspace;


class DefaultCardRegular extends ArchBaseStatelessWidget<CardData> {

  DefaultCardRegular({
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
        borderRadius: context.dimensions.borderRadiusL,
        boxShadow: [
          context.highlights.boxShadowM
        ]
      ),
      child: data.child
    );
  }

}















