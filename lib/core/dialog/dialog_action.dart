part of devspace;




class DialogAction {

  final bool enabled;
  final String title;
  final VoidCallback? onPressed;
  final kButtonType type;
  /// If set, overrides the icon for this action type
  final IconData? iconOverride;
  final DateTime? markAsNewUntil;
  final String? badge;

  DialogAction({
    this.enabled = true,
    required this.title,
    this.onPressed,
    this.type = kButtonType.regular,
    this.iconOverride,
    this.markAsNewUntil,
    this.badge,
  });

  bool get isCustom => this is CustomDialogAction;

  DialogAction copyWith({
    String? title,
    VoidCallback? onPressed,
    kButtonType? type,
    IconData? iconOverride,
    DateTime? markAsNewUntil,
    String? badge,
  })
  {
    return DialogAction(
      title: title ?? this.title,
      onPressed: onPressed ?? this.onPressed,
      type: type ?? this.type,
      iconOverride: iconOverride ?? this.iconOverride,
      markAsNewUntil: markAsNewUntil ?? this.markAsNewUntil,
      badge: badge ?? this.badge,
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
      kButtonType.fancy1 => null,
      kButtonType.fancy2 => null,
      kButtonType.fancy3 => null,
      kButtonType.lowFocus => null,
    };
  }

}

class CustomDialogAction extends DialogAction {

  final Widget child;

  CustomDialogAction({
    required this.child,
  }) : super(
    title: '',
  );

  @override
  DialogAction copyWith({
    String? title,
    VoidCallback? onPressed,
    kButtonType? type,
    IconData? iconOverride,
    DateTime? markAsNewUntil,
    String? badge,
  })
  {
    return CustomDialogAction(
      child: child,
    );
  }

}