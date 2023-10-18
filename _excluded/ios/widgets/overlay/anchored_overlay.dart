




import 'package:flutter/cupertino.dart';
import 'package:earthdock/_packages/ios/widgets/overlay/overlay_builder.dart';
import 'package:earthdock/_packages/ios/widgets/overlay/overlay_widget.dart';

class AnchoredOverlay extends StatelessWidget {

  final bool showOverlay;
  final Widget Function(BuildContext, Rect anchorBounds) buildOverlay;
  final Widget? child;

  const AnchoredOverlay({
    super.key,
    this.showOverlay = false,
    required this.buildOverlay,
    this.child,
  });

  @override
  Widget build(BuildContext context)
  {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints)
        {
          // return OverlayWidget(
          //   show: showOverlay,
          //   buildOverlay: (overlayContext)
          return OverlayBuilder(
            showOverlay: showOverlay,
            overlayBuilder: (overlayContext)
            {
              RenderBox parentBox = context.findRenderObject() as RenderBox;
              final topLeft = parentBox.size.topLeft(parentBox.localToGlobal(const Offset(0.0, 0.0)));
              final bottomRight = parentBox.size.bottomRight(parentBox.localToGlobal(const Offset(0.0, 0.0)));
              final Rect anchorBounds = Rect.fromLTRB(topLeft.dx, topLeft.dy, bottomRight.dx, bottomRight.dy);
    
              return buildOverlay(overlayContext, anchorBounds);
            },
            child: child ?? SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
