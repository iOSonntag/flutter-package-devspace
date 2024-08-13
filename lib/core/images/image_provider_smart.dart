part of devspace;

// ignore: camel_case_types
enum kImageClass {
  profile,
  avatar,
  /// If there is an issue with the image, a strong visually impactful
  /// placeholder will be used. 
  highlightErrors,
  other
}

abstract class ImageProviderSmart {

  static ImageProvider network(String? url, {
    double? scale, 
    Map<String, String>? headers,
    required kImageClass classification
  })
  {
    if (url != null) 
    {
      return NetworkImage(url);
    } 
    
    if (classification == kImageClass.avatar)
    {
      return AssetImage(App.config.assets.imagePlaceholderNoAvatar);
    }

    if (classification == kImageClass.profile)
    {
      return AssetImage(App.config.assets.imagePlaceholderNoProfile);
    }

    if (classification == kImageClass.highlightErrors)
    {
      return AssetImage(App.config.assets.imagePlaceholderHighlightAsError);
    }

    throw UnimplementedError('ImageProviderSmart.network: classification $classification not implemented');
  }
}