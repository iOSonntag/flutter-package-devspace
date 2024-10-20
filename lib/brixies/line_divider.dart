
part of devspace;

class LineDivider extends StatelessWidget {

  final Axis axis;
  final Color? color;
  final double space;
  final double length;
  final double? thickness;
  final BoxShadow? shadow;
  final bool fade;

  const LineDivider({
    super.key,
    this.axis = Axis.horizontal,
    this.color,
    this.space = 0.0,
    this.length = double.infinity,
    this.thickness,
    this.shadow,
    this.fade = false,
  });

  @override
  Widget build(BuildContext context)
  {
    Color col = color ?? context.colors.onBackgroundLessFocus;

    double thickness = this.thickness ?? context.dimensions.lineThicknessS;

    if (axis == Axis.horizontal)
    {
      return Container(
        margin: EdgeInsets.fromLTRB(space, 0.0, space, 0.0),
        decoration: BoxDecoration(
          color: fade ? null : col,
          boxShadow: shadow != null ? [shadow!] : null,
          gradient: !fade ? null : LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              col.withOpacity(0.0),
              col,
              col.withOpacity(0.0),
            ],
          ),
        ),
        width: length,
        height: thickness,
      );
    }

    return Container(
      margin: EdgeInsets.fromLTRB(0.0, space, 0.0, space),
      decoration: BoxDecoration(
        color: fade ? null : col,
        boxShadow: shadow != null ? [shadow!] : null,
        gradient: !fade ? null : LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            col.withOpacity(0.0),
            col,
            col.withOpacity(0.0),
          ],
        ),
      ),
      width: thickness,
      height: length,
    );
  }

}