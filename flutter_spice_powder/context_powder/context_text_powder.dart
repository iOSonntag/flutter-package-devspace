


import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
TextStyle DEFAULT_TEXT_STYLE = const TextStyle();

extension TextContextExtension on BuildContext {


  TextStyle get textHeadlineMedium
  {
    TextStyle? style = Theme.of(this).textTheme.headlineMedium;

    if (style == null)
    {
      throw Exception("Text style [TextTheme.headlineMedium] is not defined in the current theme.");
    }

    return style;
  }

  TextStyle get textBodyMedium
  {
    TextStyle? style = Theme.of(this).textTheme.bodyMedium;

    if (style == null)
    {
      throw Exception("Text style [TextTheme.bodyMedium] is not defined in the current theme.");
    }

    return style;
  }
}

extension TextStyleExtension on TextStyle {

  TextStyle withColor(Color? color) => copyWith(color: color);

  TextStyle withFontSize(double? fontSize) => copyWith(fontSize: fontSize);

  TextStyle withFontWeight(FontWeight? fontWeight) => copyWith(fontWeight: fontWeight);

  TextStyle withLetterSpacing(double? letterSpacing) => copyWith(letterSpacing: letterSpacing);

  TextStyle withWordSpacing(double? wordSpacing) => copyWith(wordSpacing: wordSpacing);

  TextStyle withHeight(double? height) => copyWith(height: height);

  TextStyle withBackground(Color? color) => copyWith(background: color == null ? null : (Paint()..color = color));

  TextStyle withForeground(Color? color) => copyWith(foreground: color == null ? null : (Paint()..color = color));

  TextStyle withShadows(List<Shadow>? shadows) => copyWith(shadows: shadows);

  TextStyle withDecoration(TextDecoration? decoration) => copyWith(decoration: decoration);

  TextStyle withDecorationColor(Color? color) => copyWith(decorationColor: color);

  TextStyle withDecorationStyle(TextDecorationStyle? style) => copyWith(decorationStyle: style);

  TextStyle withDecorationThickness(double? thickness) => copyWith(decorationThickness: thickness);

  TextStyle withFontFamily(String? fontFamily) => copyWith(fontFamily: fontFamily);

  TextStyle withFontFamilyFallback(List<String> fontFamilyFallback) => copyWith(fontFamilyFallback: fontFamilyFallback);

  TextStyle withPackage(String? package) => copyWith(package: package);

  TextStyle withFontStyle(FontStyle? fontStyle) => copyWith(fontStyle: fontStyle);

  TextStyle withTextBaseline(TextBaseline? textBaseline) => copyWith(textBaseline: textBaseline);

  TextStyle withLocale(Locale? locale) => copyWith(locale: locale);

  TextStyle withForegroundPaint(Paint? foreground) => copyWith(foreground: foreground);

  TextStyle withBackgroundPaint(Paint? background) => copyWith(background: background);

  TextStyle withFontFeatures(List<FontFeature>? fontFeatures) => copyWith(fontFeatures: fontFeatures);


}