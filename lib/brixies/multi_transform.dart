


part of devspace;


class MultiTransform {



  static Widget translateRotateScale({
    required Offset offset,
    required double angle,
    required double scaleX,
    required double scaleY,
    required Widget child,
  }) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(offset.dx, offset.dy, 0.0)
        ..rotateZ(angle)
        ..scale(scaleX, scaleY, 1.0),
      child: child,
    );
  }

  static Widget translateScale({
    required Offset offset,
    required double scaleX,
    required double scaleY,
    required Widget child,
  }) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(offset.dx, offset.dy, 0.0)
        ..scale(scaleX, scaleY, 1.0),
      child: child,
    );
  }

}