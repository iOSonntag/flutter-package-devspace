part of devspace;


class AppRoutesAuth {

  static String _basePath = '/auth';

  static String _signInPath = 'sign-in';
  static String _signUpPath = 'sign-up';
  static String _forgotPasswordPath = 'forgot-password';
  static String _resetPasswordPath = 'reset-password';
  static String _changeInitialPasswordPath = 'set-password';


  static String get base => _basePath;

  static String get signIn => '$_basePath/$_signInPath';
  static String get signUp => '$_basePath/$_signUpPath';
  static String get forgotPassword => '$_basePath/$_forgotPasswordPath';
  static String get resetPassword => '$_basePath/$_resetPasswordPath';
  static String get changeInitialPassword => '$_basePath/$_changeInitialPasswordPath';
}


typedef CheckSignedIn = FutureOr<bool> Function(BuildContext context);


class AppRouterAuthConfig {

  final CheckSignedIn isSignedIn;

  final GoRouterWidgetBuilder builderSignIn;
  final GoRouterWidgetBuilder builderSignUp;
  final GoRouterWidgetBuilder builderForgotPassword;
  final GoRouterWidgetBuilder builderResetPassword;
  final GoRouterWidgetBuilder? builderChangeInitialPassword;

  /// This is the home location for signed in users. If not set, the home
  /// location will be used from the main router.
  final String? homeLocation;


  final String? overwriteRouteBasePath;
  final String? overwriteRouteSignInPath;
  final String? overwriteRouteSignUpPath;
  final String? overwriteRouteForgotPasswordPath;
  final String? overwriteRouteResetPasswordPath;
  final String? overwriteRouteChangeInitialPasswordPath;

  const AppRouterAuthConfig({
    required this.isSignedIn,

    required this.builderSignIn,
    required this.builderSignUp,
    required this.builderForgotPassword,
    required this.builderResetPassword,
    this.builderChangeInitialPassword,

    this.homeLocation,

    this.overwriteRouteBasePath,
    this.overwriteRouteSignInPath,
    this.overwriteRouteSignUpPath,
    this.overwriteRouteForgotPasswordPath,
    this.overwriteRouteResetPasswordPath,
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
    _instance ??= AppRouter._internal(
        auth: auth,
        initialLocation: initialLocation,
        homeLocation: homeLocation,
        routes: routes,
      );
    
    return _instance!;
  }

  static refresh()
  {
    if (_instance == null)
    {
      throw Exception('AppRouter is not initialized');
    }

    _instance!.router.refresh();
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

    // ! SIGN-UP PAGE
    if (state.matchedLocation == AppRoutesAuth.signUp)
    {
      if (!signedIn)
      {
        return null;
      }

      // if the user is logged in and they are on the sign-up page, send them 
      return state.uri.queryParameters['from'] ?? home;
    }

    // ! FORGOT PASSWORD PAGE
    if (state.matchedLocation == AppRoutesAuth.forgotPassword)
    {
      if (!signedIn)
      {
        return null;
      }

      // if the user is logged in and they are on the forgot password page, send them
      return state.uri.queryParameters['from'] ?? home;
    }

    // ! RESET PASSWORD PAGE
    if (state.matchedLocation == AppRoutesAuth.resetPassword)
    {
      if (!signedIn)
      {
        return null;
      }

      // if the user is logged in and they are on the reset password page, send them
      return state.uri.queryParameters['from'] ?? home;
    }

    // ! CHANGE INITIAL PASSWORD PAGE
    if (state.matchedLocation == AppRoutesAuth.changeInitialPassword)
    {
      if (!signedIn)
      {
        return null;
      }

      // if the user is logged in and they are on the change initial password page, send them
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
    AppRoutesAuth._signUpPath = auth.overwriteRouteSignUpPath ?? AppRoutesAuth._signUpPath;
    AppRoutesAuth._forgotPasswordPath = auth.overwriteRouteForgotPasswordPath ?? AppRoutesAuth._forgotPasswordPath;
    AppRoutesAuth._resetPasswordPath = auth.overwriteRouteResetPasswordPath ?? AppRoutesAuth._resetPasswordPath;
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
            // builder: auth.builderSignIn,
            pageBuilder: (context, state) {
            return CustomNoTransitionPage<void>(
                child: auth.builderSignIn(context, state),
            );
        },
          ),
          GoRoute(
            name: AppRoutesAuth.signUp,
            path: AppRoutesAuth._signUpPath,
            builder: auth.builderSignUp,
          ),
          GoRoute(
            name: AppRoutesAuth.forgotPassword,
            path: AppRoutesAuth._forgotPasswordPath,
            builder: auth.builderForgotPassword,
          ),
          GoRoute(
            name: AppRoutesAuth.resetPassword,
            path: AppRoutesAuth._resetPasswordPath,
            builder: auth.builderResetPassword,
          ),
          if (auth.builderChangeInitialPassword != null) GoRoute(
            name: AppRoutesAuth.changeInitialPassword,
            path: AppRoutesAuth._changeInitialPasswordPath,
            builder: auth.builderChangeInitialPassword,
          )
        ]
      ),
    ];
  }

}

/// Custom transition page with no transition.
class CustomNoTransitionPage<T> extends CustomTransitionPage<T> {
  /// Constructor for a page with no transition functionality.
  const CustomNoTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(
          transitionsBuilder: _transitionsBuilder,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          maintainState: false,
        );

  static Widget _transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      child;
}