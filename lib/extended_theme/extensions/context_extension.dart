


// ignore_for_file: non_constant_identifier_names

part of devspace;

const double _tabletSmallestWidthThreshold = 600.0;

extension ContextExtension on BuildContext {

  HighlightsThemeData get highlights => Theme.of(this).extension<GalaxyThemeData>()?.highlights ?? const HighlightsThemeData();
  DimensionsThemeData get dimensions => Theme.of(this).extension<GalaxyThemeData>()?.dimensions ?? const DimensionsThemeData();
  AnimationsThemeData get animations => Theme.of(this).extension<GalaxyThemeData>()?.animations ?? const AnimationsThemeData();
  TextTheme get text => Theme.of(this).textTheme;
  ColorsAccess get colors => ColorsAccess(context: this);

  EdgeInsets get paddingXXS => dimensions.paddingXXS;
  EdgeInsets get paddingXS => dimensions.paddingXS;
  EdgeInsets get paddingS => dimensions.paddingS;
  EdgeInsets get paddingM => dimensions.paddingM;
  EdgeInsets get paddingL => dimensions.paddingL;
  EdgeInsets get paddingXL => dimensions.paddingXL;
  EdgeInsets get paddingXXL => dimensions.paddingXXL;

  // Special padding methods
  EdgeInsets get padding0_XXS => dimensions.padding0_XXS;
  EdgeInsets get padding0_XS => dimensions.padding0_XS;
  EdgeInsets get padding0_S => dimensions.padding0_S;
  EdgeInsets get padding0_M => dimensions.padding0_M;
  EdgeInsets get padding0_L => dimensions.padding0_L;
  EdgeInsets get padding0_XL => dimensions.padding0_XL;
  EdgeInsets get padding0_XXL => dimensions.padding0_XXL;

  EdgeInsets get paddingXXS_0 => dimensions.paddingXXS_0;
  EdgeInsets get paddingXXS_XS => dimensions.paddingXXS_XS;
  EdgeInsets get paddingXXS_S => dimensions.paddingXXS_S;
  EdgeInsets get paddingXXS_M => dimensions.paddingXXS_M;
  EdgeInsets get paddingXXS_L => dimensions.paddingXXS_L;
  EdgeInsets get paddingXXS_XL => dimensions.paddingXXS_XL;
  EdgeInsets get paddingXXS_XXL => dimensions.paddingXXS_XXL;

  EdgeInsets get paddingXS_0 => dimensions.paddingXS_0;
  EdgeInsets get paddingXS_XXS => dimensions.paddingXS_XXS;
  EdgeInsets get paddingXS_S => dimensions.paddingXS_S;
  EdgeInsets get paddingXS_M => dimensions.paddingXS_M;
  EdgeInsets get paddingXS_L => dimensions.paddingXS_L;
  EdgeInsets get paddingXS_XL => dimensions.paddingXS_XL;
  EdgeInsets get paddingXS_XXL => dimensions.paddingXS_XXL;

  EdgeInsets get paddingS_0 => dimensions.paddingS_0;
  EdgeInsets get paddingS_XXS => dimensions.paddingS_XXS;
  EdgeInsets get paddingS_XS => dimensions.paddingS_XS;
  EdgeInsets get paddingS_M => dimensions.paddingS_M;
  EdgeInsets get paddingS_L => dimensions.paddingS_L;
  EdgeInsets get paddingS_XL => dimensions.paddingS_XL;
  EdgeInsets get paddingS_XXL => dimensions.paddingS_XXL;

  EdgeInsets get paddingM_0 => dimensions.paddingM_0;
  EdgeInsets get paddingM_XXS => dimensions.paddingM_XXS;
  EdgeInsets get paddingM_XS => dimensions.paddingM_XS;
  EdgeInsets get paddingM_S => dimensions.paddingM_S;
  EdgeInsets get paddingM_L => dimensions.paddingM_L;
  EdgeInsets get paddingM_XL => dimensions.paddingM_XL;
  EdgeInsets get paddingM_XXL => dimensions.paddingM_XXL;

