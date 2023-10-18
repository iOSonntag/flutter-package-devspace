



part of devspace;

class ColorsAccess  {

  final BuildContext context;

  const ColorsAccess({
    required this.context
  });

  Color get onBackgroundLessFocus => Theme.of(context).extension<AdditionalColorsThemeData>()?.onBackgroundLessFocus ?? AdditionalColorsDefaults.onBackgroundLessFocus;
  Color get onBackgroundLeastFocus => Theme.of(context).extension<AdditionalColorsThemeData>()?.onBackgroundLeastFocus ?? AdditionalColorsDefaults.onBackgroundLeastFocus;
  Color get success => Theme.of(context).extension<AdditionalColorsThemeData>()?.success ?? AdditionalColorsDefaults.success;
  Color get onSuccess => Theme.of(context).extension<AdditionalColorsThemeData>()?.onSuccess ?? AdditionalColorsDefaults.onSuccess;
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
  Color get background => Theme.of(context).colorScheme.background;
  Color get onBackground => Theme.of(context).colorScheme.onBackground;
  Color get surface => Theme.of(context).colorScheme.surface;
  Color get onSurface => Theme.of(context).colorScheme.onSurface;
  Color get surfaceVariant => Theme.of(context).colorScheme.surfaceVariant;
  Color get onSurfaceVariant => Theme.of(context).colorScheme.onSurfaceVariant;
  Color get outline => Theme.of(context).colorScheme.outline;
  Color get outlineVariant => Theme.of(context).colorScheme.outlineVariant;
  Color get shadow => Theme.of(context).colorScheme.shadow;
  Color get scrim => Theme.of(context).colorScheme.scrim;
  Color get inverseSurface => Theme.of(context).colorScheme.inverseSurface;
  Color get onInverseSurface => Theme.of(context).colorScheme.onInverseSurface;
  Color get inversePrimary => Theme.of(context).colorScheme.inversePrimary;
  Color get surfaceTint => Theme.of(context).colorScheme.surfaceTint;
  
  


}