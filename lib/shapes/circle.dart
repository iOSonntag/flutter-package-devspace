part of devspace;


class Circle extends StatelessWidget
{
  final double? strokeWidth;
  final Color? color;
  final Widget? child;

  const Circle({
    super.key,
    this.color,
    // setting strokeWith to 0.0 will fill the circle entirely
    this.strokeWidth,
    this.child,
  });

  @override
  Widget build(BuildContext context)
  {
    Color col = color ?? context.colors.primary;
    double width = strokeWidth ?? context.dimensions.borderThicknessM;

    return CustomPaint(
      painter: CirclePainter(
        color: col,
        strokeWidth: width,
      ),
      child: child,
    );
  }
}

class CirclePainter extends CustomPainter {

  final Color color;
  final double strokeWidth;

  CirclePainter({
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size)
  {
    Dev.log('CirclePainter.paint', 'size', size);
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = strokeWidth == 0.0 ? PaintingStyle.fill : PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);

    final radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)
  {
    return false;
  }
}