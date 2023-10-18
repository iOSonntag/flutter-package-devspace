


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
    blurRadius: 6,
    offset: Offset.zero,
    // blurStyle: BlurStyle.outer,
  );

  static const BoxShadow boxShadowM = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.10),
    blurRadius: 12,
    offset: Offset.zero,
    // blurStyle: BlurStyle.outer,
  );

  static const BoxShadow boxShadowL = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.18),
    blurRadius: 24,
    offset: Offset.zero,
    // blurStyle: BlurStyle.outer,
  );

  static const BoxShadow boxShadowXL = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.22),
    blurRadius: 48,
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