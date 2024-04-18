


part of devspace;


class ArchButton extends ArchBase<kButtonVariant, ButtonData> {

  ArchButton({
    super.key,
    kButtonType type = kButtonType.primary,
    kSize3 size = kSize3.M,
    bool enabled = true,
    bool underline = false,  
    String? title,
    bool? titleBold,
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
        underline: underline,
        title: title,
        titleBold: titleBold,
        subtitle: subtitle,
        icon: icon,
        onPrimaryAction: onPressed,
        onSecondaryAction: onSecondaryAction,
        onTertiaryAction: onTertiaryAction,
        child: child,
      ),
    );

  ArchButton.link({
    super.key,
    kButtonType type = kButtonType.primary,
    kSize3 size = kSize3.M,
    bool enabled = true,
    bool underline = true,
    String? title,
    bool? titleBold,
    String? subtitle,
    IconData? icon,
    VoidCallback? onPressed,
    VoidCallback? onSecondaryAction,
    VoidCallback? onTertiaryAction,
    String? variationId,
    Widget? child,
  }) : 
    super(
      variant: kButtonVariant.link,
      data: ButtonData(
        variationId: variationId,
        type: type,
        size: size,
        enabled: enabled,
        underline: underline,
        title: title,
        titleBold: titleBold,
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
    kButtonType type = kButtonType.primary,
    kSize3 size = kSize3.M,
    bool enabled = true,
    bool underline = false,
    String? title,
    bool? titleBold,
    String? subtitle,
    IconData? icon,
    VoidCallback? onPressed,
    VoidCallback? onSecondaryAction,
    VoidCallback? onTertiaryAction,
    String? variationId,
    Widget? child,
  }) : 
    super(
      variant: kButtonVariant.soft,
      data: ButtonData(
        variationId: variationId,
        type: type,
        size: size,
        enabled: enabled,
        underline: underline,
        title: title,
        titleBold: titleBold,
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
    kButtonType type = kButtonType.primary,
    kSize3 size = kSize3.M,
    bool enabled = true,
    bool underline = false,
    String? title,
    bool? titleBold,
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
        underline: underline,
        title: title,
        titleBold: titleBold,
        subtitle: subtitle,
        icon: icon,
        onPrimaryAction: onPressed,
        onSecondaryAction: onSecondaryAction,
        onTertiaryAction: onTertiaryAction,
        child: child,
      ),
    );

}