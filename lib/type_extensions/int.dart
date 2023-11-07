



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


  List<T> generateItems<T>(T Function(int index) generator)
  {
    return List.generate(this, generator);
  }
}
