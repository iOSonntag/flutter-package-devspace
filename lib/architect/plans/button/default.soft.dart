


part of devspace;


// TODO: implement icon feature
class DefaultButtonSoft extends ArchBaseStatelessWidget<ButtonData> {

  DefaultButtonSoft({
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
    unsupported(data.icon, 'icon');
    unsupported(data.child, 'child');
    unsupported(data.subtitle, 'subtitle');
    unsupported(data.onSecondaryAction, 'onSecondaryAction');
    unsupported(data.onTertiaryAction, 'onTertiaryAction');
  }

  @override
  Widget build(BuildContext context)
  {
    Color textColor = _textColor(context);


    return TextButton(
      onPressed: data.enabled ? data.onPrimaryAction : null,
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(textColor.withOpacity(0.2)),
        minimumSize: WidgetStateProperty.all(Size.zero),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      child: Container(
        padding: _contentPadding(context),
        child: _buildContent(context, textColor),
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

  Color _textColor(BuildContext context)
  {
    return switch (data.type)
    {
      kButtonType.regular => data.onSurface ? context.colors.onSurface : context.colors.onBackground,
      kButtonType.primary => context.colors.primary,
      kButtonType.secondary => context.colors.secondary,
      kButtonType.tertiary => context.colors.tertiary,
      kButtonType.success => context.colors.success,
      kButtonType.destructive => context.colors.destructive,
      kButtonType.lowFocus => data.onSurface ? context.colors.onSurfaceLessFocus : context.colors.onBackgroundLessFocus,
      kButtonType.fancy1 => throw UnsupportedError('Fancy buttons are not supported for soft buttons'),
      kButtonType.fancy2 => throw UnsupportedError('Fancy buttons are not supported for soft buttons'),
      kButtonType.fancy3 => throw UnsupportedError('Fancy buttons are not supported for soft buttons'),
    };
  }

  Widget _buildContent(BuildContext context, Color contentColor)
  {

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
        kSize3.S => isIconOnlyButton ? context.dimensions.iconSizeM : context.dimensions.iconSizeXS,
        kSize3.M => isIconOnlyButton ? context.dimensions.iconSizeL : context.dimensions.iconSizeS,
        kSize3.L => isIconOnlyButton ? context.dimensions.iconSizeXL : context.dimensions.iconSizeM
      },
    );
  }

  Widget _buildTextContent(BuildContext context, Color contentColor)
  {
    return TextBody.size3(data.size, data.title?.toUpperCase(),
      color: contentColor,
      letterSpacing: -0.3,
      shrinkIfNeeded: true,
      maxLines: 1,
      style: TextStyle(
        decoration: data.underline ? TextDecoration.underline : TextDecoration.none
      ),
    );
  }


}