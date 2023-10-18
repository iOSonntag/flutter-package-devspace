

part of devspace;

// ignore: camel_case_types
enum kEnvironment
{
  prod,
  stage,
  dev,
  local,
}

abstract class Env {

  Env._();

  static const stringValue = String.fromEnvironment('ENVIRONMENT', defaultValue: 'dev');

  static final kEnvironment environment = kEnvironment.values.firstWhere(
    (e) => e.toString().split('.')[1] == stringValue,
    orElse: () => kEnvironment.dev,
  );

  static bool get isProd => environment == kEnvironment.prod;
  static bool get isStage => environment == kEnvironment.stage;
  static bool get isDev => environment == kEnvironment.dev;
  static bool get isLocal => environment == kEnvironment.local;


  static String chooseString({required String prod, required String stage, required String dev, required String local}) 
  {
    switch (environment)
    {
      case kEnvironment.prod:
        return prod;
      case kEnvironment.stage:
        return stage;
      case kEnvironment.dev:
        return dev;
      case kEnvironment.local:
        return local;
      default:
        return dev;
    }
  }

}