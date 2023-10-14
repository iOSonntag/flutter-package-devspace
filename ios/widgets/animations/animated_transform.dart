



import 'package:flutter/material.dart';

class AnimatedTransform extends ImplicitlyAnimatedWidget {
  
  final Offset translation;
  final double rotation;
  final double scale;
  final double opacity;
  final Widget? child;


  const AnimatedTransform({
    super.key,
    super.curve = Curves.easeInOut,
    super.duration = const Duration(milliseconds: 300),
    super.onEnd,
    this.translation = Offset.zero,
    this.rotation = 0.0,
    this.scale = 1.0,
    this.opacity = 1.0,
    this.transform,
    this.child,
  });


  /// The transformation matrix to apply before painting the container.
  final Matrix4? transform;
  

  @override
  AnimatedWidgetBaseState<AnimatedTransform> createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends AnimatedWidgetBaseState<AnimatedTransform> {
  
  

  Tween<Offset>? _translation;
  Tween<double>? _rotation;
  Tween<double>? _scale;
  Tween<double>? _opacity;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor)
  {
    
    _translation = visitor(_translation, widget.translation, (dynamic value) => Tween<Offset>(begin: value as Offset)) as Tween<Offset>?;
    _rotation = visitor(_rotation, widget.rotation, (dynamic value) => Tween<double>(begin: value as double)) as Tween<double>?;
    _scale = visitor(_scale, widget.scale, (dynamic value) => Tween<double>(begin: value as double)) as Tween<double>?;
    _opacity = visitor(_opacity, widget.opacity, (dynamic value) => Tween<double>(begin: value as double)) as Tween<double>?;
  }

  @override
  Widget build(BuildContext context)
  {
    final Animation<double> animation = this.animation;
    
    return Transform.scale(
      scale: _scale?.evaluate(animation),
      child: Opacity(
        opacity: _opacity?.evaluate(animation) ?? 1.0,
        child: Transform.translate(
          offset: _translation?.evaluate(animation) ?? Offset.zero,
          child: Transform.rotate(
            angle: _rotation?.evaluate(animation) ?? 0.0,
            child: widget.child,
          ),
        ),
      ),
    );
  }


}