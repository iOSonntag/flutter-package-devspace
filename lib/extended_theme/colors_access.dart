



part of devspace;

class ColorsAccess  {

  final BuildContext context;

  const ColorsAccess({
    required this.context
  });

  Color get background => Theme.of(context).extension<AdditionalColorsThemeData>()?.background ?? AdditionalColorsDefaults.background;
  Color get onBackground => Theme.of(context).extension<AdditionalColorsThemeData>()?.onBackground ?? AdditionalColorsDefaults.onBackground;
  Color get onBackgroundLessFocus => Theme.of(context).extension<AdditionalColorsThemeData>()?.onBackgroundLessFocus ?? AdditionalColorsDefaults.onBackgroundLessFocus;
  Color get onBackgroundLeastFocus => Theme.of(context).extension<AdditionalColorsThemeData>()?.onBackgroundLeastFocus ?? AdditionalColorsDefaults.onBackgroundLeastFocus;
  Color get onSurfaceLessFocus => Theme.of(context).extension<AdditionalColorsThemeData>()?.onSurfaceLessFocus ?? AdditionalColorsDefaults.onSurfaceLessFocus;
  Color get onSurfaceLeastFocus => Theme.of(context).extension<AdditionalColorsThemeData>()?.onSurfaceLeastFocus ?? AdditionalColorsDefaults.onSurfaceLeastFocus;
  Color get onPrimaryLessFocus => Theme.of(context).extension<AdditionalColorsThemeData>()?.onPrimaryLessFocus ?? AdditionalColorsDefaults.onPrimaryLessFocus;
  Color get success => Theme.of(context).extension<AdditionalColorsThemeData>()?.success ?? AdditionalColorsDefaults.success;
  Color get onSuccess => Theme.of(context).extension<AdditionalColorsThemeData>()?.onSuccess ?? AdditionalColorsDefaults.onSuccess;
  Color get warning => Theme.of(context).extension<AdditionalColorsThemeData>()?.warning ?? AdditionalColorsDefaults.warning;
  Color get onWarning => Theme.of(context).extension<AdditionalColorsThemeData>()?.onWarning ?? AdditionalColorsDefaults.onWarning;
  Color get congratulations => Theme.of(context).extension<AdditionalColorsThemeData>()?.congratulations ?? AdditionalColorsDefaults.congratulations;
  Color get onCongratulations => Theme.of(context).extension<AdditionalColorsThemeData>()?.onCongratulations ?? AdditionalColorsDefaults.onCongratulations;

  Color get destructive => error;
  Color get onDestructive => onError;

  Brightness get brightness => Theme.of(context).colorScheme.brightness;
  Color get primary => Theme.of(context).colorScheme.primary;
  Color get onPrimary => Theme.of(context).colorScheme.onPrimary;
  Color get primaryContainer => Theme.of(context).colorScheme.primaryContainer;
  Color get onPrimaryContainer => Theme.of(context).colorScheme.onPrimaryContainer;
  Color get secondary => Theme.of(context).colorScheme.secondary;
  Color get onSecondary => Theme.of(context).colorScheme.onSecondary;
  Color get secondaryContainer => Theme.of(context).colorScheme.secondaryContainer;
  Color get onSecondaryContainer => Theme.of(context).colorScheme.onSecondaryContainer;
  Color get tertiary => Theme.of(context).colorScheme.tertiary;
  Color get onTertiary => Theme.of(context).colorScheme.onTertiary;
  Color get tertiaryContainer => Theme.of(context).colorScheme.tertiaryContainer;
  Color get onTertiaryContainer => Theme.of(context).colorScheme.onTertiaryContainer;
  Color get error => Theme.of(context).colorScheme.error;
  Color get onError => Theme.of(context).colorScheme.onError;
  Color get errorContainer => Theme.of(context).colorScheme.errorContainer;
  Color get onErrorContainer => Theme.of(context).colorScheme.onErrorContainer;
  Color get surface => Theme.of(context).colorScheme.surface;
  Color get onSurface => Theme.of(context).colorScheme.onSurface;
  Color get outline => Theme.of(context).colorScheme.outline;
  Color get outlineVariant => Theme.of(context).colorScheme.outlineVariant;
  Color get shadow => Theme.of(context).colorScheme.shadow;
  Color get scrim => Theme.of(context).colorScheme.scrim;
  Color get inverseSurface => Theme.of(context).colorScheme.inverseSurface;
  Color get onInverseSurface => Theme.of(context).colorScheme.onInverseSurface;
  Color get inversePrimary => Theme.of(context).colorScheme.inversePrimary;
  Color get surfaceTint => Theme.of(context).colorScheme.surfaceTint;
  
  


}