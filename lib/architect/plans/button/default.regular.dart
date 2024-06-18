


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
    unsupportedIf(data.inverse, 'inverse', 'inverse is not supported');
    unsupported(data.child, 'child');
    unsupported(data.subtitle, 'subtitle');
    unsupported(data.onSecondaryAction, 'onSecondaryAction');
    unsupported(data.onTertiaryAction, 'onTertiaryAction');
  }

  @override
  Widget build(BuildContext context)
  {
    Widget child = Padding(
      padding: _contentPadding(context),
      child: _buildContent(context)
    );

    if (data.isLoading)
    {
      child = Stack(
        children: [
          
          Visibility(
            visible: false,
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            child: child,
          ),

          Positioned.fill(
            child: Center(
              child: ArchLoadingIndicator(
                size: kSize3.S,
              ),
            ),
          ),
        ],
      );
    }

    final Gradient? grad = _backgroundGradient(context);
    final BorderRadius borderRadius = _borderRadius(context);

    if (grad != null)
    {
      child = Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: grad,
        ),
        child: Center(child: child),
      );
    }

    return ElevatedButton(
      onPressed: data.enabled ? data.onPrimaryAction : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: grad != null ? null : _backgroundColor(context),
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: grad != null ? BorderSide.none : BorderSide(color: _borderColor(context)),
        ),
      ),
      child: child,
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
      bold: data.titleBold,
      shrinkIfNeeded: true,
      maxLines: 1,
      style: TextStyle(
        decoration: data.underline ? TextDecoration.underline : TextDecoration.none,
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

  Gradient? _backgroundGradient(BuildContext context)
  {
    return switch (data.type)
    {
      kButtonType.regular => null,
      kButtonType.primary => null,
      kButtonType.secondary => null,
      kButtonType.tertiary => null,
      kButtonType.success => null,
      kButtonType.destructive => null,
      kButtonType.lowFocus => null,
      kButtonType.fancy1 => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          context.colors.primary,
          context.colors.secondary,
        ],
      ),
      kButtonType.fancy2 => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          context.colors.secondary,
          context.colors.tertiary,
        ],
      ),
      kButtonType.fancy3 => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          context.colors.tertiary,
          context.colors.primary,
        ],
      ),
    };
  }

  Color _backgroundColor(BuildContext context)
  {
    return switch (data.type)
    {
      kButtonType.regular => data.onSurface ? context.colors.surface : context.colors.background,
      kButtonType.primary => context.colors.primary,
      kButtonType.secondary => context.colors.secondary,
      kButtonType.tertiary => context.colors.tertiary,
      kButtonType.success => context.colors.success,
      kButtonType.destructive => context.colors.destructive,
      kButtonType.lowFocus => data.onSurface ? context.colors.onSurfaceLessFocus : context.colors.onBackgroundLessFocus,
      kButtonType.fancy1 => Colors.transparent,
      kButtonType.fancy2 => Colors.transparent,
      kButtonType.fancy3 => Colors.transparent,
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
      kButtonType.fancy1 => Color.lerp(context.colors.primary, context.colors.secondary, 0.5)!.brighten(0.1),
      kButtonType.fancy2 => Color.lerp(context.colors.secondary, context.colors.tertiary, 0.5)!.brighten(0.1),
      kButtonType.fancy3 => Color.lerp(context.colors.tertiary, context.colors.primary , 0.5)!.brighten(0.1),
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
      kButtonType.fancy1 => context.colors.onPrimary,
      kButtonType.fancy2 => context.colors.onPrimary,
      kButtonType.fancy3 => context.colors.onPrimary,
    };
  }


}