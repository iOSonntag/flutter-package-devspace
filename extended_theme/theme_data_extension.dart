



// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:iosite/_packages/extended_theme/dimensions_theme_data.dart';
import 'package:iosite/_packages/extended_theme/highlights_theme_data.dart';

// TODO: add ExtendedTheme class to be able to set those values

final WeakMap<ThemeData, DimensionsThemeData> _dimensionsThemeData = WeakMap();
final WeakMap<ThemeData, HighlightsThemeData> _highlightsThemeData = WeakMap();

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

}