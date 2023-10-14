


import 'package:flutter/material.dart';
import 'package:iosite/_packages/ios/widgets/shadows/outer_shadow.dart';
import 'package:iosite/_packages/ios/widgets/surface/surface_edge_options.dart';


extension _SurfaceEdgeOptionsExtension on SurfaceEdgeOptions {

  bool get needsBoxDecorationWidget
  {
    return false;
  }

  bool get needsContentClipper
  {
    return cornerRadius != null || (contentClipping != null && contentClipping != Clip.none);
  }

}

typedef SurfaceFinalizeChild = Widget Function(BuildContext context, Widget? child);
typedef SurfaceBuilder = Widget Function(BuildContext context, SurfaceFinalizeChild finalizeChild);

class SurfaceBase extends StatelessWidget {

  final SurfaceEdgeOptions edgeOptions;
  final SurfaceBuilder builder;
  final BoxDecoration? decoration;

  SurfaceBase({
    super.key,
    SurfaceEdgeOptions? edgeOptions,
    required this.builder,
  }) : 
    edgeOptions = edgeOptions ?? const SurfaceEdgeOptions.none(),
    decoration = edgeOptions == null || edgeOptions.needsBoxDecorationWidget == false ? null : const BoxDecoration();


  Widget _finalChildWrapper(BuildContext context, Widget? child)
  {
    final EdgeInsetsGeometry? effectivePadding = _paddingIncludingDecoration;

    Widget? current = child;

    if (effectivePadding != null)
    {
      current = Padding(padding: effectivePadding, child: current);
    }

    return current!;
  }

  @override
  Widget build(BuildContext context)
  {
    Widget current = builder(context, _finalChildWrapper);

    if (edgeOptions.needsContentClipper)
    {
      if (edgeOptions.cornerRadius != null)
      {
        assert(edgeOptions.contentClipping != Clip.none, 'Cannot use cornerRadius and contentClipping Clip.none together');

        current = ClipRRect(
          borderRadius: edgeOptions.cornerRadius!,
          clipBehavior: edgeOptions.contentClipping ?? Clip.antiAlias,
          child: current,
        );
      }
      else
      {
        current = ClipRect(
          clipBehavior: edgeOptions.contentClipping!,
          child: current,
        );
      }
    }


    if (edgeOptions.shadows != null && edgeOptions.shadows!.isNotEmpty)
    {
      current = OuterShadow(
        borderRadius: edgeOptions.cornerRadius,
        shadows: edgeOptions.shadows!,
        childMightBeTransparent: true,
        child: current
      );
    }

    if (edgeOptions.margin != null)
    {
      current = Padding(padding: edgeOptions.margin!, child: current);
    }

    return current;
  }



  EdgeInsetsGeometry? get _paddingIncludingDecoration
  {
    if (decoration == null)
    {
      return edgeOptions.padding;
    }

    final EdgeInsetsGeometry decorationPadding = decoration!.padding;

    if (edgeOptions.padding == null)
    {
      return decorationPadding;
    }
    return edgeOptions.padding!.add(decorationPadding);
  }
}
