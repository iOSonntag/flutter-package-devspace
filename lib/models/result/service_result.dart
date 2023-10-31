
part of devspace;



abstract class ServiceResult<T> extends Result {

  final T? data;
  late final bool? _unhandledException;
  final Exception? exception;

  ServiceResult({
    this.data,
    this.exception,
  })
  {
    if (exception != null)
    {
      bool success = exceptionMeansSuccess(exception!);

      if (success)
      {
        finalizeAsSuccess();
        return;
      }

      _unhandledException = handleException(exception!);
      finalizeAsError();  
      return;
    }

    try
    {
      // ignoring null check because a thrown exception will be handled, which
      // is the intended behavior
      // ignore: null_check_on_nullable_type_parameter
      if (checkSuccess(data!) == false)
      {
        _unhandledException = true;
        finalizeAsError();
        return;
      }
    }
    on Exception catch (e)
    {
      _unhandledException = handleException(e);
      finalizeAsError();
      return;
    }

    finalizeAsSuccess();
  }

  ServiceResult.success({
    this.data,
  }) : 
    exception = null
  {
    finalizeAsSuccess();
  }

  /// Override this method to check if the data is considered as success.
  /// 
  /// true -> success
  /// false -> error
  /// null -> unknown error
  /// 
  /// Note on errors:
  /// If you do not set internal flags after checking the data, you should
  /// return null. This will mark the result as unknown error.
  /// 
  /// It is still possible to throw exceptions while checking the data. This
  /// will automatically call the [handleException] method which marks the
  /// result as an error.
  bool? checkSuccess(T data);

  /// Override this method to handle exceptions passed to the constructor.
  /// Extract the necessary information from the exception and set the
  /// additional flags on the result object if needed.
  /// 
  /// Return true if the exception was handled, false otherwise. This means that
  /// the result will be marked as unknown error.
  /// 
  /// Note: If the exception is considered as success by calling the
  /// [exceptionMeansSuccess] method, this method will not be called. The
  /// default behavior of this method though is to return false.
  /// You can override the [exceptionMeansSuccess] method to change this behavior.
  bool handleException(Exception exception);


  bool exceptionMeansSuccess(Exception exception)
  {
    return false;
  }

  bool get isErrorUnknown => !isSuccess && _unhandledException == true;



  String? generateLocalizedErrorMessage();


  /// Returns the localized error message. If the result is a success, null is
  /// returned.
  /// 
  /// If the result is an error, the [generateLocalizedErrorMessage] method is
  /// called. If this method returns null, a default error message is returned.
  String? get localizedErrorMessage
  {
    if (isSuccess)
    {
      return null;
    }

    final message = generateLocalizedErrorMessage();

    if (message == null)
    {
      return LibStrings.lib_general_errorUnknown.tr();
    }
    
    return message;
  }


}


