


part of devspace;

// ignore: camel_case_types
enum kButtonVariant
{
  soft,
  regular,
  special,
  link
}

// ignore: camel_case_types
enum kButtonType
{
  regular,
  primary,
  secondary,
  tertiary,
  success,
  destructive,
  lowFocus,
  fancy1,
  fancy2,
  fancy3,
}

class ButtonData extends PlanDataWithChild {

  final kButtonType type;
  final kSize3 size;
  final bool enabled;
  final bool isLoading;
  final String? title;
  final bool? titleBold;
  final String? subtitle;
  final bool underline;
  final IconData? icon;
  final bool onSurface;
  final VoidCallback? onPrimaryAction;
  final VoidCallback? onSecondaryAction;
  final VoidCallback? onTertiaryAction;

  const ButtonData({
    super.variationId,
    super.child,
    this.size = kSize3.M,
    this.type = kButtonType.primary,
    this.enabled = true,
    this.isLoading = false,
    this.underline = false,
    this.title,
    this.titleBold,
    this.subtitle,
    this.icon,
    this.onSurface = false,
    this.onPrimaryAction,
    this.onSecondaryAction,
    this.onTertiaryAction,
  });

  factory ButtonData.simpleText({
    required String title,
    required VoidCallback onPressed,
    bool enabled = true,
    kButtonType type = kButtonType.primary,
  })
  {
    return ButtonData(
      type: type,
      enabled: enabled,
      title: title,
      onPrimaryAction: onPressed,
    );
  }

  factory ButtonData.simpleIcon({
    required IconData icon,
    required VoidCallback onPressed,
    bool enabled = true,
    kButtonType type = kButtonType.primary,
  })
  {
    return ButtonData(
      type: type,
      enabled: enabled,
      icon: icon,
      onPrimaryAction: onPressed,
    );
  }

  factory ButtonData.simpleIconText({
    required IconData icon,
    required String title,
    required VoidCallback onPressed,
    bool enabled = true,
    kButtonType type = kButtonType.primary,
  })
  {
    return ButtonData(
      type: type,
      enabled: enabled,
      icon: icon,
      title: title,
      onPrimaryAction: onPressed,
    );
  }

}