
part of devspace;

class GalaxyConfig {

  final GalaxyAssets assets;

  const GalaxyConfig({
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