


// ignore_for_file: non_constant_identifier_names

part of devspace;

extension GlueExtensionOnBuildContext on BuildContext {

  T getGlue<T extends GlueComponent> () => Glue.get(this);
  T getGlueAndListen<T extends GlueComponent> () => Glue.getAndListen(this);


}