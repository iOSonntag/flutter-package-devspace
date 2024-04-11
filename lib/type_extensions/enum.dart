

part of devspace;

abstract class EnumTool {

  EnumTool._();

  static T fromString<T extends Enum>(List<T> enumValues, String value)
  {
    return enumValues.firstWhere((type) => EnumTool.enumToStringValue(type) == value,
      orElse: () => throw Exception('Unknown enum value: $value')
    );
  }

  static String enumToStringValue<T extends Enum>(T enumValue)
  {
    return enumValue.toString().split('.').last;
  }
}

extension ExtensionOnEnum on Enum {

  /// Returns the localized name of the enum value.
  /// 
  /// This only works if the localization key is present in the localization
  /// files. 
  /// The localization key is generated from the enum value.
  /// 
  /// Example:
  /// 
  /// ```dart
  /// enum kEnumType {
  ///  someValue
  /// }
  /// 
  /// const String localizationKey = 'ENUM_kEnumType_someValue_name;
  /// ```
  String get localizedName
  {
    String enumKey = _generateEnumKey();
    
    return 'ENUM_${enumKey}_name'.tr();
  }


  /// Returns the localized description of the enum value.
  /// 
  /// This only works if the localization key is present in the localization
  /// files. 
  /// The localization key is generated from the enum value.
  /// 
  /// Example:
  /// 
  /// ```dart
  /// enum kEnumType {
  ///  someValue
  /// }
  /// 
  /// const String localizationKey = 'ENUM_kEnumType_someValue_description;
  /// ```
  String get localizedDescription
  {
    String enumKey = _generateEnumKey();
    
    return 'ENUM_${enumKey}_description'.tr();
  }

  // TODO: move as mixin or something becuase this is a unsecure way to rely on the localization files

  /// Returns the localized error message that the enum value represents. Note
  /// that if there should be no error, localize to the value 'NO_ERROR'.
  /// 
  /// This only works if the localization key is present in the localization
  /// files. 
  /// The localization key is generated from the enum value.
  /// 
  /// Example:
  /// 
  /// ```dart
  /// enum kEnumType {
  ///  someValue
  /// }
  /// 
  /// const String localizationKey = 'ENUM_ERROR_kEnumType_someValue_Message;
  /// ```
  String? get localizedErrorMessage
  {
    String enumKey = _generateEnumKey();

    String localizationKey = 'ENUM_ERROR_${enumKey}_message';

    String errorMessage = localizationKey.tr();
    
    if (errorMessage == 'NO_ERROR')
    {
      return null;
    }
    else
    {
      return errorMessage;
    }
  }


  /// A enum value of format 'kEnumType.someKey' will be converted to
  /// 'kEnumType_someKey' which then can be used as a localization key.
  String _generateEnumKey()
  {
    // 'kEnumType.someKey'
    final stringRepresentation = toString();

    // ['kEnumType', 'someKey']
    final enumParts = stringRepresentation.split('.');

    if (enumParts.length != 2)
    {
      throw Exception('Critical - Malformed enum: $stringRepresentation');
    }

    // 'enum_kDocumentType_image'
    return '${enumParts[0]}_${enumParts[1]}';
  }


  /// Use this method when trying to convert an enum value to a string and
  /// storing it in a database or sending it over the network.
  String toStringValue()
  {
    return EnumTool.enumToStringValue(this);
  }
}
