
part of devspace;


class CircleButtonClose extends StatelessWidget {

  final VoidCallback? onPressed;

  const CircleButtonClose({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context)
  {
    // Color borderColor = _borderColor(context);
    Color backgroundColor = context.colors.primary;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
      ),
      child: Padding(
        padding: context.paddingXS,
        child: Icon(
          Icons.close,
          size: context.dimensions.iconSizeXS,
          color: context.colors.onPrimary,
        ),
      ),
    );
  }
}