

part of devspace;


class DefaultImage extends ArchBaseVariantSwitch<kImageVariant, ImageData> {

  static PlanBuilder<Widget, kImageVariant, ImageData> builder = (context, variant, data)
  {
    return DefaultImage(variant: variant, data: data);
  };

  const DefaultImage({
    super.key,
    super.variant = kImageVariant.regular,
    required super.data
  });

  @override
  Widget buildStyle(BuildContext context, kImageVariant style)
  {
    return switch (style)
    {
      kImageVariant.regular => DefaultImageRegular(data: data),
    };
  }
  
}

