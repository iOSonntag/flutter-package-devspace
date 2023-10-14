



import 'dart:math';


extension DoubleExtension on double {
  

  bool get chance
  {
    assert(this >= 0.0 && this <= 1.0);
    
    return Random().nextDouble() < this;
  }

  double toRadian()
  {
    return this / 180 * pi;
  }

  double toDegree()
  {
    return this / pi * 180;
  }

  double clampAngleWithin()
  {
    if (this > pi) return this - 2 * pi;
    if (this < -pi) return this + 2 * pi;
    return this;
  }
}