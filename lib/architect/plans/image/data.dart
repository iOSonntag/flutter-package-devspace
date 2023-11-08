
part of devspace;

// ignore: camel_case_types
enum kImageVariant
{
  regular,
}

// ignore: camel_case_types
enum kImageEdgeType
{
  rectangle,
  circle,
  rounded,
}

class ImageDisplayStyle {

  final double? aspectRatio;
  final BoxFit fit;
  final kImageEdgeType edgeType;

  const ImageDisplayStyle({
    this.aspectRatio,
    this.fit = BoxFit.cover,
    this.edgeType = kImageEdgeType.rounded,
  });

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