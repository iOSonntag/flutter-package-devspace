
import 'dart:math' as math;

import 'package:flutter/material.dart';

extension OffsetExtension on Offset {

  Alignment toAlignment()
  {
    Offset normalized = normalize();

    return Alignment(normalized.dx, normalized.dy);
  }

  Offset normalize()
  {
    double dxAbs = dx.abs();
    double dyAbs = dy.abs();
    
    if (dxAbs > dyAbs)
    {
      return Offset(dx.sign, dy / dxAbs);
    }
    else
    {
      return Offset(dx / dyAbs, dy.sign);
    }
  }

}