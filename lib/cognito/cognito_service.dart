
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

  Future<void> updateStoredPassword(String password);
  Future<void> updateStoredEmail(String email);

  Future<CognitoSignInResult> signInUsingStoreCredentials();
  Future<CognitoSignInResult> signIn(String email, String password);
  Future<CognitoForgotPasswordRequestResult> forgotPasswordRequest(String email);
  Future<CognitoResetPasswordResult> resetPasswordRequest(String email, String newPassword, String confirmationCode);
  Future<CognitoChangeInitialPasswordResult> changeInitialPassword(String newPassword);
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String?> getJWTAccessToken();
  Future<String?> getAuthServiceUserId();

}


class CognitoAuthenticationService extends AuthService {

  final String config;
  late final FlutterSecureStorage _secureStorage;

  CognitoAuthenticationService(this.config);


  @override
  Future<void> initialize() async
  {
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(config);

    if (!kIsWeb)
    {
      _secureStorage = const FlutterSecureStorage();
    }

  }

  @override
  Future<void> reset() async
  {
    if (!kIsWeb)
    {
      try
      {
        await _secureStorage.delete(key: 'COGNITO_EMAIL');
        await _secureStorage.delete(key: 'COGNITO_PASSWORD');
      }
      catch (e)
      {
        Dev.logException(this, e, 'Error deleting stored credentials');
      }
    }
  }

  @override
  Future<void> updateStoredPassword(String password) async
  {
    if (!kIsWeb)
    {
      try
      {
        await _secureStorage.write(key: 'COGNITO_PASSWORD', value: password);
      }
      catch (e)
      {
        Dev.logException(this, e, 'Error deleting stored credentials');
      }
    }
  }

  @override
  Future<void> updateStoredEmail(String email) async
  {
    if (!kIsWeb)
    {
      try
      {
        await _secureStorage.write(key: 'COGNITO_EMAIL', value: email);
      }
      catch (e)
      {
        Dev.logException(this, e, 'Error deleting stored credentials');
      }
    }
  }


  @override
  Future<CognitoSignInResult> signInUsingStoreCredentials() async
  {
    if (kIsWeb)
    {
      return CognitoSignInResult(exception: Exception('Not supported on web'));
    }

    String? email = await _secureStorage.read(key: 'COGNITO_EMAIL');
    String? password = await _secureStorage.read(key: 'COGNITO_PASSWORD');

    if (email == null || password == null)
    {
      return CognitoSignInResult(exception: Exception('No stored credentials'));
    }

    return signIn(email, password);
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

      if (!kIsWeb)
      {
        try
        {
          await _secureStorage.write(key: 'COGNITO_EMAIL', value: email);
          await _secureStorage.write(key: 'COGNITO_PASSWORD', value: password);
        }
        catch (e)
        {
          Dev.logException(this, e, 'Error deleting stored credentials');
        }
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

    if (!kIsWeb)
    {
      try
      {
        await _secureStorage.delete(key: 'COGNITO_EMAIL');
        await _secureStorage.delete(key: 'COGNITO_PASSWORD');
      }
      catch (e)
      {
        Dev.logException(this, e, 'Error deleting stored credentials');
      }
    }
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
      // options: const CognitoFetchAuthSessionOptions(getAWSCredentials: true),
    ) as CognitoAuthSession;

    // ignore: deprecated_member_use
    // final token = result.userPoolTokens?.idToken.raw;

    final token = result.userPoolTokensResult.value.idToken.raw;

    Dev.logOnlyLocalEnv(this, 'JWT Token: $token');

    return token;
  }

  @override
  Future<String?> getAuthServiceUserId() async
  {
    try
    {
      final result = await Amplify.Auth.fetchAuthSession(
        // ignore: deprecated_member_use
        // options: const CognitoFetchAuthSessionOptions(getAWSCredentials: true),
      ) as CognitoAuthSession;

      return result.userSubResult.value;
    }
    on AuthException catch (e)
    {
      Dev.logException(this, e, 'Error retrieving auth session in getAuthServiceUserId()');
      return null;
    }
  }


  @override
  Future<void> dispose() async
  {

  }

}

