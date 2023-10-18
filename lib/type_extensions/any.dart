


part of devspace;

extension ExtensionT<T> on T {
  
  List<T> convertToList() => [this];

  /// Check if the T is null
  bool get isNull => this == null;

  /// Check if the T is not null
  bool get isNotNull => this != null;
}
