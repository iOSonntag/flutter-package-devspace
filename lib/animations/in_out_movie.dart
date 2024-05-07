part of devspace;

typedef CreateMovieTween = MovieTween Function(NullableMovie currentValues);

class InOutMovie extends StatefulWidget {

  final MovieTween? intro;
  final VoidCallback? onIntroCompleted;

  final MovieTween? stay;

  final bool playOutro;
  final CreateMovieTween? onCreateOutro;
  final VoidCallback? onOutroCompleted;

  final Widget? child;
  final bool developerMode;
  final ValueWidgetBuilder<NullableMovie> builder;

  const InOutMovie({
    super.key,
    this.intro,
    this.onIntroCompleted,
    this.stay,
    this.playOutro = false,
    this.onCreateOutro,
    this.onOutroCompleted,
    this.child,
    this.developerMode = false,
    required this.builder,
  });

  @override
  State<InOutMovie> createState() => _InOutMovieState();
}

class _InOutMovieState extends State<InOutMovie> {

  int _currentPhase = 0;
  int? _currentPlayIndex = 0;
  MovieTween? _outro;
  NullableMovie? _currentMovie;

  @override
  void initState()
  {
    super.initState();

    if (widget.intro == null)
    {
      _currentPhase = 1;
      _currentPlayIndex = 1;

      if (widget.stay == null)
      {
        _currentPlayIndex = null;
      }
    }
  }


  @override
  void didUpdateWidget(InOutMovie oldWidget)
  {
    super.didUpdateWidget(oldWidget);

    if (widget.playOutro != oldWidget.playOutro)
    {
      if (!widget.playOutro)
      {
        throw Exception('playOutro cannot be set to false after it was set to true.');
      }

      if (widget.onCreateOutro == null)
      {
        throw Exception('Outro movie is required to play outro');
      }

      _outro = widget.onCreateOutro!(_currentMovie ?? NullableMovie.empty);

      setState(()
      {

        _currentPhase = 2;
        _currentPlayIndex = 2;
      });
    }
  }

  void _onCompleted(int index)
  {
    if (_currentPhase == 0)
    {
      if (widget.onIntroCompleted != null)
      {
        widget.onIntroCompleted!();
      }

      setState(()
      {
        _currentPhase = 1;
        _currentPlayIndex = widget.stay == null ? null : 1;
      });
    }
    else if (_currentPhase == 2)
    {
      if (widget.onOutroCompleted != null)
      {
        widget.onOutroCompleted!();
      }
    }
  }


  @override
  Widget build(BuildContext context)
  {
    return MovieOrchestra(
      playIndex: _currentPlayIndex,
      playBehaviour: _currentPhase == 1 ? kMoviePlayBehaviour.loop : kMoviePlayBehaviour.playOnce,
      onCompleted: _onCompleted,
      developerMode: widget.developerMode,
      movies: [
        widget.intro ?? MovieTween(),
        widget.stay ?? MovieTween(),
        _outro ?? MovieTween(),
      ],
      builder: (context, movie, child)
      {
        _currentMovie = movie;
        return widget.builder(context, movie, child);
      }
    );
  }
}