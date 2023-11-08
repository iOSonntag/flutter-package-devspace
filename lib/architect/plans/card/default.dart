

part of devspace;


class DefaultCard extends ArchBaseVariantSwitch<kCardVariant, CardData> {

  static PlanBuilder<Widget, kCardVariant, CardData> builder = (context, variant, data)
  {
    return DefaultCard(variant: variant, data: data);
  };

  const DefaultCard({
    super.key,
    super.variant = kCardVariant.regular,
    required super.data,
  });

  @override
  Widget buildStyle(BuildContext context, kCardVariant style)
  {
    return switch (style)
    {
      kCardVariant.regular => DefaultCardRegular(data: data),
      kCardVariant.background => DefaultCardBackground(data: data),
    };
  }
  
}

