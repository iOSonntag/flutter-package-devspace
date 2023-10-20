

part of devspace;




class MyService {

  MyService._();

  static void register<T extends CustomService>(T Function() createInstance, {List<Type>? dependsOn})
  {
    GetIt.instance.registerSingletonAsync<T>(() async
    {
      T instance = createInstance();

      await instance.initialize();

      return instance;
    },
      dispose: (instance) async
      {
          await instance.dispose();
      },
      dependsOn: dependsOn,
    );
  }

  static Future<void> registerAndWaitUntilReady<T extends CustomService>(T Function() createInstance) async
  {
    T instance = createInstance();

    await instance.initialize();

    GetIt.instance.registerSingleton<T>(instance);
  }


  static Future<void> ensureAllReady() async
  {
    await GetIt.instance.allReady();
  }



  static T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
    Type? type,
  })
  {
    return GetIt.instance.get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
      type: type,
    );
  }

  static T call<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
    Type? type,
  }) {
    return get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
      type: type,
    );
  }

}


abstract class CustomService {

  Future<void> initialize();
  Future<void> dispose();

}