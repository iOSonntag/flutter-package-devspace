part of devspace;



class NullableMovie 
{
  final Movie innerMovie;

  NullableMovie({
    required this.innerMovie
  });


  V getOrDefault<V>(MovieTweenPropertyType property, V defaultValue)
  {
    try
    {
      return innerMovie.get(property) as V;
    }
    catch (e)
    {
      return defaultValue;
    }
  }

  V? tryGet<V>(MovieTweenPropertyType property)
  {
    try
    {
      return innerMovie.get(property) as V;
    }
    catch (e)
    {
      return null;
    }
  }

  static final empty = NullableMovie(innerMovie: Movie(map: const {}));
}

// ignore: camel_case_types
enum kMoviePlayBehaviour
{
  playOnce,
  loop,
  mirror,
}

class MovieOrchestra extends StatefulWidget {

  final int? playIndex;
  final kMoviePlayBehaviour playBehaviour;
  final List<MovieTween> movies;
  final Widget? child;
  final bool developerMode;
  final ValueCallback<int>? onCompleted;
  final ValueWidgetBuilder<NullableMovie> builder;

  const MovieOrchestra({
    super.key,
    required this.playIndex,
    this.playBehaviour = kMoviePlayBehaviour.playOnce,
    required this.movies,
    this.child,
    this.developerMode = false,
    this.onCompleted,
    required this.builder,
  });

  @override
  State<MovieOrchestra> createState() => _MovieOrchestraState();
}

class _MovieOrchestraState extends State<MovieOrchestra> {


  Key _currentAnimKey = UniqueKey();
  final Key _childKey = GlobalKey();
  final Key _prerenderedChildKey = GlobalKey();


  @override
  void didUpdateWidget(MovieOrchestra oldWidget)
  {
    super.didUpdateWidget(oldWidget);

    if (widget.playIndex != oldWidget.playIndex)
    {
      setState(()
      {
        _currentAnimKey = UniqueKey();
      });
    }
  }

  @override
  Widget build(BuildContext context)
  {
    if (widget.playIndex == null)
    {
      return widget.builder(context, NullableMovie.empty, widget.child != null ? KeyedSubtree(key: _prerenderedChildKey, child: widget.child!) : null);
    }

    final movie = widget.movies[widget.playIndex!];
    final usedIndex = widget.playIndex!;

    if (widget.playBehaviour == kMoviePlayBehaviour.playOnce)
    {
      return PlayAnimationBuilder(
        key: _currentAnimKey,
        tween: movie,
        duration: movie.duration,
        developerMode: widget.developerMode,
        onCompleted: ()
        {
          if (widget.onCompleted != null)
          {
            widget.onCompleted!(usedIndex);
          }
        },
        builder: (context, movie, child)
        {
          return KeyedSubtree(
            key: _childKey,
            child: widget.builder(context, NullableMovie(innerMovie: movie), widget.child != null ? KeyedSubtree(key: _prerenderedChildKey, child: widget.child!) : null),
          );
        },
      );
    }

    if (widget.playBehaviour == kMoviePlayBehaviour.loop)
    {
      return LoopAnimationBuilder(
        key: _currentAnimKey,
        tween: movie,
        duration: movie.duration,
        developerMode: widget.developerMode,
        builder: (context, movie, child)
        {
          return KeyedSubtree(
            key: _childKey,
            child: widget.builder(context, NullableMovie(innerMovie: movie), widget.child != null ? KeyedSubtree(key: _prerenderedChildKey, child: widget.child!) : null),
          );
        },
      );
    }

    return MirrorAnimationBuilder(
      key: _currentAnimKey,
      tween: movie,
      duration: movie.duration,
      developerMode: widget.developerMode,
      builder: (context, movie, child)
      {
        return KeyedSubtree(
          key: _childKey,
          child: widget.builder(context, NullableMovie(innerMovie: movie), widget.child != null ? KeyedSubtree(key: _prerenderedChildKey, child: widget.child!) : null),
        );
      },
    );
  }
}