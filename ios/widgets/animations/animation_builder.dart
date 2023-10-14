
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_animations/animation_developer_tools/animation_developer_tools.dart';
import 'package:simple_animations/animation_mixin/animation_mixin.dart';
import 'package:simple_animations/simple_animations.dart';

import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


// void _buildAnimation() {
//     /// Chain tween with curve and connect it to the [AnimationController].
//     _animation = Tween().animate(AnimationController();
//   }


class ExtractedAnimation extends Animation<double> with AnimationWithParentMixin<Movie> {

  Animation<Movie> _parent;
  MovieTweenPropertyType _property;

  ExtractedAnimation({
    required Animation<Movie> parent,
    required MovieTweenPropertyType property,
  }) : _parent = parent, _property = property;

  @override
  Animation<Movie> get parent => _parent;

  @override
  double get value => parent.value.get(_property);

}


extension MovieAnimationExtension on Animation<Movie> {

  /// Create a new animation that can be used to feed a FadInTransition.
  /// 
  /// The animation will be a double that goes from 0 to 1.
  Animation<double> extractPropertyAnimation(MovieTweenPropertyType propertyType)
  {
    return ExtractedAnimation(parent: this, property: propertyType);
  }
  



}



// class MyMovieTween extends MovieTween {
  
  
//   MyMovieTween({Curve curve = Curves.linear}) : super(curve: curve);

//   @override
//   Movie transform(double t)
//   {
//     final propertyItems = <MovieTweenPropertyType, List<_AbsoluteSceneItem>>{};
//     final now = t * duration.inMicroseconds;
//     final valueMap = <MovieTweenPropertyType, dynamic>{};

//     final allItems = _generateAbsoluteItems();

//     /// Presort all items by begin.
//     allItems.sort((a, b) => a.begin - b.begin);

//     /// Group items by property.
//     for (var item in allItems) {
//       propertyItems.putIfAbsent(item.property, () => []);
//       propertyItems[item.property]!.add(item);
//     }

//     /// Transform each property for current time [t].
//     for (var property in propertyItems.keys) {
//       _transformProperty(propertyItems[property]!, property, now, valueMap);
//     }

//     return Movie(map: valueMap);
//   }

// }

// /// Representing a time span of a [MovieTween]. This class shouldn't be
// /// instanced by hand. It should be creating via [MovieTween.scene] or
// /// [MovieScene.thenFor] methods.
// class MovieScene {
//   final Duration begin;
//   final Duration duration;
//   final Curve? curve;
//   final MovieTween parent;

//   final items = <_SceneItem>[];

//   MovieScene({
//     required this.begin,
//     required this.duration,
//     required this.parent,
//     this.curve,
//   });

//   /// Animates a property and returns the implicitly created scene.
//   /// The scene can be used to add further properties to the scene or to
//   /// add further scenes to the movie.
//   MovieScene tween<T>(
//     /// Property to animate
//     MovieTweenPropertyType property,

//     //// Tween that describes the property animation
//     Animatable<T> tween, {

//     /// Custom curve for this property.
//     Curve? curve,

//     /// Shift the begin time by this amount.
//     Duration shiftBegin = Duration.zero,

//     /// Shift the end time by this amount.
//     Duration shiftEnd = Duration.zero,
//   }) {
//     assert(begin + shiftBegin >= Duration.zero, 'Effective begin must be > 0');

//     items.add(_SceneItem(
//       property: property,
//       tween: tween,
//       curve: curve,
//       shiftBegin: shiftBegin,
//       shiftEnd: shiftEnd,
//     ));
//     return this;
//   }

//   /// Animates a property and returns the implicitly created scene.
//   /// The scene can be used to add further properties to the scene or to
//   /// add further scenes to the movie.
//   MovieScene thenTween<T>(
//     /// Property to animate
//     MovieTweenPropertyType property,

//     //// Tween that describes the property animation.
//     Animatable<T> tween, {

//     /// Duration of the scene
//     required Duration duration,

//     /// Fine-tune the begin time of the next scene by adding a delay.
//     /// The value can also be negative.
//     Duration delay = Duration.zero,

//     /// Custom curve for this property.
//     Curve? curve,
//     Curve? sceneCurve,
//   }) {
//     return thenFor(duration: duration, delay: delay, curve: sceneCurve)
//         .tween(property, tween, curve: curve);
//   }

//   /// Adds an additional scene that begins immediately after this scene.
//   MovieScene thenFor({
//     /// Duration of the scene
//     required Duration duration,

//     /// Fine-tune the begin time of the next scene by adding a delay.
//     /// The value can also be negative.
//     Duration delay = Duration.zero,

