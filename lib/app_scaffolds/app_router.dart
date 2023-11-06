part of devspace;


class AppRoutesAuth {

  static String _basePath = '/auth';

  static String _signInPath = 'sign-in';
  static String _changeInitialPasswordPath = 'set-password';


  static String get base => _basePath;

  static String get signIn => '$_basePath/$_signInPath';
  static String get changeInitialPassword => '$_basePath/$_changeInitialPasswordPath';
}


typedef CheckSignedIn = FutureOr<bool> Function(BuildContext context);


class AppRouterAuthConfig {

  final CheckSignedIn isSignedIn;

  final GoRouterWidgetBuilder builderSignIn;
  final GoRouterWidgetBuilder? builderChangeInitialPassword;

  /// This is the home location for signed in users. If not set, the home
  /// location will be used from the main router.
  final String? homeLocation;


  final String? overwriteRouteBasePath;
  final String? overwriteRouteSignInPath;
  final String? overwriteRouteChangeInitialPasswordPath;

  const AppRouterAuthConfig({
    required this.isSignedIn,

    required this.builderSignIn,
    this.builderChangeInitialPassword,

    this.homeLocation,

    this.overwriteRouteBasePath,
    this.overwriteRouteSignInPath,
    this.overwriteRouteChangeInitialPasswordPath,
  });

}

class AppRouter {

  static AppRouter? _instance;

  late final GoRouter router;
  late final GlobalKey<NavigatorState> rootNavigatorKey;

  final String initialLocation;
  final String homeLocation;
  final AppRouterAuthConfig? auth;

  factory AppRouter({
    AppRouterAuthConfig? auth,
    String initialLocation = '/',
    String homeLocation = '/',
    required List<RouteBase> routes,
  })
  {
    if (_instance != null)
    {
      return _instance!;
    }
    
    return AppRouter._internal(
      auth: auth,
      initialLocation: initialLocation,
      homeLocation: homeLocation,
      routes: routes,
    );
  }

  AppRouter._internal({
    required this.auth,
    required this.initialLocation,
    required this.homeLocation,
    required List<RouteBase> routes,
  })
  {


    final rootNavigatorKey = GlobalKey<NavigatorState>();

    List<RouteBase> finalRoutes = [];

    if (auth != null)
    {
      finalRoutes.addAll(_createAuthRoutes(auth!));
    }

    finalRoutes.addAll(routes);

    router = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      routes: finalRoutes,
      redirect: (context, state) async
      {

        if (auth != null)
        {
          String? redirection = await _redirectAuth(context, state, auth!);

          if (redirection != null)
          {
            return redirection;
          }
        }

        return null;
      },
    );
  }

  FutureOr<String?> _redirectAuth(BuildContext context, GoRouterState state, AppRouterAuthConfig auth) async
  {
    if (state.matchedLocation == AppRoutesAuth.base)
    {
      // redirecting is done via implicit redirect rule during route creation -
      // so no redirect here
      return null;
    }

    bool signedIn = await auth.isSignedIn(context);

    final home = auth.homeLocation ?? homeLocation;

    // ! SIGN-IN PAGE
    if (state.matchedLocation == AppRoutesAuth.signIn)
    {
      if (!signedIn)
      {
        return null;
      }

      // if the user is logged in and they are on the sign-in page, send them 
      return state.uri.queryParameters['from'] ?? home;
    }

    // ! CHANGE INITIAL PASSWORD PAGE
    if (state.matchedLocation == AppRoutesAuth.changeInitialPassword)
    {
      if (!signedIn)
      {
        return null;
      }

      // if the user is logged in and they are on the sign-in page, send them 
      return state.uri.queryParameters['from'] ?? home;
    }

    // ! ANY OTHER PAGE

    // if the user is logged in do not redirect at all
    if (signedIn)
    {
      return null;
    }

    // if the user is not logged in and they are not on the sign-in page, send
    // them to the sign-in page AND remember where they came from
    
    final fromLocation = state.matchedLocation == home ? '' : state.matchedLocation;

    return state.namedLocation(
      AppRoutesAuth.signIn,
      queryParameters: {
        if (fromLocation.isNotEmpty) 'from': fromLocation
      },
    );
  }


  List<RouteBase> _createAuthRoutes(AppRouterAuthConfig auth)
  {
    AppRoutesAuth._basePath = auth.overwriteRouteBasePath ?? AppRoutesAuth._basePath;
    AppRoutesAuth._signInPath = auth.overwriteRouteSignInPath ?? AppRoutesAuth._signInPath;
    AppRoutesAuth._changeInitialPasswordPath = auth.overwriteRouteChangeInitialPasswordPath ?? AppRoutesAuth._changeInitialPasswordPath;


    return [
      GoRoute(
        name: AppRoutesAuth.base,
        path: AppRoutesAuth._basePath,
        redirect: (context, state)
        {
          if (state.fullPath == AppRoutesAuth.base)
          {
            return AppRoutesAuth.signIn;
          }

          return null;
        },
        routes: [
          GoRoute(
            name: AppRoutesAuth.signIn,
            path: AppRoutesAuth._signInPath,
            builder: auth.builderSignIn,
          ),
          GoRoute(
            name: AppRoutesAuth.changeInitialPassword,
            path: AppRoutesAuth._changeInitialPasswordPath,
            builder: auth.builderChangeInitialPassword,
          ),
        ]
      ),
    ];
  }

}