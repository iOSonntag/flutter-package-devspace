


part of devspace;

typedef Create<T extends GlueComponent> = T Function(BuildContext context);

class Glue<T extends GlueComponent> {

  static T get<T extends GlueComponent>(context)
  {
    return Provider.of<T>(context, listen: false);
  }

  static T getAndListen<T extends GlueComponent>(context)
  {
    return Provider.of<T>(context, listen: true);
  }


  final List<Type> dependsOn;
  final ChangeNotifierProvider<T> provider;
  final Type type = T;

  Glue({
    Key? key,
    required Create<T> create,
    this.dependsOn = const [],
  }) :
    provider = ChangeNotifierProvider<T>(create: create, lazy: false);

}