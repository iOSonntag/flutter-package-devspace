


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

    if (isEmpty || (isEmptyTrim && !preserveExplicitEmptyLines))
    {
      return other;
    }

    String lastLine = _getThisOrEmpty().split('\n').last;

    if (lastLine.isEmptyTrim && !preserveExplicitEmptyLines)
    {
      return _getThisOrEmpty() + other;
    }

    return _getThisOrEmpty() + '\n' + other;
  }

  bool get isEmpty => this == null || this!.trim().isEmpty;

  bool get isEmptyTrim => this == null || this!.trim().isEmpty;

  bool get isNotEmptyTrim => !isEmptyTrim;

  String _getThisOrEmpty() => this ?? '';

}