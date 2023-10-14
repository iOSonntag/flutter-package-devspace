


// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class DimensionsThemeData {

  const DimensionsThemeData({
    double spaceXS = 4.0,
    double spaceS = 8.0,
    double spaceM = 16.0,
    double spaceL = 24.0,
    double spaceXL = 32.0,
    this.radiusS = 8.0,
    this.radiusM = 20.0,
    this.radiusL = 36.0,
    this.barHeightS = 40.0,
    this.barHeightM = 60.0,
    this.barHeightL = 100.0,
  }) : 
    spaceXSValue = spaceXS,
    spaceSValue = spaceS,
    spaceMValue = spaceM,
    spaceLValue = spaceL,
    spaceXLValue = spaceXL;

  final double spaceXSValue;
  final double spaceSValue;
  final double spaceMValue;
  final double spaceLValue;
  final double spaceXLValue;

  final double radiusS;
  final double radiusM;
  final double radiusL;

  final double barHeightS;
  final double barHeightM;
  final double barHeightL;

  EdgeInsets get paddingXS => EdgeInsets.all(spaceXSValue);
  EdgeInsets get paddingS => EdgeInsets.all(spaceSValue);
  EdgeInsets get paddingM => EdgeInsets.all(spaceMValue);
  EdgeInsets get paddingL => EdgeInsets.all(spaceLValue);
  EdgeInsets get paddingXL => EdgeInsets.all(spaceXLValue);


  // Special padding methods
  EdgeInsets get paddingXS_S => EdgeInsets.symmetric(horizontal: spaceXSValue, vertical: spaceSValue);
  EdgeInsets get paddingXS_M => EdgeInsets.symmetric(horizontal: spaceXSValue, vertical: spaceMValue);
  EdgeInsets get paddingXS_L => EdgeInsets.symmetric(horizontal: spaceXSValue, vertical: spaceLValue);
  EdgeInsets get paddingXS_XL => EdgeInsets.symmetric(horizontal: spaceXSValue, vertical: spaceXLValue);

  EdgeInsets get paddingS_XS => EdgeInsets.symmetric(horizontal: spaceSValue, vertical: spaceXSValue);
  EdgeInsets get paddingS_M => EdgeInsets.symmetric(horizontal: spaceSValue, vertical: spaceMValue);
  EdgeInsets get paddingS_L => EdgeInsets.symmetric(horizontal: spaceSValue, vertical: spaceLValue);
  EdgeInsets get paddingS_XL => EdgeInsets.symmetric(horizontal: spaceSValue, vertical: spaceXLValue);

  EdgeInsets get paddingM_XS => EdgeInsets.symmetric(horizontal: spaceMValue, vertical: spaceXSValue);
  EdgeInsets get paddingM_S => EdgeInsets.symmetric(horizontal: spaceMValue, vertical: spaceSValue);
  EdgeInsets get paddingM_L => EdgeInsets.symmetric(horizontal: spaceMValue, vertical: spaceLValue);
  EdgeInsets get paddingM_XL => EdgeInsets.symmetric(horizontal: spaceMValue, vertical: spaceXLValue);

  EdgeInsets get paddingL_XS => EdgeInsets.symmetric(horizontal: spaceLValue, vertical: spaceXSValue);
  EdgeInsets get paddingL_S => EdgeInsets.symmetric(horizontal: spaceLValue, vertical: spaceSValue);
  EdgeInsets get paddingL_M => EdgeInsets.symmetric(horizontal: spaceLValue, vertical: spaceMValue);
  EdgeInsets get paddingL_XL => EdgeInsets.symmetric(horizontal: spaceLValue, vertical: spaceXLValue);

  EdgeInsets get paddingXL_XS => EdgeInsets.symmetric(horizontal: spaceXLValue, vertical: spaceXSValue);
  EdgeInsets get paddingXL_S => EdgeInsets.symmetric(horizontal: spaceXLValue, vertical: spaceSValue);
  EdgeInsets get paddingXL_M => EdgeInsets.symmetric(horizontal: spaceXLValue, vertical: spaceMValue);
  EdgeInsets get paddingXL_L => EdgeInsets.symmetric(horizontal: spaceXLValue, vertical: spaceLValue);



  EdgeInsets paddingXSOnly({bool left = false, bool top = false, bool right = false, bool bottom = false}) => _edgeInsetsValueOnly(spaceXSValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingSOnly({bool left = false, bool top = false, bool right = false, bool bottom = false}) => _edgeInsetsValueOnly(spaceSValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingMOnly({bool left = false, bool top = false, bool right = false, bool bottom = false}) => _edgeInsetsValueOnly(spaceMValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingLOnly({bool left = false, bool top = false, bool right = false, bool bottom = false}) => _edgeInsetsValueOnly(spaceLValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingXLOnly({bool left = false, bool top = false, bool right = false, bool bottom = false}) => _edgeInsetsValueOnly(spaceXLValue, left: left, top: top, right: right, bottom: bottom);

  EdgeInsets paddingXSOverwrite({double? left, double? top, double? right, double? bottom}) => _edgeInsetsValueOverwrite(spaceXSValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingSOverwrite({double? left, double? top, double? right, double? bottom}) => _edgeInsetsValueOverwrite(spaceSValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingMOverwrite({double? left, double? top, double? right, double? bottom}) => _edgeInsetsValueOverwrite(spaceMValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingLOverwrite({double? left, double? top, double? right, double? bottom}) => _edgeInsetsValueOverwrite(spaceLValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingXLOverwrite({double? left, double? top, double? right, double? bottom}) => _edgeInsetsValueOverwrite(spaceXLValue, left: left, top: top, right: right, bottom: bottom);

  EdgeInsets _edgeInsetsValueOnly(double value, {bool left = false, bool top = false, bool right = false, bool bottom = false}) => EdgeInsets.only(
    left: left ? value : 0.0,
    top: top ? value : 0.0,
    right: right ? value : 0.0,
    bottom: bottom ? value : 0.0,
  );

  EdgeInsets _edgeInsetsValueOverwrite(double value, {double? left, double? top, double? right, double? bottom}) => EdgeInsets.only(
    left: left ?? value,
    top: top ?? value,
    right: right ?? value,
    bottom: bottom ?? value,
  );


  Widget spaceXS() => SizedBox(height: spaceXSValue, width: spaceXSValue);
  Widget spaceS() => SizedBox(height: spaceSValue, width: spaceSValue);
  Widget spaceM() => SizedBox(height: spaceMValue, width: spaceMValue);
  Widget spaceL() => SizedBox(height: spaceLValue, width: spaceLValue);
  Widget spaceXL() => SizedBox(height: spaceXLValue, width: spaceXLValue);



  BorderRadius get borderRadiusS => BorderRadius.circular(radiusS);
  BorderRadius get borderRadiusM => BorderRadius.circular(radiusM);
  BorderRadius get borderRadiusL => BorderRadius.circular(radiusL);

  BorderRadius borderRadiusSOnly({bool topLeft = false, bool topRight = false, bool bottomRight = false, bool bottomLeft = false}) => _borderRadiusValueOnly(radiusS, topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft);
  BorderRadius borderRadiusMOnly({bool topLeft = false, bool topRight = false, bool bottomRight = false, bool bottomLeft = false}) => _borderRadiusValueOnly(radiusM, topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft);
  BorderRadius borderRadiusLOnly({bool topLeft = false, bool topRight = false, bool bottomRight = false, bool bottomLeft = false}) => _borderRadiusValueOnly(radiusL, topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft);
  
  BorderRadius _borderRadiusValueOnly(double value, {bool topLeft = false, bool topRight = false, bool bottomRight = false, bool bottomLeft = false}) => BorderRadius.only(
    topLeft: Radius.circular(topLeft ? value : 0.0),
    topRight: Radius.circular(topRight ? value : 0.0),
    bottomRight: Radius.circular(bottomRight ? value : 0.0),
    bottomLeft: Radius.circular(bottomLeft ? value : 0.0),
  );
}