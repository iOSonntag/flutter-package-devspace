
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
  Future<CognitoForgotPasswordRequestResult> forgotPasswordRequest(String email);
  Future<CognitoResetPasswordResult> resetPasswordRequest(String email, String newPassword, String confirmationCode);
  Future<CognitoChangeInitialPasswordResult> changeInitialPassword(String newPassword);
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String?> getJWTAccessToken();

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

      List<AuthUserAttribute>? attributes;

      if (result.isSignedIn)
      {
        attributes = await Amplify.Auth.fetchUserAttributes();
      }


      return CognitoSignInResult(data: SignInResultExtended(
        signInResult: result,
        attributes: attributes ?? [],
      ));
    }
    on Exception catch (e)
    {
      return CognitoSignInResult(exception: e);
    }
  }

  @override
  Future<CognitoForgotPasswordRequestResult> forgotPasswordRequest(String email) async
  {
    try
    {
      ResetPasswordResult result = await Amplify.Auth.resetPassword(username: email);

      return CognitoForgotPasswordRequestResult(data: result);
    }
    on Exception catch (e)
    {
      return CognitoForgotPasswordRequestResult(exception: e);
    }
  }

  @override
  Future<CognitoResetPasswordResult> resetPasswordRequest(String email, String newPassword, String confirmationCode) async
  {
    try
    {
      ResetPasswordResult result = await Amplify.Auth.confirmResetPassword(
        username: email,
        newPassword: newPassword,
        confirmationCode: confirmationCode,
      );

      return CognitoResetPasswordResult(data: result);
    }
    on Exception catch (e)
    {
      return CognitoResetPasswordResult(exception: e);
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
      Dev.logException(this, e, 'Error retrieving auth session in isSignedIn()');
      rethrow;
    }
  }

  @override
  Future<String?> getJWTAccessToken() async
  {
    final result = await Amplify.Auth.fetchAuthSession(
      // ignore: deprecated_member_use
      options: const CognitoFetchAuthSessionOptions(getAWSCredentials: true),
    ) as CognitoAuthSession;

    // ignore: deprecated_member_use
    final token = result.userPoolTokens?.idToken.raw;

    Dev.logOnlyLocalEnv(this, 'JWT Token: $token');

    return token;
  }


  @override
  Future<void> dispose() async
  {

  }

}

