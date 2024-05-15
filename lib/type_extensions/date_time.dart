part of devspace;


extension ExtensionOnDateTime on DateTime {


  bool isToday({bool convertToLocal = false})
  {
    return isSameDay(DateTime.now(), convertToLocal: convertToLocal);
  }

  bool isYesterday({bool convertToLocal = false})
  {
    return isSameDay(DateTime.now().subtract(const Duration(days: 1)), convertToLocal: convertToLocal);
  }

  bool isSameDay(DateTime other, {bool convertToLocal = false})
  {
    DateTime thisDate = this;

    if (convertToLocal)
    {
      thisDate = toLocal();
      other = other.toLocal();
    }

    return thisDate.year == other.year && thisDate.month == other.month && thisDate.day == other.day;
  }


}