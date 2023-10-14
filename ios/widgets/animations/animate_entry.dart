
import 'package:flutter/material.dart';
import 'package:iosite/_packages/flutter_spice_powder/common_data_types_powder/alignment.dart';
import 'package:iosite/_packages/flutter_spice_powder/common_data_types_powder/curve.dart';
import 'package:iosite/_packages/ios/widgets/animations/animation_builder.dart';
import 'package:simple_animations/simple_animations.dart';

typedef WidgetBuilder = Widget Function(BuildContext context, kEntryAnimationStatus status);

// ignore: camel_case_types
enum kEntryAnimationStatus
{
  notStartedYet,
  animateIn,
  animateOut,
  completed,
}

extension EntryAnimationStatusExtension on kEntryAnimationStatus
{
  bool get isNotStartedYet => this == kEntryAnimationStatus.notStartedYet;
  bool get isAnimateIn => this == kEntryAnimationStatus.animateIn;
  bool get isAnimateOut => this == kEntryAnimationStatus.animateOut;
  bool get isCompleted => this == kEntryAnimationStatus.completed;

  bool get isAnimating => isAnimateIn || isAnimateOut;
  bool get hasBeenStarted => !isNotStartedYet;
  bool get hasBeenShown => isCompleted || isAnimateOut;
}

class AnimateEntry extends StatefulWidget {
  /// The child to animate
  final WidgetBuilder builder;

  /// The delay before animating
  final Duration delay;

  /// The duration of the animation
  final Duration duration;

  /// The animation curve
  final Curve curve;

  /// The animation curve
  final Curve? curveOpacity;

  /// The state of visibility
  final bool visible;

  /// The initial opacity (goes from [opacity] to 1)
  final double opacity;

  /// The initial scale (goes from [scale] to 1)
  final double scale;

  /// The initial horizontal offset (goes from [xOffset] to 0)
  final double xOffset;

  /// The initial vertical offset (goes from [yOffset] to 0)
  final double yOffset;

  /// The initial angle
  final double angle;

  /// Default constructor (motionless by default)
  const AnimateEntry({
    super.key,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 1000),
    this.curve = Curves.easeInOut,
    this.curveOpacity,
    this.visible = true,
    this.opacity = 1,
    this.scale = 1,
    this.xOffset = 0,
    this.yOffset = 0,
    this.angle = 0,
    required this.builder,
  }) : assert(opacity >= 0 && opacity <= 1); // coverage:ignore-line

  /// Constructor making use of every animation by default except [angle] and [xOffset]
  const AnimateEntry.all({
    super.key,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 1000),
    this.curve = Curves.easeInOut,
    this.curveOpacity,
    this.visible = true,
    this.opacity = 0,
    this.scale = 0,
    this.xOffset = 0,
    this.yOffset = 150,
    this.angle = 0,
    required this.builder,
  });

  /// Opacity-only constructor
  const AnimateEntry.opacity({
    Key? key,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.ease,
    bool visible = true,
    double opacity = 0,
    required WidgetBuilder builder,
  }) : this(
          // coverage:ignore-line
          key: key,
          delay: delay,
          duration: duration,
          curve: curve,
          visible: visible,
          opacity: opacity,
          builder: builder,
        );

  /// Scale-only constructor
  const AnimateEntry.scale({
    Key? key,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 1000),
    Curve curve = Curves.easeInOut,
    bool visible = true,
    double scale = 0,
    required WidgetBuilder builder,
  }) : this(
          // coverage:ignore-line
          key: key,
          delay: delay,
          duration: duration,
          curve: curve,
          visible: visible,
          scale: scale,
          builder: builder,
        );

  /// Offset-only constructor
  const AnimateEntry.offset({
    Key? key,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 1000),
    Curve curve = Curves.easeInOut,
    bool visible = true,
    double xOffset = 0,
    double yOffset = 150,
    required WidgetBuilder builder,
  }) : this(
          // coverage:ignore-line
          key: key,
          delay: delay,
          duration: duration,
          curve: curve,
          visible: visible,
          xOffset: xOffset,
          yOffset: yOffset,
          builder: builder,
        );


  /// Offset-only constructor
  const AnimateEntry.appear({
    Key? key,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 1000),
    Curve curve = Curves.linearToEaseOut,
    Curve curveOpacity = Curves.easeIn,
    bool visible = true,
    double opacity = 0,
    double xOffset = 0,
    double yOffset = 150,
    required WidgetBuilder builder,
  }) : this(
          // coverage:ignore-line
          key: key,
          delay: delay,
          duration: duration,
          curve: curve,
          curveOpacity: curveOpacity,
          visible: visible,
          opacity: opacity,
          xOffset: xOffset,
          yOffset: yOffset,
          builder: builder,
        );


  factory AnimateEntry.dock({
    Key? key,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 1000),
    Curve curve = CurvesAdvanced.magnetic,
    Alignment from = Alignment.topLeft,
    double distance = 200.0,
    double rotations = 2.0,
    bool visible = true,
    required WidgetBuilder builder,
  })
  {
    double offsetX = distance * -from.x;
    double offsetY = distance * -from.y;

    // TODO: fix rotations
    rotations = from.isAD ? -rotations : rotations;

    // curve = Easing.emphasizedAccelerate;

    return AnimateEntry(
      key: key,
      delay: delay,
      duration: duration,
      curve: curve,
      curveOpacity:  Curves.easeInOut,
      angle: rotations,
      visible: visible,
      opacity: 0,
      xOffset: offsetX,
      yOffset: offsetY,
      builder: builder,
    );
  } 

  @override
  State<AnimateEntry> createState() => _AnimateEntryState();
}

