part of devspace;



abstract class AppHelper {


  static Future<void> ensureAllTranslationKeysAreAvailable(List<Locale> forLocales, String assetDir) async
  {
    List<String> missingKeys = [];

    for (Locale locale in forLocales)
    {
      final localeFileKey = '${locale.languageCode}-${locale.countryCode}.json';

      final missingKeysForLocale = await _getMissingKeysForLocale(localeFileKey, assetDir);

      for (var missingKey in missingKeysForLocale)
      {
        missingKeys.add('$localeFileKey: $missingKey');
      }
    }

    if (missingKeys.isNotEmpty)
    {
      final missingKeysString = missingKeys.join('\n');
      final message = 'Missing translation keys:\n\n$missingKeysString';

      Dev.logError('AppHelper', message);
      throw Exception(message);
    }

  }

  static Future<List<String>> _getMissingKeysForLocale(String localeFileKey, String assetDir) async
  {
    final jsonString = await rootBundle.loadString('$assetDir/$localeFileKey');
    final localeKeys = json.decode(jsonString) as Map<String, dynamic>;

    final missingKeys = LibStrings.allKeys.where((key) => !localeKeys.containsKey(key)).toList();

    return missingKeys;
  }

}