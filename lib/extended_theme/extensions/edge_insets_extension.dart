



part of devspace;

extension ExtensionEdgeInsets on EdgeInsets {

  EdgeInsets get onlyHorizontal => EdgeInsets.only(
    left: left,
    right: right,
  );

  EdgeInsets get onlyVertical => EdgeInsets.only(
    top: top,
    bottom: bottom,
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

}