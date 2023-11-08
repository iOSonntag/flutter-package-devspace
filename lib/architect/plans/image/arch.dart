

part of devspace;

class ArchImage extends ArchBase<kImageVariant, ImageData> {

  ArchImage({
    super.key,
    super.variant = kImageVariant.regular,
    required ImageProvider image,
    ImageDisplayStyle style = const ImageDisplayStyle(),
  }) : 
    super(
      data: ImageData(
        image: image,
        style: style,
      ),
    );
  
}