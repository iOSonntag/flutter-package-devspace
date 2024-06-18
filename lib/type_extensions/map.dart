part of devspace;


extension ExtensionOnMap<K, X> on Map {
  
  bool entryNotNull(K key)
  {
    return containsKey(key) && this[key] != null;
  }

  bool entryIsNull(K key)
  {
    return !entryNotNull(key);
  }

  T? ifNotNull<T, V>(K key, T Function(V) callback)
  {
    if (entryIsNull(key))
    {
      return null;
    }

    dynamic value = this[key];

    if (value is V)
    {
      return callback(value);
    }

    Dev.logWarning(this, 'Map value from key $key is not of type $V. Returning null instead. [Map.ifNotNull()]');

    return null;
  }

  V? getOrNull<V>(K key)
  {
    dynamic value = this[key];

    if (value == null || value is V)
    {
      return value;
    }

    Dev.logWarning(this, 'Map value from key $key is not of type $V. Returning null instead. [Map.getOrNull()]');
    
    return null;
  }

  V getOrThrow<V>(K key)
  {
    dynamic value = this[key];

    if (value == null)
    { 
      throw Exception('Map value from key $key is required but is null. [Map.getOrThrow()]');
    }

    if (value is V)
    {
      return value;
    }

    throw Exception('Map value from key $key is not of type $V. [Map.getOrThrow()]');
  }

  V getOrDefault<V>(K key, V defaultValue)
  {
    dynamic value = this[key];

    if (value == null)
    {
      return defaultValue;
    }

    if (value is V)
    {
      return value;
    }

    Dev.logWarning(this, 'Map value from key $key is not of type $V. Returning default value instead. [Map.getOrDefault()]');

    return defaultValue;
  }

  
}