  EdgeInsets get paddingL_0 => dimensions.paddingL_0;
  EdgeInsets get paddingL_XXS => dimensions.paddingL_XXS;
  EdgeInsets get paddingL_XS => dimensions.paddingL_XS;
  EdgeInsets get paddingL_S => dimensions.paddingL_S;
  EdgeInsets get paddingL_M => dimensions.paddingL_M;
  EdgeInsets get paddingL_XL => dimensions.paddingL_XL;
  EdgeInsets get paddingL_XXL => dimensions.paddingL_XXL;

  EdgeInsets get paddingXL_0 => dimensions.paddingXL_0;
  EdgeInsets get paddingXL_XXS => dimensions.paddingXL_XXS;
  EdgeInsets get paddingXL_XS => dimensions.paddingXL_XS;
  EdgeInsets get paddingXL_S => dimensions.paddingXL_S;
  EdgeInsets get paddingXL_M => dimensions.paddingXL_M;
  EdgeInsets get paddingXL_L => dimensions.paddingXL_L;
  EdgeInsets get paddingXL_XXL => dimensions.paddingXL_XXL;

  EdgeInsets get paddingXXL_0 => dimensions.paddingXXL_0;
  EdgeInsets get paddingXXL_XXS => dimensions.paddingXXL_XXS;
  EdgeInsets get paddingXXL_XS => dimensions.paddingXXL_XS;
  EdgeInsets get paddingXXL_S => dimensions.paddingXXL_S;
  EdgeInsets get paddingXXL_M => dimensions.paddingXXL_M;
  EdgeInsets get paddingXXL_L => dimensions.paddingXXL_L;
  EdgeInsets get paddingXXL_XL => dimensions.paddingXXL_XL;

  Widget get spaceXXS => dimensions.spaceXXS();
  Widget get spaceXS => dimensions.spaceXS();
  Widget get spaceS => dimensions.spaceS();
  Widget get spaceM => dimensions.spaceM();
  Widget get spaceL => dimensions.spaceL();
  Widget get spaceXL => dimensions.spaceXL();
  Widget get spaceXXL => dimensions.spaceXXL();



  String? getQueryParam(String key)
  {
    return GoRouterState.of(this).uri.queryParameters[key];
  }

  String? getPathParam(String key)
  {
    return GoRouterState.of(this).pathParameters[key];
  }

  bool get isDarkMode => MediaQuery.of(this).platformBrightness == Brightness.dark;

  Size get screenSize => MediaQuery.of(this).size;

  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  bool get isWeb => kIsWeb;
  
  bool get isDesktop => isDesktopApp || isDesktopWeb;
  bool get isDesktopApp => !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
  bool get isDesktopWeb => kIsWeb && (defaultTargetPlatform == TargetPlatform.macOS || defaultTargetPlatform == TargetPlatform.windows || defaultTargetPlatform == TargetPlatform.linux);

  bool get isTablet => isTabletApp || isTabletWeb;
  bool get isTabletApp => !kIsWeb && (Platform.isIOS || Platform.isAndroid) && MediaQuery.of(this).size.shortestSide >= _tabletSmallestWidthThreshold;
  bool get isTabletWeb => kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) && MediaQuery.of(this).size.shortestSide >= _tabletSmallestWidthThreshold;

  bool get isPhone => isPhoneApp || isPhoneWeb;
  bool get isPhoneApp => !kIsWeb && (Platform.isIOS || Platform.isAndroid) && MediaQuery.of(this).size.shortestSide < _tabletSmallestWidthThreshold;
  bool get isPhoneWeb => kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) && MediaQuery.of(this).size.shortestSide < _tabletSmallestWidthThreshold;


  bool get isPhoneSmall => isPhone &&  MediaQuery.of(this).size.shortestSide < 350.0;


  bool get isPortableDevice => isPortableDeviceApp || isPortableDeviceWeb;
  bool get isPortableDeviceApp => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
  bool get isPortableDeviceWeb => kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);

}