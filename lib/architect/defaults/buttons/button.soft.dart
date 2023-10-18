


part of devspace;

class DefaultButtonSoft extends DefaultStatelessWidget<ButtonData> {

  const DefaultButtonSoft({
    super.key,
    required super.data
  });


  @override
  Widget build(BuildContext context)
  {
    Color textColor = _textColor(context);


    return TextButton(
      onPressed: data.enabled ? data.onPrimaryAction : null,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(textColor.withOpacity(0.2)),
        minimumSize: MaterialStateProperty.all(Size.zero),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
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
      kSize3.L => context.paddingXL_L
    };
  }

  Color _textColor(BuildContext context)
  {
    return switch (data.type)
    {
      kButtonType.regular => context.colors.onBackground,
      kButtonType.primary => context.colors.primary,
      kButtonType.secondary => context.colors.secondary,
      kButtonType.tertiary => context.colors.tertiary,
      kButtonType.success => context.colors.success,
      kButtonType.destructive => context.colors.destructive,
      kButtonType.lowFocus => context.colors.onBackgroundLessFocus,
    };
  }


  Widget _buildText(BuildContext context, Color color)
  {
    if (data.size == kSize3.S)
    {
      return TextBody.small(data.title?.toUpperCase(),
        color: color,
        letterSpacing: -0.8,
      );
    }

    if (data.size == kSize3.M)
    {
      return TextBody.medium(data.title?.toUpperCase(),
        color: color,
        letterSpacing: -0.8,
      );
    }

    return TextBody.large(data.title?.toUpperCase(),
      color: color,
      letterSpacing: -0.8,
    );
  }


}