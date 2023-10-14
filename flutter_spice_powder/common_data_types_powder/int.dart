



import 'dart:math';
import 'dart:ui';

import 'package:flutter_animate/flutter_animate.dart';

extension IntExtension on int {
  

  /// Returns a random integer in the range of [startValue] to [this] both values inclusive.
  /// 
  /// [startValue] defaults to 0. Can be negative.
  int randomize({int startValue = 0})
  {
    return Random().nextInt(this + 1 - startValue) + startValue;
  }





  // ignore: non_constant_identifier_names
  Duration get asDuration => Duration(milliseconds: this);
}
