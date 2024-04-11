
part of devspace;

// ignore: camel_case_types
enum kImageVariant
{
  regular,
}

// ignore: camel_case_types
enum kImageShapePreset
{
  none,
  rectangle,
  circle,
  rounded,
}

// ignore: camel_case_types
enum kImageEdgePreset
{
  none,
  outerShadowS,
  outerShadowM,
  outerShadowL,
  borderS,
  borderM,
  borderL,
}

class ImageDisplayStyle {

  final double? aspectRatio;
  final BoxFit fit;
  final kImageShapePreset shapePreset;
  final kImageEdgePreset edgePreset;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final ColorFilter? colorFilter;

  const ImageDisplayStyle({
    this.aspectRatio,
    this.fit = BoxFit.cover,
    this.shapePreset = kImageShapePreset.rounded,
    this.edgePreset = kImageEdgePreset.none,
    this.borderRadius,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.colorFilter,
  }) : assert(shapePreset == kImageShapePreset.none || borderRadius == null);

}

class ImageData extends PlanData {

  final ImageProvider image;
  final ImageDisplayStyle style;

  const ImageData({
    super.variationId,
    required this.image,
    this.style = const ImageDisplayStyle(),
  });

}