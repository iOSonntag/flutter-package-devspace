


part of devspace;


// IMPROVE: implement icon feature
class DefaultButtonLink extends ArchBaseStatelessWidget<ButtonData> {

  DefaultButtonLink({
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
        child: _buildText(context, textColor),
      ),
    );
  }

  EdgeInsets _contentPadding(BuildContext context)
  {
    return switch (data.size)
    {
      kSize3.S => context.paddingM_S,
      kSize3.M => context.paddingL_M,
      kSize3.L => context.paddingXL_L,
    };
  }

  Color _textColor(BuildContext context)
  {
    return switch (data.type)
    {
      kButtonType.regular => data.onSurface ? context.colors.onSurface : context.colors.onBackground,
      kButtonType.primary => data.inverse ? context.colors.onPrimary : context.colors.primary,
      kButtonType.secondary => data.inverse ? context.colors.onSecondary : context.colors.secondary,
      kButtonType.tertiary => data.inverse ? context.colors.onTertiary : context.colors.tertiary,
      kButtonType.success => data.inverse ? context.colors.onSuccess : context.colors.success,
      kButtonType.destructive => data.inverse ? context.colors.onDestructive : context.colors.destructive,
      kButtonType.lowFocus => data.onSurface ? context.colors.onSurfaceLessFocus : context.colors.onBackgroundLessFocus,
      kButtonType.fancy1 => throw UnsupportedError('Fancy buttons are not supported for links'),
      kButtonType.fancy2 => throw UnsupportedError('Fancy buttons are not supported for links'),
      kButtonType.fancy3 => throw UnsupportedError('Fancy buttons are not supported for links'),
    };
  }


  Widget _buildText(BuildContext context, Color color)
  {
    return TextBody.size3(data.size, data.title,
      color: color,
      letterSpacing: -0.5,
      style: TextStyle(
        decoration: data.underline ? TextDecoration.underline : TextDecoration.none,
        decorationColor: color,
      ),
    );
  }


}