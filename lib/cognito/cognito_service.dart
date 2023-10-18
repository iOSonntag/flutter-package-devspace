
part of devspace;

class CognitoAuthenticationService {


  Future<void> initialize(String stringConfiguration) async
  {
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(stringConfiguration);
  }

  Future<bool> signIn(String email, String password) async
  {
    await signOut();

    SignInResult result = await Amplify.Auth.signIn(
      username: email, 
      password: password,
      // options: CognitoS()
    );
  
    return result.isSignedIn;
  }

  Future<void> changeInitialPassword(String newPassword) async
  {
    await Amplify.Auth.confirmSignIn(confirmationValue: newPassword);
  }

  Future<void> signOut() async
  {
    await Amplify.Auth.signOut();
  }

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

  Future<String> getJWTAccessToken() async
  {
    final result = await Amplify.Auth.fetchAuthSession(
      // ignore: deprecated_member_use
      options: const CognitoFetchAuthSessionOptions(getAWSCredentials: true),
    ) as CognitoAuthSession;

    // ignore: deprecated_member_use
    return result.userPoolTokens!.idToken.raw;
  }


  Future<void> dispose() async
  {

  }

}

