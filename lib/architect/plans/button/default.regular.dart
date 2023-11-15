


part of devspace;

// TODO: implement icon feature
class DefaultButtonRegular extends ArchBaseStatelessWidget<ButtonData> {

  DefaultButtonRegular({
    super.key,
    required super.data
  }) : super(allowCustomVariants: false);


  @override
  bool hasMinimumRequirements() =>
    data.onPrimaryAction != null &&
    (data.title != null || data.icon != null);
    
  
  @override
  void checkUnsupportedFields()
  {
    unsupportedIf(data.icon != null && data.title != null, 'icon and title', 'they can not be used together');
    unsupported(data.child, 'child');
    unsupported(data.subtitle, 'subtitle');
    unsupported(data.onSecondaryAction, 'onSecondaryAction');
    unsupported(data.onTertiaryAction, 'onTertiaryAction');
  }

  @override
  Widget build(BuildContext context)
  {
    Color borderColor = _borderColor(context);
    Color backgroundColor = _backgroundColor(context);
    Color textColor = _textColor(context);

    return ElevatedButton(
      onPressed: data.enabled ? data.onPrimaryAction : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: _borderRadius(context),
          side: BorderSide(color: borderColor),
        ),
      ),
      child: Padding(
        padding: _contentPadding(context),
        child: TextBody.size3(data.size, data.title,
          color: textColor,
        )
      ),
    );
  }

  EdgeInsets _contentPadding(BuildContext context)
  {
    return switch (data.size)
    {
      kSize3.S => context.paddingM_S,
      kSize3.M => context.paddingL_M,
      kSize3.L => context.paddingXL_L
    };
  }

  BorderRadius _borderRadius(BuildContext context)
  {
    return switch (data.size)
    {
      kSize3.S => context.dimensions.borderRadiusS,
      kSize3.M => context.dimensions.borderRadiusM,
      kSize3.L => context.dimensions.borderRadiusL
    };
  }

  Color _backgroundColor(BuildContext context)
  {
    return switch (data.type)
    {
      kButtonType.regular => context.colors.surface,
      kButtonType.primary => context.colors.primary,
      kButtonType.secondary => context.colors.secondary,
      kButtonType.tertiary => context.colors.tertiary,
      kButtonType.success => context.colors.success,
      kButtonType.destructive => context.colors.destructive,
      kButtonType.lowFocus => context.colors.onBackgroundLessFocus,
    };
  }

  Color _borderColor(BuildContext context)
  {
    return switch (data.type)
    {
      kButtonType.regular => context.colors.primary,
      kButtonType.primary => context.colors.primary.brighten(0.1),
      kButtonType.secondary => context.colors.secondary.brighten(0.1),
      kButtonType.tertiary => context.colors.tertiary.brighten(0.1),
      kButtonType.success => context.colors.success.brighten(0.1),
      kButtonType.destructive => context.colors.destructive.brighten(0.1),
      kButtonType.lowFocus => context.colors.onBackgroundLessFocus.brighten(0.1),
    };
  }

  Color _textColor(BuildContext context)
  {
    return switch (data.type)
    {
      kButtonType.regular => context.colors.primary,
      kButtonType.primary => context.colors.onPrimary,
      kButtonType.secondary => context.colors.onSecondary,
      kButtonType.tertiary => context.colors.onTertiary,
      kButtonType.success => context.colors.onSuccess,
      kButtonType.destructive => context.colors.onDestructive,
      kButtonType.lowFocus => context.colors.background,
    };
  }


}