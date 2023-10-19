



part of devspace;

typedef InputValidator = String? Function(String? input);

class InputValidators {

  InputValidators._();

  static String? _noValidation(String? input)
  {
    return null;
  }

  static String? _notEmpty(String? input)
  {
    if (input == null || input.isEmpty)
    {
      return LibStrings.lib_blueForms_inputValidators_failedNotEmptyCheck.tr();
    }

    return null;
  }

  static String? _trimNotEmpty(String? input)
  {
    if (input == null || input.trim().isEmpty)
    {
      return LibStrings.lib_blueForms_inputValidators_failedNotEmptyCheck.tr();
    }

    return null;
  }

  static String? _phoneNumber(String? input)
  {
    if (input == null || input.trim().isValidPhoneNumber() == false)
    {
      return LibStrings.lib_blueForms_inputValidators_failedPhoneNumberCheck.tr();
    }

    return null;
  }


  static InputValidator notEmpty({bool trimBeforeCheck = true})
  {
    if (trimBeforeCheck)
    {
      return _trimNotEmpty;
    }

    return _notEmpty;
  }

  static InputValidator phoneNumber()
  {
    return _phoneNumber;
  }

  static InputValidator noValidation()
  {
    return _noValidation;
  }

}