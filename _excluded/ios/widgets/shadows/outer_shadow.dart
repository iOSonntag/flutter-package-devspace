


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OuterShadow extends SingleChildRenderObjectWidget {
  
  final BorderRadiusGeometry? borderRadius;
  final bool childMightBeTransparent;
  final List<BoxShadow> shadows;

  const OuterShadow({
    super.key,
    this.borderRadius,
    this.childMightBeTransparent = false,
    required this.shadows,
    super.child,
  });

  @override
  RenderOuterShadow createRenderObject(BuildContext context)
  {
    return RenderOuterShadow(
      borderRadius: borderRadius,
      childMightBeTransparent: childMightBeTransparent,
      shadows: shadows,
      configuration: createLocalImageConfiguration(context),
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderOuterShadow renderObject)
  {
    renderObject
    ..borderRadius = borderRadius
    ..childMightBeTransparent = childMightBeTransparent
    ..shadows = shadows
    ..configuration = createLocalImageConfiguration(context);
  }

  // TODO: add
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties)
  // {
  //   super.debugFillProperties(properties);
  //   properties.add(EnumProperty<DecorationPosition>('position', position, level: DiagnosticLevel.hidden));
  //   properties.add(DiagnosticsProperty<Decoration>(label, shadows));
  // }
}



class RenderOuterShadow extends RenderProxyBox {
  
  RenderOuterShadow({
    required BorderRadiusGeometry? borderRadius,
    required bool childMightBeTransparent,
    required List<BoxShadow> shadows,
    ImageConfiguration configuration = ImageConfiguration.empty,
    RenderBox? child,
  }) : 
    _borderRadius = borderRadius,
    _childMightBeTransparent = childMightBeTransparent,
    _shadows = shadows,
    _configuration = configuration,
    super(child);

  BoxPainter? _painter;

  List<BoxShadow> get shadows => _shadows;
  List<BoxShadow> _shadows;
  set shadows(List<BoxShadow> value)
  {
    if (value == _shadows)
    {
      return;
    }
    _painter?.dispose();
    _painter = null;
    _shadows = value;
    markNeedsPaint();
  }


  BorderRadiusGeometry? get borderRadius => _borderRadius;
  BorderRadiusGeometry? _borderRadius;
  set borderRadius(BorderRadiusGeometry? value)
  {
    if (value == _borderRadius)
    {
      return;
    }
    _painter?.dispose();
    _painter = null;
    _borderRadius = value;
    markNeedsPaint();
  }

  bool get childMightBeTransparent => _childMightBeTransparent;
  bool _childMightBeTransparent;
  set childMightBeTransparent(bool value)
  {
    if (value == _childMightBeTransparent)
    {
      return;
    }
    _painter?.dispose();
    _painter = null;
    _childMightBeTransparent = value;
    markNeedsPaint();
  }


  /// The settings to pass to the decoration when painting, so that it can
  /// resolve images appropriately. See [ImageProvider.resolve] and
  /// [BoxPainter.paint].
  ///
  /// The [ImageConfiguration.textDirection] field is also used by
  /// direction-sensitive [Decoration]s for painting and hit-testing.
  ImageConfiguration get configuration => _configuration;
  ImageConfiguration _configuration;
  set configuration(ImageConfiguration value)
  {
    if (value == _configuration) {
      return;
    }
    _configuration = value;
    markNeedsPaint();
  }


  @override
  void detach()
  {
    _painter?.dispose();
    _painter = null;
    super.detach();
    // Since we're disposing of our painter, we won't receive change
    // notifications. We mark ourselves as needing paint so that we will
    // resubscribe to change notifications. If we didn't do this, then, for
    // example, animated GIFs would stop animating when a DecoratedBox gets
    // moved around the tree due to GlobalKey reparenting.
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset)
  {
    _painter ??= _OuterShadowPainter(borderRadius, childMightBeTransparent, shadows, markNeedsPaint);

    final ImageConfiguration filledConfiguration = configuration.copyWith(size: size);

    _painter!.paint(context.canvas, offset, filledConfiguration);

    context.setIsComplexHint();
    super.paint(context, offset);



    // if (position == DecorationPosition.foreground) {
    //   _painter!.paint(context.canvas, offset, filledConfiguration);
    //   if (decoration.isComplex) {
    //     context.setIsComplexHint();
    //   }
    // }
  }

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(_decoration.toDiagnosticsNode(name: 'decoration'));
  //   properties.add(DiagnosticsProperty<ImageConfiguration>('configuration', configuration));
  // }

}



extension _BoxShadowExtension on BoxShadow {

  Paint toPaintWithTransparentChild() {
    final Paint result = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(blurStyle, blurSigma);
    assert(() {
      if (debugDisableShadows) {
        result.maskFilter = null;
      }
      return true;
    }());
    return result;
  }

}



class _OuterShadowPainter extends BoxPainter {

  final BorderRadiusGeometry? _borderRadius;
  final bool _childMightBeTransparent;
  final List<BoxShadow> _shadows;

  _OuterShadowPainter(this._borderRadius, this._childMightBeTransparent, this._shadows, super.onChanged);


  void _paintBox(Canvas canvas, Rect rect, Rect shadowBounds, Paint paint, TextDirection? textDirection)
  {
    if (_borderRadius == null || _borderRadius == BorderRadius.zero)
    {
      canvas.drawRect(shadowBounds, paint);
    }
    else
    {
      canvas.drawRRect(_borderRadius!.resolve(textDirection).toRRect(shadowBounds), paint);
    }
  }

  void _paintShadows(Canvas canvas, Rect rect, TextDirection? textDirection)
  {
    for (final BoxShadow fiShadow in _shadows)
    {
      final Rect bounds = rect.shift(fiShadow.offset).inflate(fiShadow.spreadRadius);
      final Paint paint = _childMightBeTransparent ? fiShadow.toPaintWithTransparentChild() : fiShadow.toPaint();
      _paintBox(canvas, rect, bounds, paint, textDirection);
    }
  }


  

  /// Paint the box decoration into the given location on the given canvas.
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration)
  {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection? textDirection = configuration.textDirection;

    _paintShadows(canvas, rect, textDirection);
  }

  @override
  String toString()
  {
    return 'OuterShadowPainter for $_shadows';
  }
}
