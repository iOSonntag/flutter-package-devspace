


// ignore_for_file: non_constant_identifier_names

part of devspace;

class GalaxyThemeData extends ThemeExtension<GalaxyThemeData> {

  final DimensionsThemeData dimensions;
  final HighlightsThemeData highlights;
  final AnimationsThemeData animations;

  const GalaxyThemeData({
    this.dimensions = const DimensionsThemeData(),
    this.highlights = const HighlightsThemeData(),
    this.animations = const AnimationsThemeData(),
  });

  @override
  ThemeExtension<GalaxyThemeData> copyWith({
    DimensionsThemeData? dimensions,
    HighlightsThemeData? highlights,
    AnimationsThemeData? animations,
  })
  {
    return GalaxyThemeData(
      dimensions: dimensions ?? this.dimensions,
      highlights: highlights ?? this.highlights,
      animations: animations ?? this.animations,
    );
  }


  @override
  ThemeExtension<GalaxyThemeData> lerp(covariant ThemeExtension<GalaxyThemeData>? other, double t)
  {
    if (other == null || other is! GalaxyThemeData) return this;

    // TODOLIB: implement lerping
    return GalaxyThemeData(
      dimensions: other.dimensions,
      highlights: other.highlights,
      animations: other.animations,
    );
  }










}