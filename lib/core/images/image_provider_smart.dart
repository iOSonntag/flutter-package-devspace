part of devspace;

// ignore: camel_case_types
enum kImageClass {
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
    if (classification != kImageClass.avatar) 
    {
      throw UnimplementedError('ImageProviderSmart.network: classification $classification not implemented');
    }


    if (url != null) 
    {
      return NetworkImage(url);
    } 
    
    return AssetImage(App.config.assets.imagePlaceholderNoAvatar);
  }
}