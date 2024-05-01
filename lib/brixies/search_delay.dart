

part of devspace;


class SearchDelay extends StatefulWidget {

  final Duration delay;
  final void Function(String text) onSearch;
  final Widget Function(BuildContext context, void Function(String text) onTextChanged) builder;

  const SearchDelay({
    Key? key,
    this.delay = const Duration(milliseconds: 500),
    required this.onSearch,
    required this.builder,
  }) : super(key: key);

  @override
  State createState() => _SearchDelayState();
}

class _SearchDelayState extends State<SearchDelay> {
  Timer? _timer;
  String _search = '';


  void _onChanged(String value)
  {
    _search = value;
    _timer?.cancel();
    _timer = Timer(widget.delay, () => widget.onSearch(_search));
  }

  @override
  Widget build(BuildContext context)
  {
    return widget.builder(context, _onChanged);
  }

  @override
  void dispose()
  {
    _timer?.cancel();
    super.dispose();
  }
}