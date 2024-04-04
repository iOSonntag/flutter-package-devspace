part of devspace;



extension ExtensionOnBorderRadius on BorderRadius {


  BorderRadius insetBy(double value) => BorderRadius.only(
    topLeft: Radius.circular(topLeft.x - value),
    topRight: Radius.circular(topRight.x - value),
    bottomLeft: Radius.circular(bottomLeft.x - value),
    bottomRight: Radius.circular(bottomRight.x - value),
  );

  /// Returns a new [BorderRadius] with the same radii as this one, but with the
  /// radii inset by the given [padding].
  /// 
  /// This is useful when you want to apply a padding to a [Container] with a
  /// [BorderRadius] and you want the padding to be applied to the inner part of
  /// the border radius, thus matching the outer radius including the padding.
  BorderRadius matchWithOuterPadding(EdgeInsets padding) => BorderRadius.only(
    topLeft: Radius.circular(topLeft.x - padding.left),
    topRight: Radius.circular(topRight.x - padding.right),
    bottomLeft: Radius.circular(bottomLeft.x - padding.bottom),
    bottomRight: Radius.circular(bottomRight.x - padding.top),
  );

}