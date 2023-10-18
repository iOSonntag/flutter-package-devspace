



part of devspace;

// TODO: add ExtendedTheme class to be able to replace the default values

final WeakMap<ThemeData, DimensionsThemeData> _dimensionsThemeData = WeakMap();
final WeakMap<ThemeData, HighlightsThemeData> _highlightsThemeData = WeakMap();
final WeakMap<ThemeData, AnimationsThemeData> _animationsThemeData = WeakMap();

extension ThemeDataExtension on ThemeData {

  DimensionsThemeData get dimensions 
  {
    DimensionsThemeData? data = _dimensionsThemeData[this];

    if (data != null) return data;

    const dimensions = DimensionsThemeData();

    _dimensionsThemeData[this] = dimensions;

    return dimensions;
  }

  HighlightsThemeData get highlights 
  {
    HighlightsThemeData? data = _highlightsThemeData[this];

    if (data != null) return data;

    const highlights = HighlightsThemeData();

    _highlightsThemeData[this] = highlights;

    return highlights;
  }

  AnimationsThemeData get animations 
  {
    AnimationsThemeData? data = _animationsThemeData[this];

    if (data != null) return data;

    const animations = AnimationsThemeData();

    _animationsThemeData[this] = animations;

    return animations;
  }

}
