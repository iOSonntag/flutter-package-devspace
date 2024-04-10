part of devspace;

/// If an stay movie & an outro movie is provided, it tries to interpolate the
/// current state of the stay movie to the outro movie. But in order to do that,
/// the outro movie must have at least all the properties from the stay movie &
/// the stayToOutroProperties list must be provided.
class InOutMovie extends StatefulWidget {

  final MovieTween? intro;
  final VoidCallback? onIntroCompleted;

  final MovieTween? stay;
  final List<MovieTweenPropertyType>? stayToOutroProperties;

  final bool playOutro;
  final MovieTween? outro;
  final VoidCallback? onOutroCompleted;

  final Widget? child;
  final bool developerMode;
  final ValueWidgetBuilder<NullableMovie> builder;

  const InOutMovie({
    super.key,
    this.intro,
    this.onIntroCompleted,
    this.stay,
    this.stayToOutroProperties,
    this.playOutro = false,
    this.outro,
    this.onOutroCompleted,
    this.child,
    this.developerMode = false,
    required this.builder,
  });

  @override
  State<InOutMovie> createState() => _InOutMovieState();
}


// TODO: currently not working
extension ExtensionOnMovieTween on MovieTween
{
  void applyInterpolationFromCurrentMovie(Movie currentValues, List<MovieTweenPropertyType> properties, Duration duration, Curve curve)
  {
    final desiredValue = transform(0.0);

    MovieScene scene = this.scene(duration: duration, curve: curve);

    for (final property in properties)
    {
      final valueCurrent = currentValues.get(property);
      final valueDesired = desiredValue.get(property);

      if (valueCurrent is Color)
      {
        scene = scene.tween(property, ColorTween(begin: valueCurrent, end: valueDesired));
        continue;
      }

      if (valueCurrent is Size)
      {
        scene = scene.tween(property, SizeTween(begin: valueCurrent, end: valueDesired));
        continue;
      }

      scene = scene.tween(property, Tween(begin: valueCurrent, end: valueDesired));
    }
  } 
}


class _InOutMovieState extends State<InOutMovie> {

  int _currentPhase = 0;
  int? _currentPlayIndex = 0;
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
      if (widget.outro == null)
      {
        throw Exception('Outro movie is required to play outro');
      }

      // TODO improve the controlines of this
      widget.outro!.applyInterpolationFromCurrentMovie(_currentMovie!.innerMovie, widget.stayToOutroProperties ?? [], 3000.asDuration, Curves.easeInOut);

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
        widget.outro ?? MovieTween(),
      ],
      builder: (context, movie, child)
      {
        _currentMovie = movie;
        return widget.builder(context, movie, child);
      }
    );
  }
}