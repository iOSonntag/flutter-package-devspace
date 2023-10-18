
part of devspace;

class InsertGlues extends StatefulWidget {

  final List<Glue<GlueComponent>> glues;
  final Widget child;

  const InsertGlues({
    super.key,
    required this.glues,
    required this.child,
  });

  @override
  State<InsertGlues> createState() => _InsertGluesState();
}

class _InsertGluesState extends State<InsertGlues> {

  List<List<Glue<GlueComponent>>> resolvedDependencies = [];
  final Key _childKey = GlobalKey();

  @override
  void initState()
  {
    super.initState();

    resolvedDependencies = DependencyResolver.resolve(widget.glues);
  }

  
  @override
  Widget build(BuildContext context)
  {
    Widget child = KeyedSubtree(
      key: _childKey,
      child: widget.child,
    );

    for (int i = resolvedDependencies.length - 1; i >= 0; i--)
    {
      List<Glue<GlueComponent>> fiProviderList = resolvedDependencies[i];

      List<ChangeNotifierProvider> changeNotifier = [];

      for (Glue fiProvider in fiProviderList)
      {
        changeNotifier.add(fiProvider.provider);
      }

      child = MultiProvider(
        providers: changeNotifier,
        child: child,
      );
    }


    return child;
  }

  
}
