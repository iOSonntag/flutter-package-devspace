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
    App.events.logEvents?.onException(finalMessage, exception);
  }

  static void logError(dynamic issuer, String message, [Object? object])
  {
    String finalMessage = object != null ? '$message\n$object' : message;
    String className = (issuer is String) ? issuer : issuer.runtimeType.toString();
    finalMessage = 'ERROR     [$className]: $finalMessage';
    developer.log(finalMessage);
    App.events.logEvents?.onError(finalMessage, object);
  }

  static void logAppIssue(dynamic issuer, String message, [Object? object])
  {
    String finalMessage = object != null ? '$message\n$object' : message;
    String className = (issuer is String) ? issuer : issuer.runtimeType.toString();
    finalMessage = 'APP ISSUE [$className]: $finalMessage';
    developer.log(finalMessage);
    App.events.logEvents?.onAppIssue(finalMessage);
  }

  static void logWarning(dynamic issuer, String message, [Object? object])
  {
    String finalMessage = object != null ? '$message\n$object' : message;
    String className = (issuer is String) ? issuer : issuer.runtimeType.toString();
    finalMessage = 'WARNING   [$className]: $finalMessage';
    developer.log(finalMessage);
    App.events.logEvents?.onWarning(finalMessage);
  }

  static void log(dynamic issuer, String message, [Object? object])
  {
    String finalMessage = object != null ? '$message\n$object' : message;
    String className = (issuer is String) ? issuer : issuer.runtimeType.toString();
    finalMessage = 'INFO      [$className]: $finalMessage';
    developer.log(finalMessage);
    App.events.logEvents?.onLog(finalMessage);
  }
}