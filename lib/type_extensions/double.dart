



part of devspace;


extension DoubleExtension on double {
  

  bool get chance
  {
    assert(this >= 0.0 && this <= 1.0);
    
    return math.Random().nextDouble() < this;
  }

  double toRadian()
  {
    return this / 180 * math.pi;
  }

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