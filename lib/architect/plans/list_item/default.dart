

part of devspace;


class DefaultListItem extends ArchBaseVariantSwitch<kListItemVariant, ListItemData> {

  static PlanBuilder<Widget, kListItemVariant, ListItemData> builder = (context, variant, data)
  {
    return DefaultListItem(variant: variant, data: data);
  };

  const DefaultListItem({
    super.key,
    super.variant = kListItemVariant.regular,
    required super.data
  });

  @override
  Widget buildStyle(BuildContext context, kListItemVariant style)
  {
    return switch (style)
    {
      kListItemVariant.regular => DefaultListItemRegular(data: data),
      kListItemVariant.standalone => DefaultListItemStandalone(data: data),
    };
  }
  
}

