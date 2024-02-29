



part of devspace;


extension DoubleExtension on double {
  

  bool get chance
  {
    assert(this >= 0.0 && this <= 1.0);
    
    return math.Random().nextDouble() < this;
  }

  /// Converts the double from degrees to radians.
  double toRadian()
  {
    return this / 180 * math.pi;
  }

  /// Converts the double from radians to degrees.
  double toDegree()
  {
    return this / math.pi * 180;
  }

  double clampAngleWithin()
  {
    if (this > math.pi) return this - 2 * math.pi;
    if (this < -math.pi) return this + 2 * math.pi;
    return this;
  }
}