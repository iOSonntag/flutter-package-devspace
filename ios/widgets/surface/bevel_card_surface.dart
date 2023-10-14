

// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iosite/_packages/ios/widgets/surface/surface_base.dart';
import 'package:iosite/_packages/ios/widgets/surface/surface_edge_options.dart';


class BevelCardSurface extends StatelessWidget {

  final SurfaceEdgeOptions? edgeOptions;
  final Color? color;
  final Widget? child;

  const BevelCardSurface({
    super.key,
    this.edgeOptions,
    this.color,
    this.child
  });

  @override
  Widget build(BuildContext context)
  {
    return SurfaceBase(
      edgeOptions: edgeOptions, 
      builder: (context, finalizeChild)
      {
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: _generateColors(context)
            ),
          ),
          child: finalizeChild(context, child)
        );
      }
    );
  }

  List<Color> _generateColors(BuildContext context)
  {
    HSVColor centerColor = HSVColor.fromColor(color ?? Theme.of(context).colorScheme.surface);
    
    const TOP_MULTIPLIER = 1.8;
    const EDGE_STOP_FINAL_COLOR_PERCENTAGE = 0.333;
    const BOTTOM_MULTIPLIER = 0.5;

    const TOP_STOP_MULTIPLIER = 1.0 + (TOP_MULTIPLIER - 1.0) * EDGE_STOP_FINAL_COLOR_PERCENTAGE;
    const BOTTOM_STOP_MULTIPLIER = 1.0 - (1.0 - BOTTOM_MULTIPLIER) * EDGE_STOP_FINAL_COLOR_PERCENTAGE;
    const MAX_INITIAL_VALUE = 1.0 / TOP_MULTIPLIER - 0.01;
    const MIN_INITIAL_VALUE = 0.1;


    if (centerColor.value > MAX_INITIAL_VALUE)
    {
      centerColor = centerColor.withValue(MAX_INITIAL_VALUE);
    }
    else if (centerColor.value < MIN_INITIAL_VALUE)
    {
      centerColor = centerColor.withValue(MIN_INITIAL_VALUE);
    }

    return [
      centerColor.withValue(centerColor.value * TOP_MULTIPLIER).toColor(),
      centerColor.withValue(centerColor.value * TOP_STOP_MULTIPLIER).toColor(),
      centerColor.toColor(),
      centerColor.withValue(centerColor.value * BOTTOM_STOP_MULTIPLIER).toColor(),
      centerColor.withValue(centerColor.value * BOTTOM_MULTIPLIER).toColor(),
    ];
  }

}