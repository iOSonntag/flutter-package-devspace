


part of devspace;



abstract class Result {

  bool? _success;

  /// Returns true if the action was successful.
  /// 
  /// Note:
  /// In most cases this means that the action was successful in the sense that
  /// it completed in the way it was intended to. 
  /// However, in some cases it may mean that the action was successful in some 
  /// way, but still lacks some information or has some other issue that is not
  /// considered an error.
  /// 
  /// For example, an sign-in attempt may be successful, but the user may still
  /// need to verify their email address before they can use the app.
  bool get isSuccess
  {
    if (_success == null)
    {
      // IMPROVE: log warning instead
      throw Exception('Result has not been finalized. Accessing its value is dangerous.');
    }

    return _success == true;
  }



  /// Returns true if the action failed.
  bool get hasError => !isSuccess;

  Result({
    bool? success,
  }) : 
    _success = success;

  void finalizeAsSuccess()
  {
    _finalize(true);
  }

  void finalizeAsError()
  {
    _finalize(false);
  }

  void _finalize(bool success)
  {
    if (_success != null)
    {
      throw Exception('Result has already been finalized.');
    }

    _success = success;
  }
}