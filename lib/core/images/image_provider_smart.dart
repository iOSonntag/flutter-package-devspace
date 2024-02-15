part of devspace;

// ignore: camel_case_types
enum kImageClass {
  profile,
  avatar,
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

    throw UnimplementedError('ImageProviderSmart.network: classification $classification not implemented');
  }
}