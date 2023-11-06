part of devspace;

typedef ContextLoader = Future<void> Function(BuildContext context);
typedef LoadApp<T> = Future<T?> Function(BuildContext context);
typedef AppBuilder<T> = Widget Function(BuildContext context, T? data);

class AppLoader<T> extends StatefulWidget {

  final WidgetBuilder? buildLoading;
  final AppBuilder<T> buildApp;
  final LoadApp<T> loadApp;

  const AppLoader({
    super.key,
    this.buildLoading,
    required this.buildApp,
    required this.loadApp,
  });

  @override
  State<AppLoader> createState() => _AppLoaderState<T>();
}

class _AppLoaderState<T> extends State<AppLoader<T>> {

  bool _loaded = false;
  T? _data;

  @override
  void initState()
  {
    _loadApp();
    super.initState();
  }

  Future<void> _loadApp() async
  {
    T? data = await widget.loadApp(context);


    setState(()
    {
      _data = data;
      _loaded = true;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    if (!_loaded)
    {
      return widget.buildLoading?.call(context) ?? const SizedBox.shrink();
    }

    return widget.buildApp(context, _data);
  }
}