


// ignore_for_file: non_constant_identifier_names

part of devspace;

class DimensionsThemeData {

  const DimensionsThemeData({
    double spaceXXS = 2.0,
    double spaceXS = 3.0,
    double spaceS = 5.0,
    double spaceM = 8.0,
    double spaceL = 13.0,
    double spaceXL = 21.0,
    double spaceXXL = 34.0,
    this.radiusXS = 3.0,
    this.radiusS = 5.0,
    this.radiusM = 8.0,
    this.radiusL = 13.0,
    this.radiusXL = 21.0,
    this.listItemHeightS = 55.0,
    this.listItemHeightM = 89.0,
    this.listItemHeightL = 144.0,
    this.barHeightXS = 21.0,
    this.barHeightS = 34.0,
    this.barHeightM = 55.0,
    this.barHeightL = 89.0,
    this.barHeightXL = 144.0,
    this.lineThicknessS = 0.5,
    this.lineThicknessM = 1.0,
    this.lineThicknessL = 2.0,
    this.iconSizeXS = 13.0,
    this.iconSizeS = 21.0,
    this.iconSizeM = 34.0,
    this.iconSizeL = 55.0,
    this.iconSizeXL = 89.0,
    this.iconSizeXXL = 144.0,
  }) : 
    spaceXXSValue = spaceXXS,
    spaceXSValue = spaceXS,
    spaceSValue = spaceS,
    spaceMValue = spaceM,
    spaceLValue = spaceL,
    spaceXLValue = spaceXL,
    spaceXXLValue = spaceXXL;

  final double spaceXXSValue;
  final double spaceXSValue;
  final double spaceSValue;
  final double spaceMValue;
  final double spaceLValue;
  final double spaceXLValue;
  final double spaceXXLValue;

  final double radiusXS;
  final double radiusS;
  final double radiusM;
  final double radiusL;
  final double radiusXL;

  final listItemHeightS;
  final listItemHeightM;
  final listItemHeightL;

  final double barHeightXS;
  final double barHeightS;
  final double barHeightM;
  final double barHeightL;
  final double barHeightXL;

  final double lineThicknessS;
  final double lineThicknessM;
  final double lineThicknessL;

  final double iconSizeXS;
  final double iconSizeS;
  final double iconSizeM;
  final double iconSizeL;
  final double iconSizeXL;
  final double iconSizeXXL;

  EdgeInsets get paddingXXS => EdgeInsets.all(spaceXXSValue);
  EdgeInsets get paddingXS => EdgeInsets.all(spaceXSValue);
  EdgeInsets get paddingS => EdgeInsets.all(spaceSValue);
  EdgeInsets get paddingM => EdgeInsets.all(spaceMValue);
  EdgeInsets get paddingL => EdgeInsets.all(spaceLValue);
  EdgeInsets get paddingXL => EdgeInsets.all(spaceXLValue);
  EdgeInsets get paddingXXL => EdgeInsets.all(spaceXXLValue);


  // Special padding methods
  EdgeInsets get padding0_XXS => EdgeInsets.symmetric(horizontal: 0.0, vertical: spaceXXSValue);
  EdgeInsets get padding0_XS => EdgeInsets.symmetric(horizontal: 0.0, vertical: spaceXSValue);
  EdgeInsets get padding0_S => EdgeInsets.symmetric(horizontal: 0.0, vertical: spaceSValue);
  EdgeInsets get padding0_M => EdgeInsets.symmetric(horizontal: 0.0, vertical: spaceMValue);
  EdgeInsets get padding0_L => EdgeInsets.symmetric(horizontal: 0.0, vertical: spaceLValue);
  EdgeInsets get padding0_XL => EdgeInsets.symmetric(horizontal: 0.0, vertical: spaceXLValue);
  EdgeInsets get padding0_XXL => EdgeInsets.symmetric(horizontal: 0.0, vertical: spaceXXLValue);

