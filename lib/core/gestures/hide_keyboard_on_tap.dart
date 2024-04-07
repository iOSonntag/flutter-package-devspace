
part of devspace;

class HideKeyboardOnTap extends StatelessWidget {

  final Widget child;

  const HideKeyboardOnTap({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: ()
      {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
