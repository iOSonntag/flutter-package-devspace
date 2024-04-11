part of devspace;




class DialogAction {

  final bool enabled;
  final String title;
  final VoidCallback? onPressed;
  final kButtonType type;
  /// If set, overrides the icon for this action type
  final IconData? iconOverride;

  DialogAction({
    this.enabled = true,
    required this.title,
    this.onPressed,
    this.type = kButtonType.regular,
    this.iconOverride,
  });

  DialogAction copyWith({
    String? title,
    VoidCallback? onPressed,
    kButtonType? type,
    IconData? iconOverride,
  })
  {
    return DialogAction(
      title: title ?? this.title,
      onPressed: onPressed ?? this.onPressed,
      type: type ?? this.type,
      iconOverride: iconOverride ?? this.iconOverride,
    );
  }


  IconData? getIcon(BuildContext context)
  {
    if (iconOverride != null)
    {
      return iconOverride;
    }

    return switch (type)
    {
      kButtonType.regular => null,
      kButtonType.primary => null,
      kButtonType.secondary => null,
      kButtonType.tertiary => null,
      kButtonType.success => Icons.check_rounded,
      kButtonType.destructive => Icons.dangerous_outlined,
      kButtonType.lowFocus => null,
    };
  }

}