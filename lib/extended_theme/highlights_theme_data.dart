


// ignore_for_file: non_constant_identifier_names

part of devspace;

abstract class _HighlightsDefaults {

  static const BoxShadow boxShadowXS = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.05),
    blurRadius: 3,
    offset: Offset.zero,
    // blurStyle: BlurStyle.outer,
  );

  static const BoxShadow boxShadowS = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.05),
    blurRadius: 5,
    offset: Offset.zero,
    // blurStyle: BlurStyle.outer,
  );

  static const BoxShadow boxShadowM = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.08),
    blurRadius: 8,
    offset: Offset.zero,
    // blurStyle: BlurStyle.outer,
  );

  static const BoxShadow boxShadowL = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.13),
    blurRadius: 13,
    offset: Offset.zero,
    // blurStyle: BlurStyle.outer,
  );

  static const BoxShadow boxShadowXL = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.21),
    blurRadius: 21,
    offset: Offset.zero,
    // blurStyle: BlurStyle.outer,
  );
}

class HighlightsThemeData {

  const HighlightsThemeData({
    this.boxShadowXS = _HighlightsDefaults.boxShadowXS,
    this.boxShadowS = _HighlightsDefaults.boxShadowS,
    this.boxShadowM = _HighlightsDefaults.boxShadowM,
    this.boxShadowL = _HighlightsDefaults.boxShadowL,
    this.boxShadowXL = _HighlightsDefaults.boxShadowXL,
  });

  final BoxShadow boxShadowXS;
  final BoxShadow boxShadowS;
  final BoxShadow boxShadowM;
  final BoxShadow boxShadowL;
  final BoxShadow boxShadowXL;

}