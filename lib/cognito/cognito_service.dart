
part of devspace;

// ignore: camel_case_types
enum kSignInResult
{
  success,
  successButChangePassword,
  invalidCredentials,
  unknownError,
}

abstract class AuthService extends CustomService {

  Future<CognitoSignInResult> signIn(String email, String password);
  Future<CognitoChangeInitialPasswordResult> changeInitialPassword(String newPassword);
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String> getJWTAccessToken();

}


class CognitoAuthenticationService extends AuthService {

  final String config;

  CognitoAuthenticationService(this.config);


  @override
  Future<void> initialize() async
  {
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(config);
  }

  @override
  Future<CognitoSignInResult> signIn(String email, String password) async
  {
    try
    {
      await signOut();

      SignInResult result = await Amplify.Auth.signIn(
        username: email, 
        password: password,
      );

      return CognitoSignInResult(data: result);
    }
    on Exception catch (e)
    {
      return CognitoSignInResult(exception: e);
    }
  }

  @override
  Future<CognitoChangeInitialPasswordResult> changeInitialPassword(String newPassword) async
  {
    try
    {
      SignInResult result = await Amplify.Auth.confirmSignIn(confirmationValue: newPassword);

      return CognitoChangeInitialPasswordResult(data: result);
    }
    on Exception catch (e)
    {
      return CognitoChangeInitialPasswordResult(exception: e);
    }
  }

  @override
  Future<void> signOut() async
  {
    await Amplify.Auth.signOut();
  }

  @override
  Future<bool> isSignedIn() async
  {
    try
    {
      final result = await Amplify.Auth.fetchAuthSession();

      return result.isSignedIn;
    }
    on AuthException catch (e)
    {
      safePrint('Error retrieving auth session: ${e.message}');
      rethrow;
    }
  }

  @override
  Future<String> getJWTAccessToken() async
  {
    final result = await Amplify.Auth.fetchAuthSession(
      // ignore: deprecated_member_use
      options: const CognitoFetchAuthSessionOptions(getAWSCredentials: true),
    ) as CognitoAuthSession;

    // ignore: deprecated_member_use
    return result.userPoolTokens!.idToken.raw;
  }


  @override
  Future<void> dispose() async
  {

  }

}

