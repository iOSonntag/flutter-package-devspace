


// ignore_for_file: non_constant_identifier_names


part of devspace;

abstract class _AnimationsDefaults {

  static const ScrollPhysics scrollPhysics = BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  static const Duration durationPageSlide = Duration(milliseconds: 500);
  static const Duration durationFadeFast = Duration(milliseconds: 60);
  static const Duration durationFadeRegular = Duration(milliseconds: 200);
  static const Duration durationFadeSlow = Duration(milliseconds: 500);
  static const Duration durationGeneral = Duration(milliseconds: 300);


  static const Curve curvePageSlide = Curves.easeInOut;
  static const Curve curveGeneral = Curves.easeInOut;
}

class AnimationsThemeData {

  const AnimationsThemeData({
    this.scrollPhysics = _AnimationsDefaults.scrollPhysics,
    this.durationPageSlide = _AnimationsDefaults.durationPageSlide,
    this.durationFadeFast = _AnimationsDefaults.durationFadeFast,
    this.durationFadeRegular = _AnimationsDefaults.durationFadeRegular,
    this.durationFadeSlow = _AnimationsDefaults.durationFadeSlow,
    this.durationGeneral = _AnimationsDefaults.durationGeneral,
    this.curvePageSlide = _AnimationsDefaults.curvePageSlide,
    this.curveGeneral = _AnimationsDefaults.curveGeneral,
  });

  final ScrollPhysics scrollPhysics;
  final Duration durationPageSlide;
  final Duration durationFadeFast;
  final Duration durationFadeRegular;
  final Duration durationFadeSlow;
  final Duration durationGeneral;
  final Curve curvePageSlide;
  final Curve curveGeneral;

}