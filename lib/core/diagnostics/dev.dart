part of devspace;

abstract class Dev
{
  Dev._();

  static void logOnlyLocalEnv(dynamic issuer, String message, [Object? object])
  {
    if (!Env.isLocal)
    {
      return;
    }

    final finalMessage = object != null ? '$message\n$object' : message;
    String className = (issuer is String) ? issuer : issuer.runtimeType.toString();
    debugPrint('local env [$className]: $finalMessage');
  }

  static void logException(dynamic issuer, Object exception, [String? message])
  {
    String className = (issuer is String) ? issuer : issuer.runtimeType.toString();

    String finalMessage = message != null ? 'EXCEPTION [$className]: $message' : 'EXCEPTION [$className]';
    developer.log(finalMessage, error: exception, stackTrace: StackTrace.current);
  }

  static void logError(dynamic issuer, String message, [Object? object])
  {
    final finalMessage = object != null ? '$message\n$object' : message;
    String className = (issuer is String) ? issuer : issuer.runtimeType.toString();
    developer.log('ERROR     [$className]: $finalMessage');
  }

  static void logWarning(dynamic issuer, String message, [Object? object])
  {
    final finalMessage = object != null ? '$message\n$object' : message;
    String className = (issuer is String) ? issuer : issuer.runtimeType.toString();
    developer.log('WARNING   [$className]: $finalMessage');
  }

  static void log(dynamic issuer, String message, [Object? object])
  {
    final finalMessage = object != null ? '$message\n$object' : message;
    String className = (issuer is String) ? issuer : issuer.runtimeType.toString();
    developer.log('info      [$className]: $finalMessage');
  }
}