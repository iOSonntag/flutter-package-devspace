

part of devspace;

class ArchImage extends ArchBase<kImageVariant, ImageData> {

  ArchImage({
    super.key,
    super.variant = kImageVariant.regular,
    required ImageProvider image,
    BorderRadiusGeometry? borderRadius,
    kImageBorderPreset borderPreset = kImageBorderPreset.rounded,
    double? aspectRatio,
    BoxFit fit = BoxFit.cover,
  }) : 
    super(
      data: ImageData(
        image: image,
        style: ImageDisplayStyle(
          borderRadius: borderRadius,
          borderPreset: borderRadius != null ? kImageBorderPreset.none : borderPreset,
          aspectRatio: aspectRatio,
          fit: fit,
        ),
      ),
    );
  
}