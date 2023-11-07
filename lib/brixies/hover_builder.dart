


part of devspace;

typedef HoverWidgetBuilder = Widget Function(BuildContext context, bool isHovering);


class HoverBuilder extends StatefulWidget {

  final HitTestBehavior behavior;
  final MouseCursor cursor;
  final VoidCallback? onTap;
  final HoverWidgetBuilder builder;

  const HoverBuilder({
    super.key,
    this.behavior = HitTestBehavior.opaque,
    this.cursor = SystemMouseCursors.click,
    this.onTap,
    required this.builder
  });

  @override
  State<HoverBuilder> createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {

  bool _isHovering = false;

  @override
  Widget build(BuildContext context)
  {
    Widget child = widget.builder(context, _isHovering);

    if (widget.onTap != null)
    {
      child = GestureDetector(
        behavior: widget.behavior,
        onTap: widget.onTap,
        child: child,
      );
    }

    return MouseRegion(
      cursor: widget.cursor,
      hitTestBehavior: widget.behavior,
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: child,
    );
  }
}