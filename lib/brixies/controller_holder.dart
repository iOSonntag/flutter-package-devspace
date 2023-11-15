


part of devspace;


class ControllerHolder<T extends ChangeNotifier> extends StatefulWidget {

  final T Function() create;
  final ResourceWidgetBuilder<T> builder;

  const ControllerHolder({
    super.key,
    required this.create,
    required this.builder,
  });

  @override
  State<ControllerHolder> createState() => _ControllerHolderState<T>();
}

class _ControllerHolderState<T extends ChangeNotifier> extends State<ControllerHolder<T>> {

  late final T controller;

  @override
  initState()
  {
    controller = widget.create();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return widget.builder(context, controller);
  }

  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
  }
}