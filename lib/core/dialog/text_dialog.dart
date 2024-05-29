part of devspace;



class TextDialog extends StatelessWidget {

  final bool isLoading;
  final String title;
  final String? text;
  final bool textLowFocus;
  final Axis actionsAlignment;
  final List<DialogAction> actions;

  const TextDialog({
    super.key,
    this.isLoading = false,
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
      isLoading: isLoading,
      title: title,
      content: text == null ? null : Padding(
        padding: context.paddingM_0,
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
