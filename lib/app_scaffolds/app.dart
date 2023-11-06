part of devspace;




typedef CreateRouterConfig = RouterConfig<Object> Function(BuildContext context);



class _GeneratedAppData {

  final RouterConfig<Object> routerConfig;

  const _GeneratedAppData({
    required this.routerConfig,
  });
}

class App extends StatelessWidget {

  final StringBuilder buildTitle;
  final ThemeBuilder buildTheme;
  final String translationsFolder;
  final Locale fallbackLocale;
  final List<Locale> supportedLocales;
  final List<Glue<GlueComponent>> globalGlues;
  final ContextLoader loadApp;
  final CreateRouterConfig createRouterConfig;

  const App({
    super.key,
    required this.buildTitle,
    required this.buildTheme,
    this.translationsFolder = 'assets/translations',
    this.fallbackLocale = const Locale('en', 'US'),
    required this.supportedLocales,
    required this.globalGlues,
    required this.loadApp,
    required this.createRouterConfig,
  });

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
        globalGlues: globalGlues,
      ),
    );
  }

  Future<_GeneratedAppData?> _loadApp(BuildContext context) async
  {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    if (!context.mounted) return null;

    await loadApp(context);

    await MyService.ensureAllReady();

    if (!context.mounted) return null;

    return _GeneratedAppData(
      routerConfig: createRouterConfig(context),
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
            title: buildTitle(context),
            // showPerformanceOverlay: true,
            theme: buildTheme(context),
        )),
      ),
    );
  }

}