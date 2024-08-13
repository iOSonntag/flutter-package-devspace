



part of devspace;

abstract class AdditionalColorsDefaults {
  
  AdditionalColorsDefaults._();

  static const Color background = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF333333);
  static const Color onBackgroundLessFocus = Color(0xFF959595);
  static const Color onBackgroundLeastFocus = Color(0xFFDEDEDE);
  static const Color onSurfaceLessFocus = Color(0xFF959595);
  static const Color onSurfaceLeastFocus = Color(0xFFDEDEDE);
  static const Color onPrimaryLessFocus = Color(0xFFBBBBBB);
  static const Color success = Color(0xFF00C853);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color warning = Color(0xFFFFD600);
  static const Color onWarning = Color(0xFF826D06);
  static const Color congratulations = Color(0xFF9E11DA);
  static const Color onCongratulations = Color(0xFFFFFFFF);
  
}

class AdditionalColorsThemeData extends ThemeExtension<AdditionalColorsThemeData> {

  final Color background;
  final Color onBackground;
  final Color onBackgroundLessFocus;
  final Color onBackgroundLeastFocus;
  final Color onSurfaceLessFocus;
  final Color onSurfaceLeastFocus;
  final Color onPrimaryLessFocus;
  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color congratulations;
  final Color onCongratulations;

  const AdditionalColorsThemeData({
    this.background = AdditionalColorsDefaults.background,
    this.onBackground = AdditionalColorsDefaults.onBackground,
    this.onBackgroundLessFocus = AdditionalColorsDefaults.onBackgroundLessFocus,
    this.onBackgroundLeastFocus = AdditionalColorsDefaults.onBackgroundLeastFocus,
    this.onSurfaceLessFocus = AdditionalColorsDefaults.onSurfaceLessFocus,
    this.onSurfaceLeastFocus = AdditionalColorsDefaults.onSurfaceLeastFocus,
    this.onPrimaryLessFocus = AdditionalColorsDefaults.onPrimaryLessFocus,
    this.success = AdditionalColorsDefaults.success,
    this.onSuccess = AdditionalColorsDefaults.onSuccess,
    this.warning = AdditionalColorsDefaults.warning,
    this.onWarning = AdditionalColorsDefaults.onWarning,
    this.congratulations = AdditionalColorsDefaults.congratulations,
    this.onCongratulations = AdditionalColorsDefaults.onCongratulations,
  });
  
  @override
  ThemeExtension<AdditionalColorsThemeData> copyWith({
    Color? background,
    Color? onBackground,
    Color? onBackgroundLessFocus,
    Color? onBackgroundLeastFocus,
    Color? onSurfaceLessFocus,
    Color? onSurfaceLeastFocus,
    Color? onPrimaryLessFocus,
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? congratulations,
    Color? onCongratulations,
  })
  {
    return AdditionalColorsThemeData(
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      onBackgroundLessFocus: onBackgroundLessFocus ?? this.onBackgroundLessFocus,
      onBackgroundLeastFocus: onBackgroundLeastFocus ?? this.onBackgroundLeastFocus,
      onSurfaceLessFocus: onSurfaceLessFocus ?? this.onSurfaceLessFocus,
      onSurfaceLeastFocus: onSurfaceLeastFocus ?? this.onSurfaceLeastFocus,
      onPrimaryLessFocus: onPrimaryLessFocus ?? this.onPrimaryLessFocus,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      congratulations: congratulations ?? this.congratulations,
      onCongratulations: onCongratulations ?? this.onCongratulations,
    );
  }
  
  @override
  ThemeExtension<AdditionalColorsThemeData> lerp(covariant ThemeExtension<AdditionalColorsThemeData>? other, double t)
  {
    if (other == null || other is! AdditionalColorsThemeData) return this;

    return AdditionalColorsThemeData(
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onBackgroundLessFocus: Color.lerp(onBackgroundLessFocus, other.onBackgroundLessFocus, t)!,
      onBackgroundLeastFocus: Color.lerp(onBackgroundLeastFocus, other.onBackgroundLeastFocus, t)!,
      onSurfaceLessFocus: Color.lerp(onSurfaceLessFocus, other.onSurfaceLessFocus, t)!,
      onSurfaceLeastFocus: Color.lerp(onSurfaceLeastFocus, other.onSurfaceLeastFocus, t)!,
      onPrimaryLessFocus: Color.lerp(onPrimaryLessFocus, other.onPrimaryLessFocus, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      congratulations: Color.lerp(congratulations, other.congratulations, t)!,
      onCongratulations: Color.lerp(onCongratulations, other.onCongratulations, t)!,
    );
  }

}