  EdgeInsets get paddingXXS_0 => EdgeInsets.symmetric(horizontal: spaceXXSValue, vertical: 0.0);
  EdgeInsets get paddingXXS_XS => EdgeInsets.symmetric(horizontal: spaceXXSValue, vertical: spaceXSValue);
  EdgeInsets get paddingXXS_S => EdgeInsets.symmetric(horizontal: spaceXXSValue, vertical: spaceSValue);
  EdgeInsets get paddingXXS_M => EdgeInsets.symmetric(horizontal: spaceXXSValue, vertical: spaceMValue);
  EdgeInsets get paddingXXS_L => EdgeInsets.symmetric(horizontal: spaceXXSValue, vertical: spaceLValue);
  EdgeInsets get paddingXXS_XL => EdgeInsets.symmetric(horizontal: spaceXXSValue, vertical: spaceXLValue);
  EdgeInsets get paddingXXS_XXL => EdgeInsets.symmetric(horizontal: spaceXXSValue, vertical: spaceXXLValue);

  EdgeInsets get paddingXS_0 => EdgeInsets.symmetric(horizontal: spaceXSValue, vertical: 0.0);
  EdgeInsets get paddingXS_XXS => EdgeInsets.symmetric(horizontal: spaceXSValue, vertical: spaceXXSValue);
  EdgeInsets get paddingXS_S => EdgeInsets.symmetric(horizontal: spaceXSValue, vertical: spaceSValue);
  EdgeInsets get paddingXS_M => EdgeInsets.symmetric(horizontal: spaceXSValue, vertical: spaceMValue);
  EdgeInsets get paddingXS_L => EdgeInsets.symmetric(horizontal: spaceXSValue, vertical: spaceLValue);
  EdgeInsets get paddingXS_XL => EdgeInsets.symmetric(horizontal: spaceXSValue, vertical: spaceXLValue);
  EdgeInsets get paddingXS_XXL => EdgeInsets.symmetric(horizontal: spaceXSValue, vertical: spaceXXLValue);

  EdgeInsets get paddingS_0 => EdgeInsets.symmetric(horizontal: spaceSValue, vertical: 0.0);
  EdgeInsets get paddingS_XXS => EdgeInsets.symmetric(horizontal: spaceSValue, vertical: spaceXXSValue);
  EdgeInsets get paddingS_XS => EdgeInsets.symmetric(horizontal: spaceSValue, vertical: spaceXSValue);
  EdgeInsets get paddingS_M => EdgeInsets.symmetric(horizontal: spaceSValue, vertical: spaceMValue);
  EdgeInsets get paddingS_L => EdgeInsets.symmetric(horizontal: spaceSValue, vertical: spaceLValue);
  EdgeInsets get paddingS_XL => EdgeInsets.symmetric(horizontal: spaceSValue, vertical: spaceXLValue);
  EdgeInsets get paddingS_XXL => EdgeInsets.symmetric(horizontal: spaceSValue, vertical: spaceXXLValue);

  EdgeInsets get paddingM_0 => EdgeInsets.symmetric(horizontal: spaceMValue, vertical: 0.0);
  EdgeInsets get paddingM_XXS => EdgeInsets.symmetric(horizontal: spaceMValue, vertical: spaceXXSValue);
  EdgeInsets get paddingM_XS => EdgeInsets.symmetric(horizontal: spaceMValue, vertical: spaceXSValue);
  EdgeInsets get paddingM_S => EdgeInsets.symmetric(horizontal: spaceMValue, vertical: spaceSValue);
  EdgeInsets get paddingM_L => EdgeInsets.symmetric(horizontal: spaceMValue, vertical: spaceLValue);
  EdgeInsets get paddingM_XL => EdgeInsets.symmetric(horizontal: spaceMValue, vertical: spaceXLValue);
  EdgeInsets get paddingM_XXL => EdgeInsets.symmetric(horizontal: spaceMValue, vertical: spaceXXLValue);

