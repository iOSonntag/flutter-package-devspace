part of devspace;


extension ExtensionOnMap<K, V> on Map {
  
  bool entryNotNull(K key)
  {
    return containsKey(key) && this[key] != null;
  }

  bool entryIsNull(K key)
  {
    return !entryNotNull(key);
  }

  T? ifNotNull<T>(K key, T Function(V) callback)
  {
    return entryNotNull(key) ? callback(this[key] as V) : null;
  }

  V? getOrNull(K key)
  {
    return this[key];
  }

  V getOrThrow(K key)
  {
    return this[key] ?? (throw Exception('Map value from key $key is required but is null. [Map.getOrThrow()]'));
  }

  V getOrDefault(K key, V defaultValue)
  {
    return this[key] ?? defaultValue;
  }

  
}