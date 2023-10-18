



part of devspace;

abstract class AdditionalColorsDefaults {
  
  AdditionalColorsDefaults._();

  static const Color onBackgroundLessFocus = Color(0xFF959595);
  static const Color onBackgroundLeastFocus = Color(0xFFDEDEDE);
  static const Color success = Color(0xFF00C853);
  static const Color onSuccess = Color(0xFFFFFFFF);
  
}

class AdditionalColorsThemeData extends ThemeExtension<AdditionalColorsThemeData> {

  final Color onBackgroundLessFocus;
  final Color onBackgroundLeastFocus;
  final Color success;
  final Color onSuccess;

  const AdditionalColorsThemeData({
    this.onBackgroundLessFocus = AdditionalColorsDefaults.onBackgroundLessFocus,
    this.onBackgroundLeastFocus = AdditionalColorsDefaults.onBackgroundLeastFocus,
    this.success = AdditionalColorsDefaults.success,
    this.onSuccess = AdditionalColorsDefaults.onSuccess,
  });
  
  @override
  ThemeExtension<AdditionalColorsThemeData> copyWith({
    Color? onBackgroundLessFocus,
    Color? onBackgroundLeastFocus,
    Color? success,
    Color? onSuccess,
  })
  {
    return AdditionalColorsThemeData(
      onBackgroundLessFocus: onBackgroundLessFocus ?? this.onBackgroundLessFocus,
      onBackgroundLeastFocus: onBackgroundLeastFocus ?? this.onBackgroundLeastFocus,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
    );
  }
  
  @override
  ThemeExtension<AdditionalColorsThemeData> lerp(covariant ThemeExtension<AdditionalColorsThemeData>? other, double t)
  {
    if (other == null || other is! AdditionalColorsThemeData) return this;

    return AdditionalColorsThemeData(
      onBackgroundLessFocus: Color.lerp(onBackgroundLessFocus, other.onBackgroundLessFocus, t)!,
      onBackgroundLeastFocus: Color.lerp(onBackgroundLeastFocus, other.onBackgroundLeastFocus, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
    );
  }

}