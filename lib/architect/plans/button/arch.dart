


part of devspace;


class ArchButton extends ArchBase<kButtonVariant, ButtonData> {

  ArchButton({
    super.key,
    kButtonType type = kButtonType.regular,
    kSize3 size = kSize3.M,
    bool enabled = true,
    String? title,
    String? subtitle,
    IconData? icon,
    VoidCallback? onPressed,
    VoidCallback? onSecondaryAction,
    VoidCallback? onTertiaryAction,
    super.variant = kButtonVariant.regular,
    String? variationId,
    Widget? child,
  }) : 
    super(
      data: ButtonData(
        variationId: variationId,
        type: type,
        size: size,
        enabled: enabled,
        title: title,
        subtitle: subtitle,
        icon: icon,
        onPrimaryAction: onPressed,
        onSecondaryAction: onSecondaryAction,
        onTertiaryAction: onTertiaryAction,
        child: child,
      ),
    );

  ArchButton.soft({
    super.key,
    kButtonType type = kButtonType.regular,
    kSize3 size = kSize3.M,
    bool enabled = true,
    String? title,
    String? subtitle,
    IconData? icon,
    VoidCallback? onPressed,
    VoidCallback? onSecondaryAction,
    VoidCallback? onTertiaryAction,
    String? variationId,
    Widget? child,
  }) : 
    super(
      variant: kButtonVariant.regular,
      data: ButtonData(
        variationId: variationId,
        type: type,
        size: size,
        enabled: enabled,
        title: title,
        subtitle: subtitle,
        icon: icon,
        onPrimaryAction: onPressed,
        onSecondaryAction: onSecondaryAction,
        onTertiaryAction: onTertiaryAction,
        child: child,
      ),
    );

  ArchButton.special({
    super.key,
    kButtonType type = kButtonType.regular,
    kSize3 size = kSize3.M,
    bool enabled = true,
    String? title,
    String? subtitle,
    IconData? icon,
    VoidCallback? onPressed,
    VoidCallback? onSecondaryAction,
    VoidCallback? onTertiaryAction,
    String? variationId,
    Widget? child,
  }) : 
    super(
      variant: kButtonVariant.special,
      data: ButtonData(
        variationId: variationId,
        type: type,
        size: size,
        enabled: enabled,
        title: title,
        subtitle: subtitle,
        icon: icon,
        onPrimaryAction: onPressed,
        onSecondaryAction: onSecondaryAction,
        onTertiaryAction: onTertiaryAction,
        child: child,
      ),
    );

}