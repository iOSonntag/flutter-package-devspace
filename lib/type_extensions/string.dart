

part of devspace;

extension NullableStringExtension on String? {

  /// Adds a new line to the end of this string except for the first line.
  /// 
  /// If [preserveExplicitEmptyLines] is true, then explicit empty lines
  /// (lines containing only whitespace) will be preserved and a new line
  /// will be added to the end of the string.
  /// 
  /// If [preserveNewLinePrefix] is true, then the new line will be added
  /// to the end of the string even if the provided string contains a new
  /// line at the the start.
  String addLine(String other, {
    bool preserveExplicitEmptyLines = false,
    bool preserveNewLinePrefix = false,
  })
  {
    while (!preserveNewLinePrefix && other.startsWith('\n'))
    {
      other = other.substring(1);
    }

    if (isNullOrEmpty || (isNullOrTrimEmpty && !preserveExplicitEmptyLines))
    {
      return other;
    }

    String lastLine = _getThisOrEmpty().split('\n').last;

    if (lastLine.isNullOrTrimEmpty && !preserveExplicitEmptyLines)
    {
      return _getThisOrEmpty() + other;
    }

    return '${_getThisOrEmpty()}\n$other';
  }

  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;

  bool get isNullOrTrimEmpty => this == null || this!.trim().isEmpty;

  bool get isNotNullOrTrimEmpty => !isNullOrTrimEmpty;

  String _getThisOrEmpty() => this ?? '';

}

extension ExtensionOnString on String {

  static final RegExp _regExEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final RegExp _regExOnlyLettersAndNumbers = RegExp(r'^[A-Za-z0-9]+$');
  static final RegExp _regExPhoneNumber = RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');

  bool isValidEmail()
  {
    return _regExEmail.hasMatch(this);
  }

  bool isValidPhoneNumber()
  {
    return _regExPhoneNumber.hasMatch(this);
  }

  /// Use with care! Only accepts english letters
  bool isOnlyLettersAndNumbers()
  {
    return _regExOnlyLettersAndNumbers.hasMatch(this);
  }
}