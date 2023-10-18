
part of devspace;

class EdgeShadow extends StatelessWidget {

  final List<BoxShadow> shadows;
  final Color? backgroundColor;
  final bool left;
  final bool top;
  final bool right;
  final bool bottom;
  final Widget? child;

  const EdgeShadow({
    super.key,
    required this.shadows,
    this.backgroundColor,
    this.left = false,
    this.top = false,
    this.right = false,
    this.bottom = false,
    this.child,
  });

  @override
  Widget build(BuildContext context)
  {
    return ClipPath(
      clipper: _EdgeShadowClipper(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? context.colors.background,
          boxShadow: shadows,
        ),
        child: child,
      ),
    );
  }
}

// ignore: constant_identifier_names
const double _SIDED_SHADOW_OFFSET = 100.0;

class _EdgeShadowClipper extends CustomClipper<Path> {

  final bool left;
  final bool top;
  final bool right;
  final bool bottom;

  const _EdgeShadowClipper({
    this.left = false,
    this.top = false,
    this.right = false,
    this.bottom = false,
  });


  @override
  Path getClip(Size size)
  {
    double offsetLeft = left ? _SIDED_SHADOW_OFFSET : 0.0;
    double offsetTop = top ? _SIDED_SHADOW_OFFSET : 0.0;
    double offsetRight = right ? _SIDED_SHADOW_OFFSET : 0.0;
    double offsetBottom = bottom ? _SIDED_SHADOW_OFFSET : 0.0;

    Path path = Path();

    path.moveTo(-offsetLeft, -offsetTop);

    path.lineTo(-offsetLeft, size.height + offsetBottom);

    path.lineTo(size.width + offsetRight, size.height + offsetBottom);
    path.lineTo(size.width + offsetRight, -offsetTop);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}