

part of devspace;

// ignore: camel_case_types
enum _kCognitoSignInErrors
{
  invalidCredentials,
  passwordChangeRequired,
}

class CognitoSignInResult extends ServiceResult<SignInResult> {

  _kCognitoSignInErrors? _error;

  bool get isErrorInvalidCredentials => _error == _kCognitoSignInErrors.invalidCredentials;
  bool get isErrorPasswordChangeRequired => _error == _kCognitoSignInErrors.passwordChangeRequired;


  CognitoSignInResult({
    super.data,
    super.exception,
  });

  CognitoSignInResult.emptySuccess() : super.success();
  
  @override
  bool? checkSuccess(SignInResult data)
  {
    if (data.isSignedIn)
    {
      return true;
    }
    
    if (data.nextStep.signInStep == AuthSignInStep.confirmSignInWithNewPassword)
    {
      _error = _kCognitoSignInErrors.passwordChangeRequired;
      return false;
    }

    return null;
  }

  
  @override
  bool handleException(Exception exception)
  {
    if  (exception is InvalidPasswordException
      || exception is UserNotFoundException 
      || exception is NotAuthorizedServiceException)
    {
      _error = _kCognitoSignInErrors.invalidCredentials;
      return true;
    }

    return false;
  }
  
  @override
  String? generateLocalizedErrorMessage()
  {
    if (isErrorInvalidCredentials)
    {
      return LibStrings.lib_models_cognitoSignIn_invalidCredentials_message.tr();
    }

    if (isErrorPasswordChangeRequired)
    {
      return LibStrings.lib_models_cognitoSignIn_passwordChangeRequired_message.tr();
    }

    return null;
  }


}







// ignore: camel_case_types
enum _kCognitoChangeInitialPasswordErrors
{
  unauthorized,
  passwordTooShort,
  passwordUpperMissing,
  passwordLowerMissing,
  passwordNumberMissing,
  passwordSymbolMissing,
}

class CognitoChangeInitialPasswordResult extends ServiceResult<SignInResult> {

  _kCognitoChangeInitialPasswordErrors? _error;

  // NOTE: sadly cognito does not provide the minimum password length
  // int? _passwordLengthMin;
  // int get passwordLengthMin
  // {
  //   if (_passwordLengthMin == null)
  //   {
  //     throw Exception('passwordLengthMin is null. Did you forgot to check for [result.isErrorPasswordTooShort] to be true?');
  //   }
  //   return _passwordLengthMin!;
  // }

  bool get isErrorUnauthorized => _error == _kCognitoChangeInitialPasswordErrors.unauthorized;
  bool get isErrorPasswordTooShort => _error == _kCognitoChangeInitialPasswordErrors.passwordTooShort;
  bool get isErrorPasswordUpperMissing => _error == _kCognitoChangeInitialPasswordErrors.passwordUpperMissing;
  bool get isErrorPasswordLowerMissing => _error == _kCognitoChangeInitialPasswordErrors.passwordLowerMissing;
  bool get isErrorPasswordNumberMissing => _error == _kCognitoChangeInitialPasswordErrors.passwordNumberMissing;
  bool get isErrorPasswordSymbolMissing => _error == _kCognitoChangeInitialPasswordErrors.passwordSymbolMissing;



  CognitoChangeInitialPasswordResult({
    super.data,
    super.exception,
  });
  
  @override
  bool? checkSuccess(SignInResult data)
  {
    if (data.isSignedIn)
    {
      return true;
    }
    


    return null;
  }

  
  @override
  bool handleException(Exception exception)
  {
    

    if  (exception is UserNotFoundException 
      || exception is NotAuthorizedServiceException)
    {
      _error = _kCognitoChangeInitialPasswordErrors.unauthorized;
      return true;
    }

    if  (exception is InvalidPasswordException)
    {
      if (exception.message == 'Password does not conform to policy: Password not long enough')
      {
        _error = _kCognitoChangeInitialPasswordErrors.passwordTooShort;
        return true;
      }

      if (exception.message == 'Password does not conform to policy: Password must have uppercase characters')
      {
        _error = _kCognitoChangeInitialPasswordErrors.passwordUpperMissing;
        return true;
      }

      if (exception.message == 'Password does not conform to policy: Password must have lowercase characters')
      {
        _error = _kCognitoChangeInitialPasswordErrors.passwordLowerMissing;
        return true;
      }

      if (exception.message == 'Password does not conform to policy: Password must have numeric characters')
      {
        _error = _kCognitoChangeInitialPasswordErrors.passwordNumberMissing;
        return true;
      }

      if (exception.message == 'Password does not conform to policy: Password must have symbol characters')
      {
        _error = _kCognitoChangeInitialPasswordErrors.passwordSymbolMissing;
        return true;
      }


      
      return false;
    }

    if (exception is AuthException)
    {
      _error = _kCognitoChangeInitialPasswordErrors.unauthorized;
      return true;
    }

    return false;
  }
  
  @override
  String? generateLocalizedErrorMessage()
  {
    if (isErrorUnauthorized)
    {
      return LibStrings.lib_models_cognitoChangeInitialPassword_unauthorized_message.tr();
    }

    if (isErrorPasswordTooShort)
    {
      return LibStrings.lib_models_cognitoChangeInitialPassword_passwordTooShort_message.tr();
    }

    if (isErrorPasswordUpperMissing)
    {
      return LibStrings.lib_models_cognitoChangeInitialPassword_passwordUpperMissing_message.tr();
    }

    if (isErrorPasswordLowerMissing)
    {
      return LibStrings.lib_models_cognitoChangeInitialPassword_passwordLowerMissing_message.tr();
    }

    if (isErrorPasswordNumberMissing)
    {
      return LibStrings.lib_models_cognitoChangeInitialPassword_passwordNumberMissing_message.tr();
    }

    if (isErrorPasswordSymbolMissing)
    {
      return LibStrings.lib_models_cognitoChangeInitialPassword_passwordSymbolMissing_message.tr();
    }



    return null;
  }


}