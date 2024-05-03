part of devspace;



class TextDialog extends StatelessWidget {

  final String title;
  final String? text;
  final bool textLowFocus;
  final Axis actionsAlignment;
  final List<DialogAction> actions;

  const TextDialog({
    super.key,
    required this.title,
    this.text,
    this.textLowFocus = false,
    this.actionsAlignment = Axis.horizontal,
    required this.actions,
  });

  @override
  Widget build(BuildContext context)
  {
    return DefaultDialog(
      title: title,
      content: text == null ? null : Padding(
        padding: context.paddingS_0,
        child: TextBody.medium(text, 
          textAlign: TextAlign.center,
          color: textLowFocus ? context.colors.onSurfaceLessFocus : null
        ),
      ),
      actionsAlignment: actionsAlignment,
      actions: actions,
    );
  }
}
