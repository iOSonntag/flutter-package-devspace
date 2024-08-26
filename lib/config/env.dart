

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


  static String get idLocalBecomesDev
  {
    return switch (environment)
    {
      kEnvironment.prod => 'prod',
      kEnvironment.stage => 'stage',
      kEnvironment.dev => 'dev',
      kEnvironment.local => 'dev',
    };
  }


  static String get id
  {
    return switch (environment)
    {
      kEnvironment.prod => 'prod',
      kEnvironment.stage => 'stage',
      kEnvironment.dev => 'dev',
      kEnvironment.local => 'local',
    };
  }


  static String chooseString({
    required String prod, 
    required String stage, 
    required String dev, 
    required String local
  }) 
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

  static String choosePlatformString({
    required bool throwOnNotSupplied,
    String? ios, 
    String? android,
    String? web,
    String? macos,
    String? windows,
    String? linux,
  }) 
  {
    if (kIsWeb)
    {
      if (web == null && throwOnNotSupplied)
      {
        throw Exception('Web platform string not supplied');
      }
      return web ?? '';
    }
    
    if (Platform.isIOS)
    {
      if (ios == null && throwOnNotSupplied)
      {
        throw Exception('iOS platform string not supplied');
      }
      return ios ?? '';
    }
    
    if (Platform.isAndroid)
    {
      if (android == null && throwOnNotSupplied)
      {
        throw Exception('Android platform string not supplied');
      }
      return android ?? '';
    }
    
    if (Platform.isMacOS)
    {
      if (macos == null && throwOnNotSupplied)
      {
        throw Exception('macOS platform string not supplied');
      }
      return macos ?? '';
    }
    
    if (Platform.isWindows)
    {
      if (windows == null && throwOnNotSupplied)
      {
        throw Exception('Windows platform string not supplied');
      }
      return windows ?? '';
    }
    
    if (Platform.isLinux)
    {
      if (linux == null && throwOnNotSupplied)
      {
        throw Exception('Linux platform string not supplied');
      }
      return linux ?? '';
    }
    

    throw Exception('Platform not supported');
  }

}