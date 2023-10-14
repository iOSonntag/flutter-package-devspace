


import 'package:flutter/material.dart';

class SurfaceEdgeOptions {

  final BorderRadiusGeometry? cornerRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? shadows;
  final Clip? contentClipping;

  const SurfaceEdgeOptions({
    this.cornerRadius,
    this.margin,
    this.padding,
    this.shadows,
    this.contentClipping,
  });

  const SurfaceEdgeOptions.none() : this();


  // TODO: think about adding constraits as well


    // double? width,
    // double? height,
    // BoxConstraints? constraints

    // constraints =
    //     (width != null || height != null)
    //       ? constraints?.tighten(width: width, height: height)
    //         ?? BoxConstraints.tightFor(width: width, height: height)
    //       : constraints;
    //  assert(constraints == null || constraints.debugAssertIsValid()),
}