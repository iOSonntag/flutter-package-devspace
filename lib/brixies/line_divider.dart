
part of devspace;

class LineDivider extends StatelessWidget {

  final Axis axis;
  final Color? color;
  final double space;
  final double length;
  // TODO: use theme extension
  final double? thickness;
  final bool fade;

  const LineDivider({
    super.key,
    this.axis = Axis.horizontal,
    this.color,
    this.space = 0.0,
    this.length = double.infinity,
    this.thickness = 0.5,
    this.fade = false,
  });

  @override
  Widget build(BuildContext context)
  {
    Color col = color ?? context.colors.onBackgroundLessFocus;

    if (axis == Axis.horizontal)
    {
      return Container(
        margin: EdgeInsets.fromLTRB(space, 0.0, space, 0.0),
        decoration: BoxDecoration(
          color: fade ? null : col,
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