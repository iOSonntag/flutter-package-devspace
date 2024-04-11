part of devspace;


extension ExtensionOnMap<K, V> on Map {
  

  V? getOrNull(K key)
  {
    return this[key];
  }

  V getOrThrow(K key)
  {
    return this[key] ?? (throw Exception('$key is required'));
  }

  V getOrDefault(K key, V defaultValue)
  {
    return this[key] ?? defaultValue;
  }

  
}