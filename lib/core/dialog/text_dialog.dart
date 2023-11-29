part of devspace;



class TextDialog extends StatelessWidget {

  final String title;
  final String text;
  final List<DialogAction> actions;

  const TextDialog({
    super.key,
    required this.title,
    required this.text,
    required this.actions,
  });

  @override
  Widget build(BuildContext context)
  {
    return DefaultDialog(
      title: title,
      content: Padding(
        padding: context.paddingS_0,
        child: TextBody.medium(text, 
          textAlign: TextAlign.center
        ),
      ),
      actions: actions,
    );
  }
}
