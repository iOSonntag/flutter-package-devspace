



part of devspace;

extension IntExtension on int {
  

  /// Returns a random integer in the range of [startValue] to [this] both values inclusive.
  /// 
  /// [startValue] defaults to 0. Can be negative.
  int randomize({int startValue = 0})
  {
    return math.Random().nextInt(this + 1 - startValue) + startValue;
  }





  // ignore: non_constant_identifier_names
  /// Returns a [Duration] with the value of this integer in milliseconds.
  Duration get asDuration => Duration(milliseconds: this);

  Future<void> delay() async
  {
    await Future.delayed(asDuration);
  }


  List<T> generateItems<T>(T Function(int index) generator)
  {
    return List.generate(this, generator);
  }


  /// Converts the int from degrees to radians.
  double toRadian()
  {
    return toDouble().toRadian();
  }

  /// Creates a string with the int value and adds a seperator every 3 digits.
  String toThousandSeperatedString({
    required String seperator,
  })
  {
    String value = toString();

    if (value.length <= 3)
    {
      return value;
    }

    String result = '';

    int index = 0;

    for (int i = value.length - 1; i >= 0; i--)
    {
      result = value[i] + result;

      index++;

      if (index % 3 == 0 && i != 0)
      {
        result = seperator + result;
      }
    }

    return result;
  }
}
