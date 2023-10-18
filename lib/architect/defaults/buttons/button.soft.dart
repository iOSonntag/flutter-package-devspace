


part of devspace;

class DefaultButtonSoft extends DefaultStatelessWidget<ButtonData> {

  const DefaultButtonSoft({
    super.key,
    required super.data
  });


  @override
  Widget build(BuildContext context)
  {
    Color color = _color(context);


    return TextButton(
      onPressed: data.enabled ? data.onPrimaryAction : null,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(color.withOpacity(0.2)),
        minimumSize: MaterialStateProperty.all(Size.zero),
        padding: MaterialStateProperty.all(context.paddingM),
      ),
      child: Container(
        // padding: context.paddingS,
        child: TextBody.small(data.title?.toUpperCase(),
          color: color,
          letterSpacing: -0.8,
          lineHeight: 1.3,
        ),
      ),
    );
  }



  Color _color(BuildContext context)
  {
    if (!data.enabled) throw UnimplementedError();
    

    if (data.type == kButtonType.regular) return context.colors.onBackground;
    if (data.type == kButtonType.primary) return context.colors.primary;
    if (data.type == kButtonType.secondary) return context.colors.secondary;
    if (data.type == kButtonType.tertiary) return context.colors.tertiary;
    if (data.type == kButtonType.success) return context.colors.success;
    if (data.type == kButtonType.destructive) return context.colors.destructive;
    if (data.type == kButtonType.lowFocus) return context.colors.onBackgroundLessFocus;

    throw UnimplementedError();
  }

}