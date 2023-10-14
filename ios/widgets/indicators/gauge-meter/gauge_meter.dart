


import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:iosite/_packages/ios/widgets/indicators/gauge-meter/gauge_meter_bar.dart';
import 'package:iosite/_packages/ios/widgets/indicators/gauge-meter/gauge_meter_segments.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:hexcolor/hexcolor.dart';


typedef GaugeMeterGetLabelText = String Function(double value);
typedef GaugeMeterLabelBuilder = Widget Function(BuildContext context, Size meterSize, double value);

class GaugeMeter extends StatelessWidget {

  final double circleDegrees;
  final Radius cornerRadius;
  final Color emptyBackgroundColor;
  final double initialValue;
  final double? value;
  final GaugeMeterSegments segments;
  final GaugeMeterBar bar;
  final GaugeMeterLabelBuilder? labelBuilder;

 GaugeMeter({
    super.key,
    this.circleDegrees = 270,
    this.initialValue = 0.0,
    this.value,
    this.cornerRadius = const Radius.circular(2),
    this.emptyBackgroundColor = const Color(0xFFD9DEEB),
    GaugeMeterSegments? segments,
    this.bar = const GaugeMeterBar.greenYellowRed(),
    GaugeMeterGetLabelText? labelText,
    GaugeMeterLabelBuilder? labelBuilder,
  }) : 
    segments = segments ?? GaugeMeterSegments.fibonacciReversed(
      segmentsCount: 6,
      backgroundColor: emptyBackgroundColor,
      cornerRadius: cornerRadius
    ),
    labelBuilder = labelBuilder ?? (labelText == null ? null : (context, meterSize, value) => Text(
      value.toStringAsFixed(2),
      style: TextStyle(
        // TODO: add background provider + onBackground color
        color: Colors.white,
        fontSize: (meterSize.height * 0.1).roundToDouble(),
        fontWeight: FontWeight.bold,
      ),
    )),
    assert(labelText == null || labelBuilder == null, "You cannot provide both labelText and labelBuilder");

  @override
  Widget build(BuildContext context)
  {
    return LayoutBuilder(
      builder: (context, constraints)
      {
        Size meterSize = _getMeterSize(constraints.maxWidth, constraints.maxHeight);
        
        double barThickness = (meterSize.height * 0.1).roundToDouble();
        double needleHeight = (meterSize.width / 2 * 1.2).roundToDouble();
        double needleWidth = needleHeight / 8;

        return AnimatedRadialGauge(
          duration: const Duration(seconds: 3),
          curve: Curves.elasticOut,
          initialValue: initialValue,
          value: value ?? initialValue,
          axis: GaugeAxis(
            degrees: circleDegrees,
            style: GaugeAxisStyle(
              thickness: barThickness,
              background: Colors.transparent,
              segmentSpacing: segments.spacing,
              cornerRadius: cornerRadius
            ),
            pointer: GaugePointer.needle(
              borderRadius: 2,
              width: needleWidth,
              height: needleHeight,
              color: const Color(0xFFD9DEEB),
              shadow: const Shadow(
                color: Color(0xbbffffff),
                blurRadius: 2.0
              ),
              border: const GaugePointerBorder(color: Color.fromARGB(50, 0, 0, 0), width: 1.0)
            ),
            progressBar: bar.progressBar,
            segments: segments.segments,
          ),
          builder: labelBuilder == null ? null : (context, child, value)
          {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [labelBuilder!(context, meterSize, value)]
            );
          },
        );
      }
    );
  }


  Size _getMeterSize(double maxWidth, double maxHeight)
  {
    double maxDimension = math.min(maxWidth, maxHeight);
    /// Target rect aspect ratio is determined by the saggita with
    /// some widget related constraints.
    /// Degrees needs to be in range of 10.0 - 360.0
    double degrees = circleDegrees.clamp(10.0, 360.0);

    const radiusFactor = 0.5;
    const width = 1.0;
    const halfWidth = width / 2;
    final heightFactor = getSagitta(degrees, radiusFactor);

    /// Bounding box aspect ratio cannot be smaller than half of the width.
    final height = math.max(halfWidth, heightFactor);

    double aspectRatio = width / height;

    return Size(maxDimension * aspectRatio, maxDimension);
  }

}

