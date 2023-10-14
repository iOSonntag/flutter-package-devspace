


// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:iosite/_packages/extended_theme/dimensions_theme_data.dart';
import 'package:iosite/_packages/extended_theme/highlights_theme_data.dart';
import 'package:iosite/_packages/extended_theme/theme_data_extension.dart';

extension ContextExtension on BuildContext {

  HighlightsThemeData get highlights => Theme.of(this).highlights;
  DimensionsThemeData get dimensions => Theme.of(this).dimensions;


  EdgeInsets get paddingXS => Theme.of(this).dimensions.paddingXS;
  EdgeInsets get paddingS => Theme.of(this).dimensions.paddingS;
  EdgeInsets get paddingM => Theme.of(this).dimensions.paddingM;
  EdgeInsets get paddingL => Theme.of(this).dimensions.paddingL;
  EdgeInsets get paddingXL => Theme.of(this).dimensions.paddingXL;

  EdgeInsets get paddingXS_S => Theme.of(this).dimensions.paddingXS_S;
  EdgeInsets get paddingXS_M => Theme.of(this).dimensions.paddingXS_M;
  EdgeInsets get paddingXS_L => Theme.of(this).dimensions.paddingXS_L;
  EdgeInsets get paddingXS_XL => Theme.of(this).dimensions.paddingXS_XL;

  EdgeInsets get paddingS_XS => Theme.of(this).dimensions.paddingS_XS;
  EdgeInsets get paddingS_M => Theme.of(this).dimensions.paddingS_M;
  EdgeInsets get paddingS_L => Theme.of(this).dimensions.paddingS_L;
  EdgeInsets get paddingS_XL => Theme.of(this).dimensions.paddingS_XL;

  EdgeInsets get paddingM_XS => Theme.of(this).dimensions.paddingM_XS;
  EdgeInsets get paddingM_S => Theme.of(this).dimensions.paddingM_S;
  EdgeInsets get paddingM_L => Theme.of(this).dimensions.paddingM_L;
  EdgeInsets get paddingM_XL => Theme.of(this).dimensions.paddingM_XL;

  EdgeInsets get paddingL_XS => Theme.of(this).dimensions.paddingL_XS;
  EdgeInsets get paddingL_S => Theme.of(this).dimensions.paddingL_S;
  EdgeInsets get paddingL_M => Theme.of(this).dimensions.paddingL_M;
  EdgeInsets get paddingL_XL => Theme.of(this).dimensions.paddingL_XL;

  EdgeInsets get paddingXL_XS => Theme.of(this).dimensions.paddingXL_XS;
  EdgeInsets get paddingXL_S => Theme.of(this).dimensions.paddingXL_S;
  EdgeInsets get paddingXL_M => Theme.of(this).dimensions.paddingXL_M;
  EdgeInsets get paddingXL_L => Theme.of(this).dimensions.paddingXL_L;

  Widget get spaceXS => Theme.of(this).dimensions.spaceXS();
  Widget get spaceS => Theme.of(this).dimensions.spaceS();
  Widget get spaceM => Theme.of(this).dimensions.spaceM();
  Widget get spaceL => Theme.of(this).dimensions.spaceL();
  Widget get spaceXL => Theme.of(this).dimensions.spaceXL();


}