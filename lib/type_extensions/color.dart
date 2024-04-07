


part of devspace;

extension ColorExtension on Color {

  // external static Color d(String hex);


  Color brighten(double amount)
  {
    return _addBrigthnessAmount(amount);
  }

  Color darken(double amount)
  {
    return _addBrigthnessAmount(-amount);
  }

  Color _addBrigthnessAmount(double amount)
  {
    assert(amount >= -1 && amount <= 1);

    if (amount == 0)
    {
      return this;
    }

    final hsl = HSLColor.fromColor(this);
    final hslLighter = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLighter.toColor();
  }


  static const List<double> _naturalIlluminationAdjustmentValues = [
    0.07,
    0.05,
    0.0,
    -0.05,
    -0.07,
  ];

  /// Returns a [LinearGradient] that goes from a slightly brighter version of
  /// this color to a slightly darker version of this color with an angle that
  /// mimics natural illumination.
  /// 
  /// If the color is already bright, the gradient will be from the original
  /// color to a slightly even darker version of the color.
  // ignore: non_constant_identifier_names
  Gradient toGradient_NaturalIlluminationS({ignoreAngle = false})
  {
    return toGradient_NaturalIlluminationWithStrength(
      strength: 0.5,
      ignoreAngle: ignoreAngle,
    );
  }

  /// Returns a [LinearGradient] that goes from a slightly brighter version of
  /// this color to a slightly darker version of this color with an angle that
  /// mimics natural illumination.
  /// 
  /// If the color is already bright, the gradient will be from the original
  /// color to a slightly even darker version of the color.
  // ignore: non_constant_identifier_names
  Gradient toGradient_NaturalIlluminationM({ignoreAngle = false})
  {
    return toGradient_NaturalIlluminationWithStrength(
      strength: 0.75,
      ignoreAngle: ignoreAngle,
    );
  }

  /// Returns a [LinearGradient] that goes from a slightly brighter version of
  /// this color to a slightly darker version of this color with an angle that
  /// mimics natural illumination.
  /// 
  /// If the color is already bright, the gradient will be from the original
  /// color to a slightly even darker version of the color.
  // ignore: non_constant_identifier_names
  Gradient toGradient_NaturalIlluminationL({ignoreAngle = false})
  {
    return toGradient_NaturalIlluminationWithStrength(
      strength: 1.0,
      ignoreAngle: ignoreAngle,
    );
  }

  /// Returns a [LinearGradient] that goes from a slightly brighter version of
  /// this color to a slightly darker version of this color with an angle that
  /// mimics natural illumination.
  /// 
  /// If the color is already bright, the gradient will be from the original
  /// color to a slightly even darker version of the color.
  // ignore: non_constant_identifier_names
  Gradient toGradient_NaturalIlluminationWithStrength({double strength = 1.0, ignoreAngle = false})
  {
    final hsl = HSLColor.fromColor(this);

    List<Color>? colors;

    if (hsl.lightness >= 1.0 - _naturalIlluminationAdjustmentValues[0])
    {
      colors = [
        this,
        _addBrigthnessAmount(_naturalIlluminationAdjustmentValues[1] * strength - _naturalIlluminationAdjustmentValues[0]),
        _addBrigthnessAmount(_naturalIlluminationAdjustmentValues[2] * strength - _naturalIlluminationAdjustmentValues[0]),
        _addBrigthnessAmount(_naturalIlluminationAdjustmentValues[3] * strength - _naturalIlluminationAdjustmentValues[0]),
        _addBrigthnessAmount(_naturalIlluminationAdjustmentValues[4] * strength - _naturalIlluminationAdjustmentValues[0]),
      ];
    }
    else
    {
      colors = [
        _addBrigthnessAmount(_naturalIlluminationAdjustmentValues[0] * strength),
        _addBrigthnessAmount(_naturalIlluminationAdjustmentValues[1] * strength),
        _addBrigthnessAmount(_naturalIlluminationAdjustmentValues[2] * strength),
        _addBrigthnessAmount(_naturalIlluminationAdjustmentValues[3] * strength),
        _addBrigthnessAmount(_naturalIlluminationAdjustmentValues[4] * strength),
      ];
    }

    // TODO: add theming option to adjust angle
    return LinearGradient(
      begin: const Alignment(0, -1.0),
      end: Alignment(ignoreAngle ? 0.0 : 0.05, 1.0),
      colors: colors,
    );
  }
}
