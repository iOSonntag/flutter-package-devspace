

part of devspace;


class DefaultLabelRegular extends ArchBaseStatelessWidget<LabelData> {

  DefaultLabelRegular({
    super.key,
    required super.data
  }) : super(allowCustomVariants: false);


  @override
  bool hasMinimumRequirements() => true;
    
  
  @override
  void checkUnsupportedFields()
  {
    unsupportedIf(data.size != kSize3.M, 'size', 'only size [kSize3.M] is supported');
    unsupported(data.subtitle, 'subtitle');
    
  }

  @override
  Widget build(BuildContext context)
  {
    Color color = data.color ?? context.colors.primary;

    return Row(
      children: [
    
        if (data.icon != null) ...[

          Icon(
            data.icon,
            color: color,
            size: _iconSize(context),
          ),

          context.spaceS,

        ],

        if (data.title != null) ...[

          TextTitle.size3(data.size, data.title,
            color: color,
          ),

          context.spaceS,

        ],

        if (data.explainationTitle != null || data.explainationMessage != null) ...[

          ArchBonusInfo(
            size: data.size,
            title: data.explainationTitle,
            message: data.explainationMessage
          ),

          context.spaceS,

        ]

      ]..removeLast(),
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















