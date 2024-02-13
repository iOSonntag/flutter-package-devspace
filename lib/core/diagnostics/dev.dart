part of devspace;

abstract class Dev
{
  Dev._();


  static void logException(dynamic issuer, Object exception, String? message)
  {
    String className = (issuer is String) ? issuer : issuer.runtimeType.toString();

    String finalMessage = message != null ? 'EXCEPTION [$className]: $message' : 'EXCEPTION [$className]';
    log(finalMessage, error: exception, stackTrace: StackTrace.current);
  }
}