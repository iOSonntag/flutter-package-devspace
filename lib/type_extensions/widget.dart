
part of devspace;


extension ExtensionOnWidget on Widget {

  Widget expand([int flex = 1]) => Expanded(
    flex: flex,
    child: this
  );

  Widget toTopLeft() => Align(
    alignment: Alignment.topLeft,
    child: this
  );

  Widget toTop() => Align(
    alignment: Alignment.topCenter,
    child: this
  );

  Widget toTopRight() => Align(
    alignment: Alignment.topRight,
    child: this
  );

  Widget toRight() => Align(
    alignment: Alignment.centerRight,
    child: this
  );

  Widget toBottomRight() => Align(
    alignment: Alignment.bottomRight,
    child: this
  );

  Widget toBottom() => Align(
    alignment: Alignment.bottomCenter,
    child: this
  );

  Widget toBottomLeft() => Align(
    alignment: Alignment.bottomLeft,
    child: this
  );

  Widget toLeft() => Align(
    alignment: Alignment.centerLeft,
    child: this
  );

}