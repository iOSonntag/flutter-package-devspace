


part of devspace;

extension ExtensionOnPotentiallyT<T> on T? {

  /// Check if the T is null
  bool get isNull => this == null;

  /// Check if the T is not null
  bool get isNotNull => this != null;
}

extension ExtensionOnT<T> on T {
  
  List<T> convertToList() => [this];
}
