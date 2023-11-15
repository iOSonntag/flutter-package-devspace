

part of devspace;


class DefaultLabeledContent extends ArchBaseVariantSwitch<kLabeledContentVariant, LabeledContentData> {

  static PlanBuilder<Widget, kLabeledContentVariant, LabeledContentData> builder = (context, variant, data)
  {
    return DefaultLabeledContent(variant: variant, data: data);
  };

  const DefaultLabeledContent({
    super.key,
    super.variant = kLabeledContentVariant.regular,
    required super.data
  });

  @override
  Widget buildStyle(BuildContext context, kLabeledContentVariant style)
  {
    return switch (style)
    {
      kLabeledContentVariant.regular => DefaultLabeledContentRegular(data: data),
    };
  }
  
}

