
part of devspace;

// ignore: camel_case_types
enum kImageVariant
{
  regular,
}

// ignore: camel_case_types
enum kImageBorderPreset
{
  none,
  rectangle,
  circle,
  rounded,
}

class ImageDisplayStyle {

  final double? aspectRatio;
  final BoxFit fit;
  final kImageBorderPreset borderPreset;
  final BorderRadiusGeometry? borderRadius;

  const ImageDisplayStyle({
    this.aspectRatio,
    this.fit = BoxFit.cover,
    this.borderPreset = kImageBorderPreset.rounded,
    this.borderRadius,
  }) : assert(borderPreset == kImageBorderPreset.none || borderRadius == null);

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