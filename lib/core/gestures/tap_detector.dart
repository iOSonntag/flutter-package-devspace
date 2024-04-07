part of devspace;

class TapDetector extends StatelessWidget {

  final VoidCallback onTap;
  final HitTestBehavior behavior;
  final Widget child;

  const TapDetector({
    super.key,
    required this.onTap,
    this.behavior = HitTestBehavior.opaque,
    required this.child,
  });

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: onTap,
      behavior: behavior,
      child: child,
    );
  }
}
