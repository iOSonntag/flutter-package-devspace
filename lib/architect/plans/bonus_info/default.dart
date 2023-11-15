

part of devspace;


class DefaultBonusInfo extends ArchBaseVariantSwitch<kBonusInfoVariant, BonusInfoData> {

  static PlanBuilder<Widget, kBonusInfoVariant, BonusInfoData> builder = (context, variant, data)
  {
    return DefaultBonusInfo(variant: variant, data: data);
  };

  const DefaultBonusInfo({
    super.key,
    super.variant = kBonusInfoVariant.regular,
    required super.data
  });

  @override
  Widget buildStyle(BuildContext context, kBonusInfoVariant style)
  {
    return switch (style)
    {
      kBonusInfoVariant.regular => DefaultBonusInfoRegular(data: data),
    };
  }
  
}

