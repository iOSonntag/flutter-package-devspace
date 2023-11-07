

part of devspace;


class DefaultCard extends ArchBaseChildfulVariantSwitch<kCardVariant, CardData, Widget> {

  static PlanBuilderChildful<Widget, kCardVariant, CardData, Widget> builder = (context, variant, data, child)
  {
    return DefaultCard(variant: variant, data: data, child: child);
  };

  const DefaultCard({
    super.key,
    super.variant = kCardVariant.regular,
    required super.data,
    required super.child,
  });

  @override
  Widget buildStyle(BuildContext context, kCardVariant style, Widget child)
  {
    return switch (style)
    {
      kCardVariant.regular => DefaultCardRegular(data: data, child: child),
      kCardVariant.background => DefaultCardBackground(data: data, child: child),
    };
  }
  
}

