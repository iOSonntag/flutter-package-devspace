

part of devspace;


class DefaultLabel extends ArchBaseVariantSwitch<kLabelVariant, LabelData> {

  static PlanBuilder<Widget, kLabelVariant, LabelData> builder = (context, variant, data)
  {
    return DefaultLabel(variant: variant, data: data);
  };

  const DefaultLabel({
    super.key,
    super.variant = kLabelVariant.regular,
    required super.data
  });

  @override
  Widget buildStyle(BuildContext context, kLabelVariant style)
  {
    return switch (style)
    {
      kLabelVariant.regular => DefaultLabelRegular(data: data),
    };
  }
  
}

