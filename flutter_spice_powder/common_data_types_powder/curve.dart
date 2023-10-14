


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iosite/_packages/flutter_spice_powder/common_data_types_powder/list.dart';


abstract class CurvesAdvanced {

  CurvesAdvanced._();

  static const Curve magnetic = LayeredCurve(
    layers: [
      CurveLayer(
        curve: Curves.linearToEaseOut,
        weight: 10.0,
      ),
      CurveLayer(
        curve: Curves.easeInOut,
        weight: 0.2,
        start: 0.7,
      ),
      CurveLayer(
        curve: Curves.easeIn,
        weight: 0.9,
        start: 0.7,
      ),
      // CurveLayer(
      //   curve: ElasticOutCurve(0.4),
      //   weight: 0.9,
      //   // start: 0.9,
      // ),
      // CurveLayer(
      //   curve: ElasticOutCurve(1.0),
      //   weight: 0.9,
      //   start: 0.9,
      // ),
    ],
  );

}

extension CurveExtension on Curve {
  
  Curve add(Curve other, {
    double weight = 1.0,
    double start = 0.0,
    double end = 1.0,
  })
  {
    Curve self = this;
    CurveLayer newLayer = CurveLayer(
      weight: weight,
      start: start,
      end: end,
      curve: other,
    );

    if (self is LayeredCurve)
    {
      self.addLayer(newLayer);

      return self.copy();
    }
    
    return LayeredCurve(
      layers: [
        CurveLayer(curve: self),
        newLayer,
      ],
    );
  }

}

class CurveLayer {
  
  final Curve curve;
  final double weight;
  final double start;
  final double end;

  const CurveLayer({
    required this.curve,
    this.weight = 1.0,
    this.start = 0.0,
    this.end = 1.0,
  }) : assert(start >= 0.0 && start <= 1.0), assert(end >= 0.0 && end <= 1.0), assert(start < end), assert(weight > 0.0);

  const CurveLayer.firstHalf({
    required this.curve,
    this.weight = 1.0,
  }) : start = 0.0, end = 0.5;

  const CurveLayer.secondHalf({
    required this.curve,
    this.weight = 1.0,
  }) : start = 0.5, end = 1.0;

  const CurveLayer.firstThird({
    required this.curve,
    this.weight = 1.0,
  }) : start = 0.0, end = 0.33;

  const CurveLayer.secondThird({
    required this.curve,
    this.weight = 1.0,
  }) : start = 0.33, end = 0.66;

  const CurveLayer.lastThird({
    required this.curve,
    this.weight = 1.0,
  }) : start = 0.66, end = 1.0;

  double transform(double t)
  {
    if (isFullDuration)
    {
      return curve.transform(t);
    }

    if (t <= start)
    {
      return 0.0;
    }
    
    if (t >= end)
    {
      return 1.0;
    }

    double percentage = end - start;
    double subT = t - start;
    double subTNormalized = subT / percentage;

    return curve.transform(subTNormalized);
  }

  bool get isFullDuration => start == 0.0 && end == 1.0;
}

class LayeredCurve extends Curve {
  
  final List<CurveLayer> _layers;

  const LayeredCurve({
    List<CurveLayer> layers = const [],
  }) : _layers = layers;

  void addLayer(CurveLayer layer)
  {
    _layers.add(layer);
  }

  @override
  double transformInternal(double t)
  {
    double value = 0.0;
    double overallWeight = 0.0;
    
    for (CurveLayer fiLayer in _layers)
    {
      value += fiLayer.transform(t) * fiLayer.weight;
      overallWeight += fiLayer.weight;
    }

    value /= overallWeight;


    return value;
  }

  Curve copy()
  {
    return LayeredCurve(
      layers: _layers.copy(),
    );
  }

}