  EdgeInsets get paddingL_0 => EdgeInsets.symmetric(horizontal: spaceLValue, vertical: 0.0);
  EdgeInsets get paddingL_XXS => EdgeInsets.symmetric(horizontal: spaceLValue, vertical: spaceXXSValue);
  EdgeInsets get paddingL_XS => EdgeInsets.symmetric(horizontal: spaceLValue, vertical: spaceXSValue);
  EdgeInsets get paddingL_S => EdgeInsets.symmetric(horizontal: spaceLValue, vertical: spaceSValue);
  EdgeInsets get paddingL_M => EdgeInsets.symmetric(horizontal: spaceLValue, vertical: spaceMValue);
  EdgeInsets get paddingL_XL => EdgeInsets.symmetric(horizontal: spaceLValue, vertical: spaceXLValue);
  EdgeInsets get paddingL_XXL => EdgeInsets.symmetric(horizontal: spaceLValue, vertical: spaceXXLValue);

  EdgeInsets get paddingXL_0 => EdgeInsets.symmetric(horizontal: spaceXLValue, vertical: 0.0);
  EdgeInsets get paddingXL_XXS => EdgeInsets.symmetric(horizontal: spaceXLValue, vertical: spaceXXSValue);
  EdgeInsets get paddingXL_XS => EdgeInsets.symmetric(horizontal: spaceXLValue, vertical: spaceXSValue);
  EdgeInsets get paddingXL_S => EdgeInsets.symmetric(horizontal: spaceXLValue, vertical: spaceSValue);
  EdgeInsets get paddingXL_M => EdgeInsets.symmetric(horizontal: spaceXLValue, vertical: spaceMValue);
  EdgeInsets get paddingXL_L => EdgeInsets.symmetric(horizontal: spaceXLValue, vertical: spaceLValue);
  EdgeInsets get paddingXL_XXL => EdgeInsets.symmetric(horizontal: spaceXLValue, vertical: spaceXXLValue);

  EdgeInsets get paddingXXL_0 => EdgeInsets.symmetric(horizontal: spaceXXLValue, vertical: 0.0);
  EdgeInsets get paddingXXL_XXS => EdgeInsets.symmetric(horizontal: spaceXXLValue, vertical: spaceXXSValue);
  EdgeInsets get paddingXXL_XS => EdgeInsets.symmetric(horizontal: spaceXXLValue, vertical: spaceXSValue);
  EdgeInsets get paddingXXL_S => EdgeInsets.symmetric(horizontal: spaceXXLValue, vertical: spaceSValue);
  EdgeInsets get paddingXXL_M => EdgeInsets.symmetric(horizontal: spaceXXLValue, vertical: spaceMValue);
  EdgeInsets get paddingXXL_L => EdgeInsets.symmetric(horizontal: spaceXXLValue, vertical: spaceLValue);
  EdgeInsets get paddingXXL_XL => EdgeInsets.symmetric(horizontal: spaceXXLValue, vertical: spaceXLValue);



