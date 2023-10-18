



import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:earthdock/_packages/flutter_spice_powder/common_data_types_powder/bool.dart';
import 'package:earthdock/_packages/ios/widgets/animations/animated_transform.dart';
import 'package:earthdock/_packages/ios/widgets/layout/convert_to_overlay.dart';


// ignore: camel_case_types
enum kHoverEffectType
{
  decent,
  special,
}

class HoverEffect extends StatefulWidget {

  final Duration duration;
  final MouseCursor cursor;
  final kHoverEffectType type;
  final bool convertToOverlayOnHover;
  final void Function()? onTap;
  final Widget child;

  const HoverEffect({
    super.key,
    this.type = kHoverEffectType.decent,
    this.convertToOverlayOnHover = false,
    this.duration = const Duration(milliseconds: 1000),
    this.cursor = SystemMouseCursors.click,
    this.onTap,
    required this.child,
  });

  @override
  State<HoverEffect> createState() => _HoverEffectState();
}

class _HoverEffectState extends State<HoverEffect> {

  bool _hovered = false;
  bool _isOverlay = false;

  @override
  Widget build(BuildContext context)
  {
    Widget child = _wrapWithTapIfNeeded(context, widget.child);

    child = _wrapWithAnimation(context, child);

    
    return ConvertToOverlay(
      enabled: _isOverlay && widget.convertToOverlayOnHover,
      child: MouseRegion(
        cursor: widget.cursor,
        onEnter: (event)
        {
          setState(() {
            _hovered = true;
            _isOverlay = true;
          });
        },
        onExit: (event)
        {
          setState(() {
            _hovered = false;
          });
        },
        child: child,
      ),
    );
  }

  void _animationDidEnd()
  {
    if (!_hovered)
    {
      setState(() {
        _isOverlay = false;
      });
    }
  }

  Widget _wrapWithTapIfNeeded(BuildContext context, Widget child)
  {
    if (widget.onTap != null)
    {
      return GestureDetector(
        onTap: widget.onTap,
        child: child,
      );
    }

    return child;
  }


  Widget _wrapWithAnimation(BuildContext context, Widget child)
  {
    if (widget.type == kHoverEffectType.special)
    {
      return _wrapWithSpecialAnimation(context, child);
    }

    return _wrapWithDecentAnimation(context, child);
  }

  Widget _wrapWithDecentAnimation(BuildContext context, Widget child)
  {
    return child.animate(
      target: _hovered.thenEither(1.0, 0.0),
      onComplete: (controller) => _animationDidEnd()
    ).shake(
      hz: 3.0,
      rotation: pi / 62,
      duration: widget.duration,
      curve: _hovered.thenEither(Curves.easeInOut, Curves.easeInOutCubicEmphasized),
    );
  }

  Widget _wrapWithSpecialAnimation(BuildContext context, Widget child)
  {
    return AnimatedTransform(
      duration: widget.duration * 0.3,
      curve: Curves.easeInOutCubicEmphasized,
      scale: _hovered.thenEither(1.1, 1.0),
      translation: _hovered.thenEither(const Offset(0.0, -20.0), Offset.zero),
      onEnd: _animationDidEnd,
      child: child.animate(
        target: _hovered.thenEither(1.0, 0.0)
      ).shimmer(
        size: 0.3,
        colors: [
          Colors.white.withOpacity(0.0),
          Colors.white.withOpacity(0.2),
          Colors.white.withOpacity(0.0),
        ],
        stops: [
          0.0,
          0.99,
          1.0,
        ],
        // angle: pi / 12,
        delay: widget.duration * 0.2,
        duration: widget.duration * 0.6,
        curve: Curves.easeInOut,
      ).shimmer(
        size: 0.2,
        color: Colors.white.withOpacity(0.1),
        // angle: pi / 12,
        delay: widget.duration * 0.3,
        duration: widget.duration * 0.5,
        curve: Curves.easeInOut,
      ).shimmer(
        size: 0.1,
        color: Colors.white.withOpacity(0.05),
        // angle: pi / 12,
        delay: widget.duration * 0.4,
        duration: widget.duration * 0.4,
        curve: Curves.easeInOut,
      ).animate(
        target: _hovered.thenEither(0.0, 1.0),
      // ).shimmer(
      //   size: 0.1,
      //   color: Colors.white.withOpacity(0.1),
      //   angle: pi / 90,
      //   delay: widget.duration * 0.8,
      //   duration: widget.duration * 0.2,
      //   curve: Curves.easeInOut,
      ),
    );
  }
}