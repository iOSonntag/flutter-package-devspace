part of devspace;


class _ForegroundTimerRegistry {

  static final _ForegroundTimerRegistry _instance = _ForegroundTimerRegistry._internal();
  factory _ForegroundTimerRegistry() => _instance;
  _ForegroundTimerRegistry._internal();

  final List<ForegroundTimer> _timers = [];

  void register(ForegroundTimer timer)
  {
    _timers.add(timer);
  }

  void unregister(ForegroundTimer timer)
  {
    _timers.remove(timer);
  }

  void onAppResumed()
  {
    _timers.forEach((timer) {
      timer._resumeIfNeeded();
    });
  }

  void onAppPaused()
  {
    _timers.forEach((timer) {
      timer._pauseIfNeeded();
    });
  }


}

class ForegroundTimer {

  Timer? _timer;
  bool _wasPaused = false;
  void Function(ForegroundTimer timer)? _callback;
  Duration? _duration;

  ForegroundTimer(Duration duration, void Function(ForegroundTimer timer) callback)
  {
    _duration = duration;
    _callback = callback;

    _ForegroundTimerRegistry().register(this);
    _timer = Timer.periodic(duration, (timer) {
      callback(this);
    });
  }

  void dispose()
  {
    _ForegroundTimerRegistry().unregister(this);
    _timer?.cancel();
    _timer = null;
    _callback = null;
  }

  void _pauseIfNeeded()
  {
    if (_timer != null)
    {
      _timer!.cancel();
      _timer = null;
      _wasPaused = true;
    }
  }

  void _resumeIfNeeded()
  {
    if (_wasPaused)
    {
      _timer = Timer.periodic(_duration!, (timer) {
        _callback!(this);
      });
      _wasPaused = false;
    }
  }

}