//     /// Custom curve for this scene.
//     Curve? curve,
//   }) {
//     return parent.scene(
//       begin: begin + this.duration + delay,
//       duration: duration,
//       curve: curve,
//     );
//   }
// }

// class _SceneItem {
//   final MovieTweenPropertyType property;
//   final Animatable tween;
//   final Curve? curve;
//   final Duration shiftBegin;
//   final Duration shiftEnd;

//   _SceneItem({
//     required this.property,
//     required this.tween,
//     required this.shiftBegin,
//     required this.shiftEnd,
//     this.curve,
//   });
// }

// /// A snapshot of properties that are animated by a [MovieTween].
// /// This class can obtained by using [MovieTween.transform].
// class Movie {
//   final Map<MovieTweenPropertyType, dynamic> _map;

//   Movie({required Map<MovieTweenPropertyType, dynamic> map}) : _map = map;

//   /// Returns the value for a given [property].
//   V get<V>(MovieTweenPropertyType property) {
//     assert(_map.containsKey(property), 'Property $property was not found.');
//     return _map[property] as V;
//   }
// }

// class _AbsoluteSceneItem {
//   final MovieTweenPropertyType property;
//   final Animatable<dynamic> tween;
//   final Curve curve;
//   final int begin;
//   final int end;

//   _AbsoluteSceneItem({
//     required this.property,
//     required this.tween,
//     required this.curve,
//     required this.begin,
//     required this.end,
//   });
// }

// /// Any [Object] can act as a tween property.
// typedef MovieTweenPropertyType = Object;

// /// Type-safe tween property that can be used as a `const`.
// class MovieTweenProperty<T> {
//   MovieTweenProperty();

//   /// Returns the current value of this property.
//   T from(Movie movie) => movie.get(this);
// }





























// ignore: camel_case_types
/// Instruction for the [AnimationBuilder]
enum kAnimationInstruction {
  /// Stops the animation at the current position.
  stop,

  /// Plays the animation from the current position to the end.
  play,

  /// Plays the animation from the current position reverse to the start.
  playReverse,

  /// Resets the animation position to the beginning (`0.0`) and starts playing
  /// to the end.
  playFromStart,

  /// Resets the position of the animation to end (`1.0`) and starts playing
  /// backwards to the start.
  playReverseFromEnd,

  /// Endlessly plays the animation from the start to the end.
  loop,

  /// Endlessly plays the animation from the start to the end, then
  /// it plays reverse to the start, then forward again and so on.
  mirror,
}

/// A builder that plays a custom animation with a given [tween] and [duration].
/// It can be controlled with [control].
class AnimationBuilder<T> extends StatefulWidget {
  const AnimationBuilder({
    required this.builder,
    required this.tween,
    required this.duration,
    this.control = kAnimationInstruction.play,
    this.curve = Curves.linear,
    this.delay = Duration.zero,
    this.startPosition = 0.0,
    this.child,
    this.animationStatusListener,
    this.fps,
    this.developerMode = false,
    this.onStarted,
    this.onCompleted,
    Key? key,
  })  : assert(startPosition >= 0 && startPosition <= 1,
            'The property startPosition must have a value between 0.0 and 1.0.'),
        super(key: key);


  /// The [tween] to animate.
  final Animatable<T> tween;

  /// The [duration] of the animation.
  final Duration duration;

  /// Builds the animation frame.
  final ValueWidgetBuilder<Animation<T>> builder;

  /// The delay before the animation starts.
  final Duration delay;

  /// A child that's passed into the [builder] function.
  final Widget? child;

  /// The [curve] of the animation. By default it's [Curves.linear].
  final Curve curve;

  /// Limits the framerate of the animation if set.
  final int? fps;

  /// Connects to the closest [AnimationDeveloperTools] in the widget tree.
  final bool developerMode;

  /// Called when the animation starts.
  final VoidCallback? onStarted;

  /// Called when the animation completes.
  final VoidCallback? onCompleted;

  /// Current execution command of the animation.
  final kAnimationInstruction control;

  /// The relative position where the animation starts.
  /// The value must be between 0.0 and 1.0, where 0.0 is the beginning of the
  /// animation and 1.0 is the end of the animation.
  final double startPosition;

  /// Exposed [AnimationStatusListener] from the internal [AnimationController].
  final AnimationStatusListener? animationStatusListener;

  @override
  _AnimationBuilderState<T> createState() =>
      _AnimationBuilderState<T>();
}

