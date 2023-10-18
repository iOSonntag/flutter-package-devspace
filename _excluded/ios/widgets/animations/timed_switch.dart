


import 'package:flutter/material.dart';
import 'package:earthdock/_packages/ios/widgets/animations/timed_state.dart';

typedef TimedSwitchBuilder = Widget Function(BuildContext context, bool value);

class TimedSwitch extends StatelessWidget {

  final Duration? initialDelay;
  final Duration duration;
  final bool loop;
  final bool initialValue;
  final TimedSwitchBuilder builder;

  const TimedSwitch({
    super.key,
    this.initialDelay,
    required this.duration,
    this.loop = true,
    this.initialValue = false,
    required this.builder,
  });

  @override
  Widget build(BuildContext context)
  {
    return TimedState<bool>(
      initialDelay: initialDelay,
      duration: duration,
      loop: loop,
      values: [initialValue, !initialValue],
      builder: builder,
    );
  }
}