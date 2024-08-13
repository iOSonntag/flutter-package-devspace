
part of devspace;

// ignore: camel_case_types
enum kErrorShadowing
{
  customer,
  employee,
  developer
}

class GalaxyConfig {

  final GalaxyAssets assets;
  final kErrorShadowing errorShadowing;
  final IOSConfig ios;

  const GalaxyConfig({
    required this.errorShadowing,
    required this.assets,
    required this.ios,
  });

}

class GalaxyAssets {

  final String imagePlaceholderNoAvatar;
  final String imagePlaceholderNoProfile;
  /// A placeholder image that is used when an image is missing but should be
  /// strongly visible as an error.
  final String imagePlaceholderHighlightAsError;

  const GalaxyAssets({
    required this.imagePlaceholderNoAvatar,
    required this.imagePlaceholderNoProfile,
    required this.imagePlaceholderHighlightAsError,
  });

}

class IOSConfig {

  /// A a numerical ID that Apple assigns to your app when you first create it
  /// in App Store Connect. 
  /// 
  /// Where to find it:
  /// - Log into App Store Connect (https://appstoreconnect.apple.com/)
  /// - Select your app
  /// - In the app's information page, look for "Apple ID" or "App ID"
  final String appStoreAppId;

  const IOSConfig({
    required this.appStoreAppId,
  });

  const IOSConfig.none() : appStoreAppId = '';

}