

import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:earthdock/_packages/ios/widgets/surface/surface_base.dart';
import 'package:earthdock/_packages/ios/widgets/surface/surface_edge_options.dart';


class GlassSurface extends StatelessWidget {

  final SurfaceEdgeOptions? edgeOptions;
  final Widget? child;

  const GlassSurface({
    super.key,
    this.edgeOptions,
    this.child
  });

  @override
  Widget build(BuildContext context)
  {
    
    return SurfaceBase(
      edgeOptions: edgeOptions, 
      builder: (context, finalizeChild)
      {
        double blur = 15;

        // return BackdropFilter(
        //   blendMode: BlendMode.src,
        //   filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        //   child: finalizeChild(child),
        // );
        return Stack(
          children: [
            finalizeChild(context, child),
            Positioned.fill(
              child: BackdropFilter(
                blendMode: BlendMode.dstOver,
                filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                child: finalizeChild(context, child)
              ),
            ),
          ],
        );


        return Stack(
          children: [
            finalizeChild(context, child),
            Positioned.fill(
              child: BackdropFilter(
                blendMode: BlendMode.src,
                filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                child: Container(
                  color: Colors.transparent,
                )
              ),
            ),
          ],
        );

        return Container(
          child: finalizeChild(context, child),
        );
      }
    );
  }

  Widget _build(BuildContext context)
  {
    return Container(
      
    ).frosted();
  }
}