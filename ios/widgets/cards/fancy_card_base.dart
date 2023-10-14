


import 'package:flutter/material.dart';
import 'package:iosite/_packages/ios/widgets/animations/hover_effect.dart';
import 'package:iosite/_packages/ios/widgets/surface/bevel_card_surface.dart';
import 'package:iosite/_packages/ios/widgets/surface/surface_edge_options.dart';
import 'package:hexcolor/hexcolor.dart';


class FancyCardBase extends StatelessWidget {

  const FancyCardBase({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context)
  {
    return HoverEffect(
      type: kHoverEffectType.special,
      convertToOverlayOnHover: true,
      child: BevelCardSurface(
          color: HexColor('#0a1529'),
          edgeOptions: SurfaceEdgeOptions(
            cornerRadius: BorderRadius.circular(16),
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: Offset.zero,
                // blurStyle: BlurStyle.outer,
              ),
            ]
          ),
        child: child,
      ),
    );


    
  }
}