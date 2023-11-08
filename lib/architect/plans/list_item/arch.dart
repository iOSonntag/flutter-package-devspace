

part of devspace;

class ArchListItem extends ArchBase<kListItemVariant, ListItemData> {

  const ArchListItem({
    super.key,
    super.data = const ListItemData(),
    super.variant = kListItemVariant.regular,
  });
  
  ArchListItem.standalone({
    super.key,
    kSize3 size = kSize3.M,
    String? title,
    String? subtitle,
    IconData? icon,
    ImageProvider? image,
    VoidCallback? onTap,
  }) : 
    super(
      variant: kListItemVariant.standalone,
      data: ListItemData(
        size: size,
        title: title,
        subtitle: subtitle,
        icon: icon,
        image: image,
        onPrimaryAction: onTap,
      )
  );
}