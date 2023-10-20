
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

  Future<kSignInResult> signIn(String email, String password);
  Future<kSignInResult> changeInitialPassword(String newPassword);
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
  Future<kSignInResult> signIn(String email, String password) async
  {
    try
    {
      await signOut();
    }
    catch (e)
    {
      safePrint('Error signing out: ${e.toString()}');
    }

    try
    {

      SignInResult result = await Amplify.Auth.signIn(
        username: email, 
        password: password,
      );

      if (result.isSignedIn)
      {
        return kSignInResult.success;
      }
      
      if (result.nextStep.signInStep == AuthSignInStep.confirmSignInWithNewPassword)
      {
        return kSignInResult.successButChangePassword;
      }

      return kSignInResult.unknownError;
    }
    on InvalidPasswordException catch (e)
    {
      safePrint('Error retrieving auth session: ${e.message}');
      
      return kSignInResult.invalidCredentials;
    }
    on UserNotFoundException catch (e)
    {
      safePrint('Error retrieving auth session: ${e.message}');
      
      return kSignInResult.invalidCredentials;
    }
    on NotAuthorizedServiceException catch (e)
    {
      safePrint('Error retrieving auth session: ${e.message}');
      
      return kSignInResult.invalidCredentials;
    }
    on Exception catch (e)
    {
      safePrint('Error retrieving auth session: ${e.toString()}');
      return kSignInResult.unknownError;
    }
  }

  @override
  Future<kSignInResult> changeInitialPassword(String newPassword) async
  {
    try
    {
      SignInResult result = await Amplify.Auth.confirmSignIn(confirmationValue: newPassword);

      if (result.isSignedIn)
      {
        return kSignInResult.success;
      }
      
      if (result.nextStep.signInStep == AuthSignInStep.confirmSignInWithNewPassword)
      {
        return kSignInResult.successButChangePassword;
      }

      return kSignInResult.unknownError;
    }
    on InvalidPasswordException catch (e)
    {
      safePrint('Error retrieving auth session: ${e.message}');
      
      return kSignInResult.invalidCredentials;
    }
    on UserNotFoundException catch (e)
    {
      safePrint('Error retrieving auth session: ${e.message}');
      
      return kSignInResult.invalidCredentials;
    }
    on NotAuthorizedServiceException catch (e)
    {
      safePrint('Error retrieving auth session: ${e.message}');
      
      return kSignInResult.invalidCredentials;
    }
    on Exception catch (e)
    {
      safePrint('Error retrieving auth session: ${e.toString()}');
      return kSignInResult.unknownError;
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

