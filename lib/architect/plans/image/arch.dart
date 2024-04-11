

part of devspace;

class ArchImage extends ArchBase<kImageVariant, ImageData> {

  ArchImage({
    super.key,
    super.variant = kImageVariant.regular,
    required ImageProvider image,
    BorderRadius? borderRadius,
    kImageShapePreset shapePreset = kImageShapePreset.rounded,
    kImageEdgePreset edgePreset = kImageEdgePreset.outerShadowS,
    double? aspectRatio,
    BoxFit fit = BoxFit.cover,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    Color? borderColor,
    ColorFilter? colorFilter,
  }) : 
    super(
      data: ImageData(
        image: image,
        style: ImageDisplayStyle(
          borderRadius: borderRadius,
          shapePreset: borderRadius != null ? kImageShapePreset.none : shapePreset,
          edgePreset: edgePreset,
          aspectRatio: aspectRatio,
          fit: fit,
          padding: padding,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          colorFilter: colorFilter,
        ),
      ),
    );
  
}