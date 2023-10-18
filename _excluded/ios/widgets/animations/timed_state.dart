


import 'dart:async';

import 'package:flutter/material.dart';

typedef TimedStateBuilder<T> = Widget Function(BuildContext context, T value);

class TimedState<T> extends StatefulWidget {

  final Duration? initialDelay;
  final Duration duration;
  final bool loop;
  final List<T> values;
  final TimedStateBuilder<T> builder;

  const TimedState({
    super.key,
    this.initialDelay,
    required this.duration,
    this.loop = true,
    required this.values,
    required this.builder,
  });

  @override
  State<TimedState<T>> createState() => _TimedStateState<T>();
}

class _TimedStateState<T> extends State<TimedState<T>> {

  int _ticks = 0;

  @override
  void initState()
  {
    if (widget.initialDelay != null)
    {
      Timer(widget.initialDelay!, () {
        if (!mounted) return;
        _startTimer();
      });
    }
    else
    {
      _startTimer();
    }
    super.initState();
  }

  void _startTimer()
  {
    Timer.periodic(widget.duration, _timerTick);
  }

  void _timerTick(Timer timer)
  {
    if (!mounted)
    {
      timer.cancel();
      return;
    }

    if (!widget.loop && _ticks >= widget.values.length - 1)
    {
      timer.cancel();
      return;
    }

    setState(() { _ticks++; });
  }

  T _currentState()
  {
    if (widget.loop)
    {
      return widget.values[_ticks % widget.values.length];
    }
    else
    {
      return widget.values[_ticks.clamp(0, widget.values.length - 1)];
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return widget.builder(context, _currentState());
  }
}