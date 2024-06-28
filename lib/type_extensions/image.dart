part of devspace;


// ignore: camel_case_types
enum kImageConversionType
{
  none,
  jpeg,
  png
}

extension ExtensionOnImage on img.Image {


  /// Converts the image to the specified type, quality, and size. If both
  /// maxWidth and maxHeight are set, the image will be resized to fit within
  /// the specified dimensions.
  Future<img.Image> convertImage({
    required kImageConversionType type,
    /// quality will only be used if explicitly converting to jpeg
    double quality = 1.0,
    int? maxWidth,
    int? maxHeight,
  }) async
  {
    img.Image image = this;

    if ((maxWidth != null && image.width > maxWidth) || (maxHeight != null && image.height > maxHeight))
    {
      image = img.copyResize(
        image,
        width: maxWidth != null && image.width > maxWidth ? maxWidth : null,
        height: maxHeight != null && image.height > maxHeight ? maxHeight : null,
        maintainAspect: true,
        interpolation: img.Interpolation.average,
      );
    }

    final Uint8List encodedImage;

    switch (type)
    {
      case kImageConversionType.none:
        return image;
        
      case kImageConversionType.jpeg:
        encodedImage = img.encodeJpg(image, quality: (quality * 100).round());
        break;
      case kImageConversionType.png:
        encodedImage = img.encodePng(image);
        break;
    }

    return img.decodeImage(encodedImage)!;
  }


  ImageProvider toImageProvider()
  {
    List<int> encodedBytes = img.encodePng(this);
    
    if (encodedBytes.isEmpty)
    {
      encodedBytes = img.encodeJpg(this);
    }

    if (encodedBytes.isEmpty)
    {
      throw Exception('Failed to encode image to any supported format');
    }
    
    Uint8List uint8List = Uint8List.fromList(encodedBytes);
    
    return MemoryImage(uint8List);
  }

}