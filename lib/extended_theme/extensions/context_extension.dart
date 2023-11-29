


// ignore_for_file: non_constant_identifier_names

part of devspace;

// TODO: check correct value
// const double _mobileThreshold = 600.0;
const double _mobileThreshold = 850.0;

// const double _tabletThreshold = 950.0;
const double _tabletThreshold = 1100.0;
extension ContextExtension on BuildContext {

  HighlightsThemeData get highlights => Theme.of(this).highlights;
  DimensionsThemeData get dimensions => Theme.of(this).dimensions;
  AnimationsThemeData get animations => Theme.of(this).animations;
  TextTheme get text => Theme.of(this).textTheme;
  ColorsAccess get colors => ColorsAccess(context: this);

  EdgeInsets get paddingXXS => Theme.of(this).dimensions.paddingXXS;
  EdgeInsets get paddingXS => Theme.of(this).dimensions.paddingXS;
  EdgeInsets get paddingS => Theme.of(this).dimensions.paddingS;
  EdgeInsets get paddingM => Theme.of(this).dimensions.paddingM;
  EdgeInsets get paddingL => Theme.of(this).dimensions.paddingL;
  EdgeInsets get paddingXL => Theme.of(this).dimensions.paddingXL;
  EdgeInsets get paddingXXL => Theme.of(this).dimensions.paddingXXL;

  // Special padding methods
  EdgeInsets get padding0_XXS => Theme.of(this).dimensions.padding0_XXS;
  EdgeInsets get padding0_XS => Theme.of(this).dimensions.padding0_XS;
  EdgeInsets get padding0_S => Theme.of(this).dimensions.padding0_S;
  EdgeInsets get padding0_M => Theme.of(this).dimensions.padding0_M;
  EdgeInsets get padding0_L => Theme.of(this).dimensions.padding0_L;
  EdgeInsets get padding0_XL => Theme.of(this).dimensions.padding0_XL;
  EdgeInsets get padding0_XXL => Theme.of(this).dimensions.padding0_XXL;

  EdgeInsets get paddingXXS_0 => Theme.of(this).dimensions.paddingXXS_0;
  EdgeInsets get paddingXXS_XS => Theme.of(this).dimensions.paddingXXS_XS;
  EdgeInsets get paddingXXS_S => Theme.of(this).dimensions.paddingXXS_S;
  EdgeInsets get paddingXXS_M => Theme.of(this).dimensions.paddingXXS_M;
  EdgeInsets get paddingXXS_L => Theme.of(this).dimensions.paddingXXS_L;
  EdgeInsets get paddingXXS_XL => Theme.of(this).dimensions.paddingXXS_XL;
  EdgeInsets get paddingXXS_XXL => Theme.of(this).dimensions.paddingXXS_XXL;

  EdgeInsets get paddingXS_0 => Theme.of(this).dimensions.paddingXS_0;
  EdgeInsets get paddingXS_XXS => Theme.of(this).dimensions.paddingXS_XXS;
  EdgeInsets get paddingXS_S => Theme.of(this).dimensions.paddingXS_S;
  EdgeInsets get paddingXS_M => Theme.of(this).dimensions.paddingXS_M;
  EdgeInsets get paddingXS_L => Theme.of(this).dimensions.paddingXS_L;
  EdgeInsets get paddingXS_XL => Theme.of(this).dimensions.paddingXS_XL;
  EdgeInsets get paddingXS_XXL => Theme.of(this).dimensions.paddingXS_XXL;

  EdgeInsets get paddingS_0 => Theme.of(this).dimensions.paddingS_0;
  EdgeInsets get paddingS_XXS => Theme.of(this).dimensions.paddingS_XXS;
  EdgeInsets get paddingS_XS => Theme.of(this).dimensions.paddingS_XS;
  EdgeInsets get paddingS_M => Theme.of(this).dimensions.paddingS_M;
  EdgeInsets get paddingS_L => Theme.of(this).dimensions.paddingS_L;
  EdgeInsets get paddingS_XL => Theme.of(this).dimensions.paddingS_XL;
  EdgeInsets get paddingS_XXL => Theme.of(this).dimensions.paddingS_XXL;

