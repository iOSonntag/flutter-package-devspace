
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

  const GalaxyConfig({
    required this.errorShadowing,
    required this.assets,
  });

}

class GalaxyAssets {

  final String imagePlaceholderNoAvatar;
  final String imagePlaceholderNoProfile;

  const GalaxyAssets({
    required this.imagePlaceholderNoAvatar,
    required this.imagePlaceholderNoProfile,
  });

}