part of devspace;




typedef CreateRouterConfig<T> = RouterConfig<Object> Function(BuildContext context, GlobalKey<NavigatorState> rootNavigatorKey, T loadedData);



class _GeneratedAppData {

  final RouterConfig<Object> routerConfig;
  final List<Glue<GlueComponent>> globalGlues;

  const _GeneratedAppData({
    required this.routerConfig,
    required this.globalGlues,
  });
}

typedef CreateGlobalGluesFunction<T> = List<Glue<GlueComponent>> Function(T loadedData);

class App<T> extends StatelessWidget {

  static GalaxyConfig? _config;
  static GalaxyConfig get config => App._config ?? (throw Exception('App.config is not set. Are you accessing it before the App is built?'));

  final GalaxyConfig configuration;
  final StringBuilder buildTitle;
  final ThemeBuilder buildTheme;
  final String translationsFolder;
  final Locale fallbackLocale;
  final List<Locale> supportedLocales;
  // ignore: non_constant_identifier_names
  final CreateGlobalGluesFunction<T> onPostLoad_createGlobalGlues;
  final AppLoadFunction<T> loadApp;
  final CreateRouterConfig<T> createRouterConfig;

  static final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get rootNavigationContext
  {
    final BuildContext? context = rootNavigatorKey.currentContext;

    if (context == null)
    {
      throw Exception('rootNavigatorKey.currentContext is null. Are you accessing App.rootContext before the App is built?');
    }

    return context;
  }

  static Locale get currentLocale
  {
    return Localizations.localeOf(App.rootNavigationContext);
  }

  App({
    super.key,
    required this.configuration,
    required this.buildTitle,
    required this.buildTheme,
    this.translationsFolder = 'assets/translations',
    this.fallbackLocale = const Locale('en', 'US'),
    required this.supportedLocales,
    // ignore: non_constant_identifier_names
    required this.onPostLoad_createGlobalGlues,
    required this.loadApp,
    required this.createRouterConfig,
  })
  {
    App._config = configuration;
  }

  @override
  Widget build(BuildContext context)
  {
    return AppLoader<_GeneratedAppData>(
      loadApp: _loadApp,
      buildApp: (context, data) => _AppWidget(
        buildTitle: buildTitle,
        buildTheme: buildTheme,
        generatedData: data,
        translationsFolder: translationsFolder,
        fallbackLocale: fallbackLocale,
        supportedLocales: supportedLocales,
        globalGlues: data!.globalGlues,
      ),
    );
  }

  Future<_GeneratedAppData?> _loadApp(BuildContext context) async
  {


    WidgetsFlutterBinding.ensureInitialized();



    await EasyLocalization.ensureInitialized();

    if (!context.mounted) return null;

    final appLoadResult = await loadApp(context);

    await MyService.ensureAllReady();

    if (!context.mounted) return null;

    return _GeneratedAppData(
      routerConfig: createRouterConfig(context, rootNavigatorKey, appLoadResult),
      globalGlues: onPostLoad_createGlobalGlues(appLoadResult),
    );
    
  }
}





class _AppWidget extends StatelessWidget {

  final StringBuilder buildTitle;
  final ThemeBuilder buildTheme;
  final _GeneratedAppData? generatedData;
  final String translationsFolder;
  final Locale fallbackLocale;
  final List<Locale> supportedLocales;
  final List<Glue<GlueComponent>> globalGlues;

  _AppWidget({
    required this.buildTitle,
    required this.buildTheme,
    required this.generatedData,
    required this.translationsFolder,
    required this.fallbackLocale,
    required this.supportedLocales,
    required this.globalGlues,
  });

  final Key _keyGlues = GlobalKey();
  // final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context)
  {
    return EasyLocalization(
      path: translationsFolder,
      supportedLocales: supportedLocales,
      fallbackLocale: fallbackLocale,
      child: InsertGlues(
        key: _keyGlues,
        glues: globalGlues,
        child: Builder(builder: (context) => MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: generatedData?.routerConfig,
            scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
            onGenerateTitle: buildTitle,
            // showPerformanceOverlay: true,
            theme: buildTheme(context),
        )),
      ),
    );
  }

}

class NoThumbScrollBehavior extends ScrollBehavior {

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.trackpad,
  };
}
