
part of devspace;

// ignore: camel_case_types
enum kListItemVariant
{
  regular,
  standalone,
}



// ignore: camel_case_types
enum kListItemType
{
  regular,
  primary,
  secondary,
  tertiary,
  success,
  destructive,
  lowFocus,
}

class ListItemData extends PlanData {

  final kListItemType type;
  final kSize3 size;
  final bool enabled;
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final ImageProvider? image;
  final VoidCallback? onPrimaryAction;
  final VoidCallback? onSecondaryAction;
  final VoidCallback? onTertiaryAction;

  const ListItemData({
    super.variationId,
    this.size = kSize3.M,
    this.type = kListItemType.regular,
    this.enabled = true,
    this.title,
    this.subtitle,
    this.icon,
    this.image,
    this.onPrimaryAction,
    this.onSecondaryAction,
    this.onTertiaryAction,
  });

}