

part of devspace;


class DefaultInfoBox extends ArchBaseVariantSwitch<kInfoBoxVariant, InfoBoxData> {

  static PlanBuilder<Widget, kInfoBoxVariant, InfoBoxData> builder = (context, variant, data)
  {
    return DefaultInfoBox(variant: variant, data: data);
  };

  const DefaultInfoBox({
    super.key,
    super.variant = kInfoBoxVariant.regular,
    required super.data
  });

  @override
  Widget buildStyle(BuildContext context, kInfoBoxVariant style)
  {
    return switch (style)
    {
      kInfoBoxVariant.regular => DefaultInfoBoxRegular(data: data),
    };
  }
  
}

