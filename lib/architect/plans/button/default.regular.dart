


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

    return ElevatedButton(
      onPressed: data.enabled ? data.onPrimaryAction : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        shape: RoundedRectangleBorder(
          borderRadius: _borderRadius(context),
          side: BorderSide(color: borderColor),
        ),
      ),
      child: Padding(
        padding: _contentPadding(context),
        child: _buildContent(context)
      ),
    );
  }

  Widget _buildContent(BuildContext context)
  {
    Color contentColor = _contentColor(context);

    if (data.icon == null && data.title != null)
    {
      return _buildTextContent(context, contentColor);
    }

    if (_isIconOnlyButton())
    {
      return _buildIconContent(context, contentColor);
    }
  

    return SpacedRow(
      crossAxisSpacing: CrossAxisSpacing.none,
      mainAxisSpacing: MainAxisSpacing.between,
      spacing: switch (data.size)
      {
        kSize3.S => context.dimensions.spaceXXSValue,
        kSize3.M => context.dimensions.spaceXSValue,
        kSize3.L => context.dimensions.spaceSValue
      },
      children: [
        _buildIconContent(context, contentColor),
        _buildTextContent(context, contentColor),
      ],
    );
  }

  bool _isIconOnlyButton()
  {
    return data.icon != null && data.title == null;
  }

  Widget _buildIconContent(BuildContext context, Color contentColor)
  {
    bool isIconOnlyButton = _isIconOnlyButton();

    return Icon(data.icon,
      color: contentColor,
      size: switch (data.size)
      {
        kSize3.S => isIconOnlyButton ? context.dimensions.iconSizeM : context.dimensions.iconSizeS,
        kSize3.M => isIconOnlyButton ? context.dimensions.iconSizeL : context.dimensions.iconSizeM,
        kSize3.L => isIconOnlyButton ? context.dimensions.iconSizeXL : context.dimensions.iconSizeL
      },
    );
  }

  Widget _buildTextContent(BuildContext context, Color contentColor)
  {
    return TextBody.size3(data.size, data.title,
      color: contentColor,
      style: TextStyle(
        decoration: data.underline ? TextDecoration.underline : TextDecoration.none
      ),
    );
  }

  EdgeInsets _contentPadding(BuildContext context)
  {
    bool isIconOnlyButton = _isIconOnlyButton();

    if (data.icon != null)
    {
      return switch (data.size)
      {
        kSize3.S => isIconOnlyButton ? context.paddingXXS : context.paddingM_XS.setLeft(context.dimensions.spaceXSValue),
        kSize3.M => isIconOnlyButton ? context.paddingXS : context.paddingL_S.setLeft(context.dimensions.spaceSValue),
        kSize3.L => isIconOnlyButton ? context.paddingS : context.paddingXL_M.setLeft(context.dimensions.spaceMValue)
      };
    }

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

  Color _contentColor(BuildContext context)
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