


import 'dart:ui';

import 'package:gauge_indicator/gauge_indicator.dart';

// ignore: constant_identifier_names
const FIB_NUMBERS = [3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377];
// ignore: constant_identifier_names
const FIB_TOTAL = [3, 8, 16, 29, 50, 84, 139, 228, 372, 605, 982];

class GaugeMeterSegments {

  final double spacing;
  final List<GaugeSegment> segments;

  const GaugeMeterSegments({
    required this.spacing,
    required this.segments,
  });

  factory GaugeMeterSegments.empty({
    required Color backgroundColor,
    Radius cornerRadius = Radius.zero,
  })
  {
    return GaugeMeterSegments(
      spacing: 0.0,
      segments: [
        GaugeSegment(
          from: 0,
          to: 1,
          color: backgroundColor,
          cornerRadius: cornerRadius
        )
      ]
    );
  }

  factory GaugeMeterSegments.fibonacciReversed({
    required int segmentsCount,
    required Color backgroundColor,
    double spacing = 8.0,
    Radius cornerRadius = Radius.zero,
  })
  {
    List<GaugeSegment> segments = [];
    double from = 0.0;
    double to = 0.0;
    int fibTotal = FIB_TOTAL[segmentsCount - 1];

    for (int i = 0; i < segmentsCount; i++)
    {
      if (i == segmentsCount - 1)
      {
        to = 1;
      }
      else
      {
        int fibValue = FIB_NUMBERS[segmentsCount - i - 1];
        double percentage = fibValue / fibTotal;
        to = from + percentage;
      }

      segments.add(
        GaugeSegment(
          from: from,
          to: to,
          color: backgroundColor,
          cornerRadius: cornerRadius
        )
      );

      from = to;
    }

    return GaugeMeterSegments(
      spacing: spacing,
      segments: segments
    );
  }
}