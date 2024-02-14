



part of devspace;

abstract class AdditionalColorsDefaults {
  
  AdditionalColorsDefaults._();

  static const Color onBackgroundLessFocus = Color(0xFF959595);
  static const Color onBackgroundLeastFocus = Color(0xFFDEDEDE);
  static const Color onPrimaryLessFocus = Color(0xFFBBBBBB);
  static const Color success = Color(0xFF00C853);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color warning = Color(0xFFFFD600);
  static const Color onWarning = Color(0xFF826D06);
  static const Color congratulations = Color(0xFF9E11DA);
  static const Color onCongratulations = Color(0xFFFFFFFF);
  
}

class AdditionalColorsThemeData extends ThemeExtension<AdditionalColorsThemeData> {

  final Color onBackgroundLessFocus;
  final Color onBackgroundLeastFocus;
  final Color onPrimaryLessFocus;
  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color congratulations;
  final Color onCongratulations;

  const AdditionalColorsThemeData({
    this.onBackgroundLessFocus = AdditionalColorsDefaults.onBackgroundLessFocus,
    this.onBackgroundLeastFocus = AdditionalColorsDefaults.onBackgroundLeastFocus,
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
    Color? onBackgroundLessFocus,
    Color? onBackgroundLeastFocus,
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
      onBackgroundLessFocus: onBackgroundLessFocus ?? this.onBackgroundLessFocus,
      onBackgroundLeastFocus: onBackgroundLeastFocus ?? this.onBackgroundLeastFocus,
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
      onBackgroundLessFocus: Color.lerp(onBackgroundLessFocus, other.onBackgroundLessFocus, t)!,
      onBackgroundLeastFocus: Color.lerp(onBackgroundLeastFocus, other.onBackgroundLeastFocus, t)!,
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