class _AnimateEntryState extends State<AnimateEntry> {

  kEntryAnimationStatus _status = kEntryAnimationStatus.notStartedYet;

  bool _passedFirstFrame = false;

  @override
  void initState()
  {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _passedFirstFrame = true;
    });
  }

  void _onAnimationStatusChanged(AnimationStatus status)
  {
    switch (status)
    {
      case AnimationStatus.completed:
        _updateStatus(kEntryAnimationStatus.completed);
        break;
      case AnimationStatus.dismissed:
        _updateStatus(kEntryAnimationStatus.completed);
        break;
      case AnimationStatus.forward:
        _updateStatus(kEntryAnimationStatus.animateIn);
        break;
      case AnimationStatus.reverse:
        _updateStatus(kEntryAnimationStatus.animateOut);
        break;
    }
  }

  void _updateStatus(kEntryAnimationStatus status)
  {
    if (_status == status) return;

    _status = status;

    if (_passedFirstFrame)
    {
      setState(() => {});
    }

  }


  @override
  Widget build(BuildContext context)
  {
    final opacity = MovieTweenProperty<double>();
    final scale = MovieTweenProperty<double>();
    final offset = MovieTweenProperty<Offset>();
    final angle = MovieTweenProperty<double>();


    MovieTween tween = MovieTween()
      ..tween(opacity, Tween(begin: widget.opacity, end: 1.0),
          duration: widget.duration, curve: widget.curveOpacity ?? widget.curve)
      ..tween(scale, Tween(begin: widget.scale, end: 1.0),
          duration: widget.duration, curve: widget.curve)
      ..tween(offset, Tween(begin: Offset(widget.xOffset, widget.yOffset), end: Offset.zero),
          duration: widget.duration, curve: widget.curve)
      ..tween(angle, Tween(begin: widget.angle, end: 0.0),
          duration: widget.duration, curve: widget.curve);


    return AnimationBuilder<Movie>(
      control: widget.visible ? kAnimationInstruction.play : kAnimationInstruction.playReverse,
      delay: widget.delay,
      duration: tween.duration,
      tween: tween,
      // developerMode: true,
      animationStatusListener: _onAnimationStatusChanged,
      builder: (context, animation, child)
      { 
        final value = animation.value;

        return Transform.scale(
          scale: scale.from(value),
          child: FadeTransition(
            opacity: animation.extractPropertyAnimation(opacity),
            child: Transform.translate(
              offset: offset.from(value),
              child: Transform.rotate(
                angle: angle.from(value), 
                // child: widget.builder(context, _status),
                // child: ShaderMask(
                //   blendMode: BlendMode.srcOver,
                //   shaderCallback: (Rect bounds) {
                //     return RadialGradient(
                //       center: Alignment.topLeft,
                //       radius: 0.1,
                //       colors: <Color>[Colors.yellow.withOpacity(0.0), Colors.yellow.withOpacity(0.0)],
                //       tileMode: TileMode.decal,
                //     ).createShader(bounds);
                //   },
                //   child: widget.builder(context, _status)
                // )
                child: widget.builder(context, _status)
              ),
            ),
          ),
        );
      },
    );
  }
}