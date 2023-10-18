


// ignore_for_file: non_constant_identifier_names


part of devspace;

abstract class _AnimationsDefaults {

  static const ScrollPhysics scrollPhysics = BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  static const Duration durationPageSlide = Duration(milliseconds: 500);

  static const Curve curvePageSlide = Curves.easeInOut;
}

class AnimationsThemeData {

  const AnimationsThemeData({
    this.scrollPhysics = _AnimationsDefaults.scrollPhysics,
    this.durationPageSlide = _AnimationsDefaults.durationPageSlide,
    this.curvePageSlide = _AnimationsDefaults.curvePageSlide,
  });

  final ScrollPhysics scrollPhysics;
  final Duration durationPageSlide;
  final Curve curvePageSlide;

}