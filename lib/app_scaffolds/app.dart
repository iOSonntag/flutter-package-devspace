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

  static AppEvents? _events;
  static AppEvents get events => App._events ?? (throw Exception('App.events is not set. Are you accessing it before the App is built?'));

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
    required AppEvents events,
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
    App._events = events;
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
    await _checkLanguagesIfNeeded();

    if (!context.mounted) return null;

    final appLoadResult = await loadApp(context);

    await MyService.ensureAllReady();

    if (!context.mounted) return null;

    return _GeneratedAppData(
      routerConfig: createRouterConfig(context, rootNavigatorKey, appLoadResult),
      globalGlues: onPostLoad_createGlobalGlues(appLoadResult),
    );
    
  }

  Future<void> _checkLanguagesIfNeeded() async
  {
    if (!Env.isLocal) return;
    
    await AppHelper.ensureAllTranslationKeysAreAvailable(supportedLocales, translationsFolder);
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
        child: _NavigationWrapper(
          buildTitle: buildTitle,
          buildTheme: buildTheme,
          generatedData: generatedData,
        ),
      ),
    );
  }
}


class _NavigationWrapper extends StatefulWidget {

  final StringBuilder buildTitle;
  final ThemeBuilder buildTheme;
  final _GeneratedAppData? generatedData;

  const _NavigationWrapper({
    required this.buildTitle,
    required this.buildTheme,
    required this.generatedData,
  });

  @override
  material.State<_NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<_NavigationWrapper> with WidgetsBindingObserver {

  @override
  void initState()
  {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state)
  {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed)
    {
      App.events.onAppResumed?.call(context);
      _ForegroundTimerRegistry().onAppResumed();
    }
    else if (state == AppLifecycleState.paused)
    {
      _ForegroundTimerRegistry().onAppPaused();
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result)
      {
        if (Platform.isAndroid)
        {
          App.events.onAndroidBackButtonPressed?.call(context);
        }
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: App.config.hideDebugFlag == false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: widget.generatedData?.routerConfig,
        scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
        onGenerateTitle: widget.buildTitle,
        // showPerformanceOverlay: true,
        theme: widget.buildTheme(context),
      ),
    );
  }

  @override
  void dispose()
  {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
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