  EdgeInsets get paddingM_0 => Theme.of(this).dimensions.paddingM_0;
  EdgeInsets get paddingM_XXS => Theme.of(this).dimensions.paddingM_XXS;
  EdgeInsets get paddingM_XS => Theme.of(this).dimensions.paddingM_XS;
  EdgeInsets get paddingM_S => Theme.of(this).dimensions.paddingM_S;
  EdgeInsets get paddingM_L => Theme.of(this).dimensions.paddingM_L;
  EdgeInsets get paddingM_XL => Theme.of(this).dimensions.paddingM_XL;
  EdgeInsets get paddingM_XXL => Theme.of(this).dimensions.paddingM_XXL;

  EdgeInsets get paddingL_0 => Theme.of(this).dimensions.paddingL_0;
  EdgeInsets get paddingL_XXS => Theme.of(this).dimensions.paddingL_XXS;
  EdgeInsets get paddingL_XS => Theme.of(this).dimensions.paddingL_XS;
  EdgeInsets get paddingL_S => Theme.of(this).dimensions.paddingL_S;
  EdgeInsets get paddingL_M => Theme.of(this).dimensions.paddingL_M;
  EdgeInsets get paddingL_XL => Theme.of(this).dimensions.paddingL_XL;
  EdgeInsets get paddingL_XXL => Theme.of(this).dimensions.paddingL_XXL;

  EdgeInsets get paddingXL_0 => Theme.of(this).dimensions.paddingXL_0;
  EdgeInsets get paddingXL_XXS => Theme.of(this).dimensions.paddingXL_XXS;
  EdgeInsets get paddingXL_XS => Theme.of(this).dimensions.paddingXL_XS;
  EdgeInsets get paddingXL_S => Theme.of(this).dimensions.paddingXL_S;
  EdgeInsets get paddingXL_M => Theme.of(this).dimensions.paddingXL_M;
  EdgeInsets get paddingXL_L => Theme.of(this).dimensions.paddingXL_L;
  EdgeInsets get paddingXL_XXL => Theme.of(this).dimensions.paddingXL_XXL;

  EdgeInsets get paddingXXL_0 => Theme.of(this).dimensions.paddingXXL_0;
  EdgeInsets get paddingXXL_XXS => Theme.of(this).dimensions.paddingXXL_XXS;
  EdgeInsets get paddingXXL_XS => Theme.of(this).dimensions.paddingXXL_XS;
  EdgeInsets get paddingXXL_S => Theme.of(this).dimensions.paddingXXL_S;
  EdgeInsets get paddingXXL_M => Theme.of(this).dimensions.paddingXXL_M;
  EdgeInsets get paddingXXL_L => Theme.of(this).dimensions.paddingXXL_L;
  EdgeInsets get paddingXXL_XL => Theme.of(this).dimensions.paddingXXL_XL;

  Widget get spaceXXS => Theme.of(this).dimensions.spaceXXS();
  Widget get spaceXS => Theme.of(this).dimensions.spaceXS();
  Widget get spaceS => Theme.of(this).dimensions.spaceS();
  Widget get spaceM => Theme.of(this).dimensions.spaceM();
  Widget get spaceL => Theme.of(this).dimensions.spaceL();
  Widget get spaceXL => Theme.of(this).dimensions.spaceXL();
  Widget get spaceXXL => Theme.of(this).dimensions.spaceXXL();

  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  bool get isPhone
  {
    MediaQueryData mediaQuery = MediaQuery.of(this);
    double width = mediaQuery.size.width;
    double height = mediaQuery.size.height;

    if (isPortrait)
    {
      if (width < _mobileThreshold) 
      {
        return true;
      }
    } 
    
    if (height < _mobileThreshold) 
    {
      return true;
    }
    
    return false;
  }

  bool get isTablet
  {
    MediaQueryData mediaQuery = MediaQuery.of(this);
    double width = mediaQuery.size.width;
    double height = mediaQuery.size.height;

    if (isPortrait)
    {
      if (width >= _mobileThreshold && width < _tabletThreshold) 
      {
        return true;
      }
    } 
    
    if (height >= _mobileThreshold && height < _tabletThreshold) 
    {
      return true;
    }
    
    return false;
  }

  bool get isPhoneApp
  {
    return !kIsWeb && isPhone;
  }

  bool get isPhoneWeb
  {
    return kIsWeb && isPhone;
  }
  
  bool get isTabletApp
  {
    return !kIsWeb && isTablet;
  }

  bool get isTabletWeb
  {
    return kIsWeb && isTablet;
  }

  bool get isWeb
  {
    return kIsWeb;
  }
  
  bool get isDesktop
  {
    return Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  }





  

}