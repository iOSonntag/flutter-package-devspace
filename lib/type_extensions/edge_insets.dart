



part of devspace;

extension ExtensionOnEdgeInsets on EdgeInsets {

  EdgeInsets get onlyHorizontal => EdgeInsets.only(
    left: left,
    right: right,
  );

  EdgeInsets get onlyVertical => EdgeInsets.only(
    top: top,
    bottom: bottom,
  );

  EdgeInsets setLeft(double value) => EdgeInsets.only(
    left: value,
    top: top,
    right: right,
    bottom: bottom,
  );

  EdgeInsets setTop(double value) => EdgeInsets.only(
    left: left,
    top: value,
    right: right,
    bottom: bottom,
  );

  EdgeInsets setRight(double value) => EdgeInsets.only(
    left: left,
    top: top,
    right: value,
    bottom: bottom,
  );

  EdgeInsets setBottom(double value) => EdgeInsets.only(
    left: left,
    top: top,
    right: right,
    bottom: value,
  );

  EdgeInsets fineLeft(double value) => EdgeInsets.only(
    left: left + value,
    top: top,
    right: right,
    bottom: bottom,
  );

  EdgeInsets fineTop(double value) => EdgeInsets.only(
    left: left,
    top: top + value,
    right: right,
    bottom: bottom,
  );

  EdgeInsets fineRight(double value) => EdgeInsets.only(
    left: left,
    top: top,
    right: right + value,
    bottom: bottom,
  );

  EdgeInsets fineBottom(double value) => EdgeInsets.only(
    left: left,
    top: top,
    right: right,
    bottom: bottom + value,
  );

  EdgeInsets fineAll(double value) => EdgeInsets.only(
    left: left + value,
    top: top + value,
    right: right + value,
    bottom: bottom + value,
  );

  EdgeInsets fine({double? left, double? top, double? right, double? bottom}) => EdgeInsets.only(
    left: this.left + (left ?? 0.0),
    top: this.top + (top ?? 0.0),
    right: this.right + (right ?? 0.0),
    bottom: this.bottom + (bottom ?? 0.0),
  );

  EdgeInsets fineHorizontal(double value) => EdgeInsets.only(
    left: left + value,
    top: top,
    right: right + value,
    bottom: bottom,
  );

  EdgeInsets fineVertical(double value) => EdgeInsets.only(
    left: left,
    top: top + value,
    right: right,
    bottom: bottom + value,
  );

  EdgeInsets excludeTop({bool condition = true }) => condition == false ? this : EdgeInsets.only(
    left: left,
    right: right,
    bottom: bottom,
  );

  EdgeInsets excludeBottom({bool condition = true }) => condition == false ? this : EdgeInsets.only(
    left: left,
    top: top,
    right: right,
  );

  EdgeInsets excludeLeft({bool condition = true }) => condition == false ? this : EdgeInsets.only(
    top: top,
    right: right,
    bottom: bottom,
  );

  EdgeInsets excludeRight({bool condition = true }) => condition == false ? this : EdgeInsets.only(
    left: left,
    top: top,
    bottom: bottom,
  );

}