class _AnimationBuilderState<T> extends State<AnimationBuilder<T>>
    with AnimationMixin {
  /// The [AnimationController] that controls the animation.
  late AnimationController _controller;

  /// The [Animation] that is driven by the [AnimationController].
  late Animation<T> _animation;

  /// Delay timer that is used to delay the execution of the control instruction.
  Timer? _delayTimer;

  /// Tracks if the mirror command is sent to the controller. This is used to
  /// prevent the animation from being mirror again, if the widget is rebuilt.
  var _isControlSetToMirror = false;

  /// Tracks if the animation is currently playing. This is used to properly
  /// send the [onStarted] and [onCompleted] callbacks.
  var _isPlaying = false;

  @override
  void initState() {
    /// Create the [AnimationController] instance
    _controller = createController(fps: widget.fps);
    _controller.value = widget.startPosition;
    _controller.duration = widget.duration;

    /// Connects tween with the [AnimationController].
    _buildAnimation();

    /// Register the [AnimationStatusListener]
    _controller.addStatusListener(_onAnimationStatus);

    /// Apply control instruction (e.g. play, stop, loop, mirror)
    var hasDelayDefined =
        widget.delay != Duration.zero && !widget.developerMode;
    if (hasDelayDefined) {
      /// If there is a delay defined, wait for the delay to finish and then
      /// apply the control instruction.
      _delayTimer = Timer(widget.delay, _applyControlInstruction);
    } else {
      /// If there is no delay defined, apply the control instruction directly.
      _applyControlInstruction();
    }

    super.initState();
  }

  @override
  void dispose() {
    _delayTimer?.cancel();

    super.dispose();
  }

  void _buildAnimation() {
    /// Chain tween with curve and connect it to the [AnimationController].
    _animation = widget.tween
        .chain(CurveTween(curve: widget.curve))
        .animate(_controller);

    /// If the developer mode is enabled, connect the [AnimationController]
    /// to the [AnimationDeveloperTools].
    if (widget.developerMode) {
      var transfer =
          context.findAncestorWidgetOfExactType<AnimationControllerTransfer>();
      assert(transfer != null,
          'Please place an AnimationDeveloperTools widget inside the widget tree');
      transfer?.controllerProvider(_controller);
    }
  }

  @override
  void didUpdateWidget(AnimationBuilder<T> oldWidget) {
    /// Duration might have changed, so update the [AnimationController]
    _controller.duration = widget.duration;

    /// Rebuild the animation because the [tween] and [curve] might have
    /// changed.
    _buildAnimation();

    /// Apply the control instruction because [control] might have changed.
    _applyControlInstruction();

    super.didUpdateWidget(oldWidget);
  }

  void _applyControlInstruction() async {
    /// States where no instruction is required.
    if (widget.developerMode) {
      return;
    }

    /// Stop
    if (widget.control == kAnimationInstruction.stop) {
      _trackPlaybackComplete();
      _controller.stop();
    }

    /// Play
    if (widget.control == kAnimationInstruction.play) {
      unawaited(_controller.play());
    }

    /// Play reverse
    if (widget.control == kAnimationInstruction.playReverse) {
      unawaited(_controller.playReverse());
    }

    /// Play from start
    if (widget.control == kAnimationInstruction.playFromStart) {
      unawaited(_controller.forward(from: 0.0));
    }

    /// Play reverse from end
    if (widget.control == kAnimationInstruction.playReverseFromEnd) {
      unawaited(_controller.reverse(from: 1.0));
    }

    /// Loop
    if (widget.control == kAnimationInstruction.loop) {
      unawaited(_controller.loop());
    }

    /// Mirror
    if ((widget.control == kAnimationInstruction.mirror) && !_isControlSetToMirror) {
      /// Keep track that the control is set to mirror. This is used to prevent
      /// the animation from being mirrored again, if the widget is rebuilt.
      _isControlSetToMirror = true;
      unawaited(_controller.mirror());
    }

    /// Reset mirror tracking if the control instruction is not mirror.
    if (widget.control != kAnimationInstruction.mirror) {
      _isControlSetToMirror = false;
    }
  }

  void _onAnimationStatus(AnimationStatus status) {
    /// Expose the [AnimationStatusListener] from the [AnimationController].
    widget.animationStatusListener?.call(status);

    /// Check the animation status and notify the listeners accordingly.
    if (status == AnimationStatus.forward ||
        status == AnimationStatus.reverse) {
      _trackPlaybackStart();
    } else if (status == AnimationStatus.dismissed ||
        status == AnimationStatus.completed) {
      _trackPlaybackComplete();
    }
  }

  /// Notify that the animation started.
  void _trackPlaybackStart() {
    if (!_isPlaying) {
      _isPlaying = true;
      widget.onStarted?.call();
    }
  }

  /// Notify that the animation completed.
  void _trackPlaybackComplete() {
    if (_isPlaying) {
      _isPlaying = false;
      widget.onCompleted?.call();
    }
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, _animation, widget.child);
}
