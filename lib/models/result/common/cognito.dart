

part of devspace;

// ignore: camel_case_types
enum _kCognitoSignInErrors
{
  invalidCredentials,
  passwordChangeRequired,
}

class SignInResultExtended {

  final SignInResult signInResult;
  final List<AuthUserAttribute> attributes;

  SignInResultExtended({
    required this.signInResult,
    required this.attributes,
  });
}

class CognitoSignInResult extends ServiceResult<SignInResultExtended> {

  _kCognitoSignInErrors? _error;

  bool get isErrorInvalidCredentials => _error == _kCognitoSignInErrors.invalidCredentials;
  bool get isErrorPasswordChangeRequired => _error == _kCognitoSignInErrors.passwordChangeRequired;


  CognitoSignInResult({
    super.data,
    super.exception,
  });

  CognitoSignInResult.emptySuccess() : super.success();
  
  @override
  bool? checkSuccess(SignInResultExtended data)
  {

    if (data.signInResult.isSignedIn)
    {
      return true;
    }
    
    if (data.signInResult.nextStep.signInStep == AuthSignInStep.confirmSignInWithNewPassword)
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
enum _kCognitoForgotPasswordRequestResultErrors
{
  userNotFound,
  sendLimitExceeded,
}


class CognitoForgotPasswordRequestResult extends ServiceResult<ResetPasswordResult> {

  _kCognitoForgotPasswordRequestResultErrors? _error;

  bool get isErrorUserNotFound => _error == _kCognitoForgotPasswordRequestResultErrors.userNotFound;
  bool get isErrorSendLimitExceeded => _error == _kCognitoForgotPasswordRequestResultErrors.sendLimitExceeded;


  CognitoForgotPasswordRequestResult({
    super.data,
    super.exception,
  });
  
  @override
  bool? checkSuccess(ResetPasswordResult data)
  {
    if (data.nextStep.codeDeliveryDetails != null && data.nextStep.codeDeliveryDetails?.destination != null)
    {
      return true;
    }

    return null;
  }

  
  @override
  bool handleException(Exception exception)
  {
    if  (exception is UserNotFoundException)
    {
      _error = _kCognitoForgotPasswordRequestResultErrors.userNotFound;
      return true;
    }

    if (exception is LimitExceededException)
    {
      _error = _kCognitoForgotPasswordRequestResultErrors.sendLimitExceeded;
      return true;
    }

    return false;
  }
  
  @override
  String? generateLocalizedErrorMessage()
  {
    if (isErrorUserNotFound)
    {
      return LibStrings.lib_models_cognitoForgotPasswordRequest_userNotFound_message.tr();
    }

    if (isErrorSendLimitExceeded)
    {
      return LibStrings.lib_models_cognitoForgotPasswordRequest_sendLimitExceeded_message.tr();
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













// ignore: camel_case_types
enum _kCognitoResetPasswordErrors
{
  codeInvalid,
  passwordTooShort,
  passwordUpperMissing,
  passwordLowerMissing,
  passwordNumberMissing,
  passwordSymbolMissing,
}

class CognitoResetPasswordResult extends ServiceResult<ResetPasswordResult> {

  _kCognitoResetPasswordErrors? _error;

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

  bool get isErrorCodeInvalid => _error == _kCognitoResetPasswordErrors.codeInvalid;
  bool get isErrorPasswordTooShort => _error == _kCognitoResetPasswordErrors.passwordTooShort;
  bool get isErrorPasswordUpperMissing => _error == _kCognitoResetPasswordErrors.passwordUpperMissing;
  bool get isErrorPasswordLowerMissing => _error == _kCognitoResetPasswordErrors.passwordLowerMissing;
  bool get isErrorPasswordNumberMissing => _error == _kCognitoResetPasswordErrors.passwordNumberMissing;
  bool get isErrorPasswordSymbolMissing => _error == _kCognitoResetPasswordErrors.passwordSymbolMissing;



  CognitoResetPasswordResult({
    super.data,
    super.exception,
  });
  
  @override
  bool? checkSuccess(ResetPasswordResult data)
  {
    if (data.isPasswordReset)
    {
      return true;
    }

    return null;
  }

  
  @override
  bool handleException(Exception exception)
  {
    

    if  (exception is NotAuthorizedServiceException)
    {
      _error = _kCognitoResetPasswordErrors.codeInvalid;
      return true;
    }

    if  (exception is InvalidPasswordException)
    {
      if (exception.message == 'Password does not conform to policy: Password not long enough')
      {
        _error = _kCognitoResetPasswordErrors.passwordTooShort;
        return true;
      }

      if (exception.message == 'Password does not conform to policy: Password must have uppercase characters')
      {
        _error = _kCognitoResetPasswordErrors.passwordUpperMissing;
        return true;
      }

      if (exception.message == 'Password does not conform to policy: Password must have lowercase characters')
      {
        _error = _kCognitoResetPasswordErrors.passwordLowerMissing;
        return true;
      }

      if (exception.message == 'Password does not conform to policy: Password must have numeric characters')
      {
        _error = _kCognitoResetPasswordErrors.passwordNumberMissing;
        return true;
      }

      if (exception.message == 'Password does not conform to policy: Password must have symbol characters')
      {
        _error = _kCognitoResetPasswordErrors.passwordSymbolMissing;
        return true;
      }


      
      return false;
    }

    if (exception is InvalidParameterException && exception.message == '1 validation error detected: Value at \'password\' failed to satisfy constraint: Member must satisfy regular expression pattern: ^[\\S]+.*[\\S]+\$')
    {
      // happends when the user enters only 1 character
      _error = _kCognitoResetPasswordErrors.passwordTooShort;
      return true;
    }

    if (exception is CodeMismatchException)
    {
      _error = _kCognitoResetPasswordErrors.codeInvalid;
      return true;
    }

    return false;
  }
  
  @override
  String? generateLocalizedErrorMessage()
  {
    if (isErrorCodeInvalid)
    {
      return LibStrings.lib_models_cognitoResetPassword_codeInvalid_message.tr();
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