  EdgeInsets paddingXXSOnly({bool left = false, bool top = false, bool right = false, bool bottom = false}) => _edgeInsetsValueOnly(spaceXXSValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingXSOnly({bool left = false, bool top = false, bool right = false, bool bottom = false}) => _edgeInsetsValueOnly(spaceXSValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingSOnly({bool left = false, bool top = false, bool right = false, bool bottom = false}) => _edgeInsetsValueOnly(spaceSValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingMOnly({bool left = false, bool top = false, bool right = false, bool bottom = false}) => _edgeInsetsValueOnly(spaceMValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingLOnly({bool left = false, bool top = false, bool right = false, bool bottom = false}) => _edgeInsetsValueOnly(spaceLValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingXLOnly({bool left = false, bool top = false, bool right = false, bool bottom = false}) => _edgeInsetsValueOnly(spaceXLValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingXXLOnly({bool left = false, bool top = false, bool right = false, bool bottom = false}) => _edgeInsetsValueOnly(spaceXXLValue, left: left, top: top, right: right, bottom: bottom);

  EdgeInsets paddingXXSOverwrite({double? left, double? top, double? right, double? bottom}) => _edgeInsetsValueOverwrite(spaceXXSValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingXSOverwrite({double? left, double? top, double? right, double? bottom}) => _edgeInsetsValueOverwrite(spaceXSValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingSOverwrite({double? left, double? top, double? right, double? bottom}) => _edgeInsetsValueOverwrite(spaceSValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingMOverwrite({double? left, double? top, double? right, double? bottom}) => _edgeInsetsValueOverwrite(spaceMValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingLOverwrite({double? left, double? top, double? right, double? bottom}) => _edgeInsetsValueOverwrite(spaceLValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingXLOverwrite({double? left, double? top, double? right, double? bottom}) => _edgeInsetsValueOverwrite(spaceXLValue, left: left, top: top, right: right, bottom: bottom);
  EdgeInsets paddingXXLOverwrite({double? left, double? top, double? right, double? bottom}) => _edgeInsetsValueOverwrite(spaceXXLValue, left: left, top: top, right: right, bottom: bottom);

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


  Widget spaceXXS() => SizedBox(height: spaceXXSValue, width: spaceXXSValue);
  Widget spaceXS() => SizedBox(height: spaceXSValue, width: spaceXSValue);
  Widget spaceS() => SizedBox(height: spaceSValue, width: spaceSValue);
  Widget spaceM() => SizedBox(height: spaceMValue, width: spaceMValue);
  Widget spaceL() => SizedBox(height: spaceLValue, width: spaceLValue);
  Widget spaceXL() => SizedBox(height: spaceXLValue, width: spaceXLValue);
  Widget spaceXXL() => SizedBox(height: spaceXXLValue, width: spaceXXLValue);


  BorderRadius get borderRadiusXS => BorderRadius.circular(radiusXS);
  BorderRadius get borderRadiusS => BorderRadius.circular(radiusS);
  BorderRadius get borderRadiusM => BorderRadius.circular(radiusM);
  BorderRadius get borderRadiusL => BorderRadius.circular(radiusL);
  BorderRadius get borderRadiusXL => BorderRadius.circular(radiusXL);

  BorderRadius borderRadiusXSOnly({bool topLeft = false, bool topRight = false, bool bottomRight = false, bool bottomLeft = false}) => _borderRadiusValueOnly(radiusXS, topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft);
  BorderRadius borderRadiusSOnly({bool topLeft = false, bool topRight = false, bool bottomRight = false, bool bottomLeft = false}) => _borderRadiusValueOnly(radiusS, topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft);
  BorderRadius borderRadiusMOnly({bool topLeft = false, bool topRight = false, bool bottomRight = false, bool bottomLeft = false}) => _borderRadiusValueOnly(radiusM, topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft);
  BorderRadius borderRadiusLOnly({bool topLeft = false, bool topRight = false, bool bottomRight = false, bool bottomLeft = false}) => _borderRadiusValueOnly(radiusL, topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft);
  BorderRadius borderRadiusXLOnly({bool topLeft = false, bool topRight = false, bool bottomRight = false, bool bottomLeft = false}) => _borderRadiusValueOnly(radiusXL, topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft);
  
  BorderRadius _borderRadiusValueOnly(double value, {bool topLeft = false, bool topRight = false, bool bottomRight = false, bool bottomLeft = false}) => BorderRadius.only(
    topLeft: Radius.circular(topLeft ? value : 0.0),
    topRight: Radius.circular(topRight ? value : 0.0),
    bottomRight: Radius.circular(bottomRight ? value : 0.0),
    bottomLeft: Radius.circular(bottomLeft ? value : 0.0),
  );
}