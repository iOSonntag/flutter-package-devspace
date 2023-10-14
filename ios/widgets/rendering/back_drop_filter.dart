
import 'dart:ui' as ui show Color, Gradient, Image, ImageFilter, SceneBuilder, BackdropFilterEngineLayer, OpacityLayer, ImageFilterEngineLayer, OpacityEngineLayer;
import 'dart:ui';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';







class OpacityAwareBackdropFilter extends SingleChildRenderObjectWidget {
  /// Creates a backdrop filter.
  ///
  /// The [filter] argument must not be null.
  /// The [blendMode] argument will default to [BlendMode.srcOver] and must not be
  /// null if provided.
  const OpacityAwareBackdropFilter({
    super.key,
    required this.filter,
    super.child,
    this.blendMode = BlendMode.srcOver,
  });

  /// The image filter to apply to the existing painted content before painting the child.
  ///
  /// For example, consider using [ImageFilter.blur] to create a backdrop
  /// blur effect.
  final ui.ImageFilter filter;

  /// The blend mode to use to apply the filtered background content onto the background
  /// surface.
  ///
  /// {@macro flutter.widgets.BackdropFilter.blendMode}
  final BlendMode blendMode;

  @override
  RenderOpacityAwareBackdropFilter createRenderObject(BuildContext context) {
    return RenderOpacityAwareBackdropFilter(filter: filter, blendMode: blendMode);
  }

  @override
  void updateRenderObject(BuildContext context, RenderOpacityAwareBackdropFilter renderObject) {
    renderObject
      ..filter = filter
      ..blendMode = blendMode;
  }
}





/// Applies a filter to the existing painted content and then paints [child].
///
/// This effect is relatively expensive, especially if the filter is non-local,
/// such as a blur.
class RenderOpacityAwareBackdropFilter extends RenderProxyBox {
  /// Creates a backdrop filter.
  ///
  /// The [filter] argument must not be null.
  /// The [blendMode] argument, if provided, must not be null
  /// and will default to [BlendMode.srcOver].
  RenderOpacityAwareBackdropFilter({ RenderBox? child, required ui.ImageFilter filter, BlendMode blendMode = BlendMode.srcOver })
    : _filter = filter,
      _blendMode = blendMode,
      super(child);

  @override
  OpacityAwareBackdropFilterLayer? get layer => super.layer as OpacityAwareBackdropFilterLayer?;

  /// The image filter to apply to the existing painted content before painting
  /// the child.
  ///
  /// For example, consider using [ui.ImageFilter.blur] to create a backdrop
  /// blur effect.
  ui.ImageFilter get filter => _filter;
  ui.ImageFilter _filter;
  set filter(ui.ImageFilter value) {
    if (_filter == value) {
      return;
    }
    _filter = value;
    markNeedsPaint();
  }

  /// The blend mode to use to apply the filtered background content onto the background
  /// surface.
  ///
  /// {@macro flutter.widgets.BackdropFilter.blendMode}
  BlendMode get blendMode => _blendMode;
  BlendMode _blendMode;
  set blendMode(BlendMode value) {
    if (_blendMode == value) {
      return;
    }
    _blendMode = value;
    markNeedsPaint();
  }

  @override
  bool get alwaysNeedsCompositing => child != null;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      assert(needsCompositing);


      if (layer == null)
      {
        layer = OpacityAwareBackdropFilterLayer();
      }

      layer!.filter = _filter;
      layer!.blendMode = _blendMode;
    // final circle = rect.inflate(shadow.spreadRadius);
      // context.canvas.saveLayer(null, Paint());
      context.pushLayer(layer!, _painterCallback, offset);
      // context.canvas.restore();
      assert(() {
        layer!.debugCreator = debugCreator;
        return true;
      }());
    } else {
      layer = null;
    }
  }

  _painterCallback(PaintingContext context, Offset offset)
  {
    super.paint(context, offset);
  }

  //  @override
  //  bool get isRepaintBoundary => true;
}




/// A composited layer that applies a filter to the existing contents of the scene.
class OpacityAwareBackdropFilterLayer extends ContainerLayer {
  /// Creates a backdrop filter layer.
  ///
  /// The [filter] property must be non-null before the compositing phase of the
  /// pipeline.
  ///
  /// The [blendMode] property defaults to [BlendMode.srcOver].
  OpacityAwareBackdropFilterLayer({
    ui.ImageFilter? filter,
    BlendMode blendMode = BlendMode.srcOver,
  }) : _filter = filter,
       _blendMode = blendMode;

  /// The filter to apply to the existing contents of the scene.
  ///
  /// The scene must be explicitly recomposited after this property is changed
  /// (as described at [Layer]).
  ui.ImageFilter? get filter => _filter;
  ui.ImageFilter? _filter;
  set filter(ui.ImageFilter? value) {
    if (value != _filter) {
      _filter = value;
      markNeedsAddToScene();
    }
  }

  /// The blend mode to use to apply the filtered background content onto the background
  /// surface.
  ///
  /// The default value of this property is [BlendMode.srcOver].
  /// {@macro flutter.widgets.BackdropFilter.blendMode}
  ///
  /// The scene must be explicitly recomposited after this property is changed
  /// (as described at [Layer]).
  BlendMode get blendMode => _blendMode;
  BlendMode _blendMode;
  set blendMode(BlendMode value) {
    if (value != _blendMode) {
      _blendMode = value;
      markNeedsAddToScene();
    }
  }

  @override
  void addToScene(ui.SceneBuilder builder) {
    assert(filter != null);
    builder.pop();builder.pop();builder.pop();
    // builder.pushOpacity(
    //   40,
    //   oldLayer: engineLayer as ui.OpacityEngineLayer?,
    // );
    engineLayer = builder.pushBackdropFilter(
      filter!,
      blendMode: blendMode,
      oldLayer: engineLayer as ui.BackdropFilterEngineLayer?,
    );
    // this.markNeedsAddToScene();
    // builder.pushOpacity(
    //   40,
    //   // oldLayer: engineLayer as ui.OpacityEngineLayer?,
    // );
    // final parentLayer = parent as OpacityLayer;

    // if (parentLayer != null)
    // {
    //   parentLayer.addCompositionCallback((p0) 
    //   {
    //     final opacity = p0 as OpacityLayer;
    //     p0.alpha = 254;
    //     // builder.pop();
    //     // builder.pushOpacity(
    //     //   255,
    //     //   // oldLayer: engineLayer as ui.OpacityEngineLayer?,
    //     // );
    //   });
    // }
    addChildrenToScene(builder);
    builder.pop();
  }

  @override
  Scene buildScene(ui.SceneBuilder builder)
  {
    builder.pop();builder.pop();builder.pop();
    return super.buildScene(builder);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ui.ImageFilter>('filter', filter));
    properties.add(EnumProperty<BlendMode>('blendMode', blendMode));
  }
  @override
  bool supportsRasterization() => true;
}

///   @override
///   bool get isRepaintBoundary => true;