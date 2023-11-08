

part of devspace;


class DefaultLoadingIndicator extends ArchBaseVariantSwitch<kLoadingIndicatorVariant, LoadingIndicatorData> {

  static PlanBuilder<Widget, kLoadingIndicatorVariant, LoadingIndicatorData> builder = (context, variant, data)
  {
    return DefaultLoadingIndicator(variant: variant, data: data);
  };

  const DefaultLoadingIndicator({
    super.key,
    super.variant = kLoadingIndicatorVariant.regular,
    required super.data
  });

  @override
  Widget buildStyle(BuildContext context, kLoadingIndicatorVariant style)
  {
    return switch (style)
    {
      kLoadingIndicatorVariant.regular => DefaultLoadingIndicatorRegular(data: data),
      kLoadingIndicatorVariant.special => DefaultLoadingIndicatorSpecial(data: data),
    };
  }
  
}

