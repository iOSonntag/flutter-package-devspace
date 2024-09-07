part of devspace;

typedef AsyncDataLoaderCallback<T> = Future<T?> Function(String dataKey);

typedef AsyncDataLoaderBuilder<T> = Widget Function(BuildContext context, T? data, String? errorMessage, Object? originalException, bool isLoading, void Function() retry);

// ignore: camel_case_types
enum kAsyncDataState
{
  noDataRequested,
  loading,
  loadedHasData,
  loadedNoData,
  error
}


class AsyncDataLoader<T> extends StatefulWidget {

  /// {@template AsyncDataLoader.dataKey}
  /// 
  /// To start loading data (requesting data), the key must be present. If the
  /// key changes, new data will be loaded. If the key is null, no data will be
  /// loaded. 
  /// The data will be cached in case the key changes back to a already loaded
  /// key. 
  /// The data will be cached until the widget is disposed.
  /// 
  /// {@endtemplate}
  final String? dataKey;
  final AsyncDataLoaderCallback<T> onLoad;
  final AsyncDataLoaderBuilder<T> builder;
  final void Function(kAsyncDataState state)? onStateChange;

  const AsyncDataLoader({
    super.key,
    required this.dataKey,
    required this.onLoad,
    required this.builder,
    this.onStateChange,
  });

  @override
  State<AsyncDataLoader<T>> createState() => _AsyncDataLoaderState<T>();
}

class _AsyncDataLoadingEntry<T> {

  T? data;
  String? errorMessage;
  Object? originalException;
  bool canceled = false;

  _AsyncDataLoadingEntry({
    this.data,
    this.errorMessage,
    this.originalException,
  });

}

class _AsyncDataLoaderState<T> extends State<AsyncDataLoader<T>> {

  final Map<String, _AsyncDataLoadingEntry<T>> _dataCache = {};
  bool _isLoading = false;
  kAsyncDataState _state = kAsyncDataState.noDataRequested;

  @override
  void initState()
  {
    super.initState();

    if (widget.dataKey != null)
    {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _loadData(widget.dataKey!, false);
      });
    }
  }

  void _setDataState(kAsyncDataState state)
  {
    if (_state == state)
    {
      return;
    }

    _state = state;

    if (widget.onStateChange != null)
    {
      widget.onStateChange!(_state);
    }
  }


  @override
  void didUpdateWidget(AsyncDataLoader<T> oldWidget)
  {
    super.didUpdateWidget(oldWidget);

    if (widget.dataKey != oldWidget.dataKey)
    {
      _isLoading = false;

      if (oldWidget.dataKey != null)
      {
        _getOrCreateEntry(oldWidget.dataKey!).canceled = true;

        if (widget.dataKey == null)
        {
          _setDataState(kAsyncDataState.noDataRequested);
        }
      }

      if (widget.dataKey != null)
      {
        _loadData(widget.dataKey!, false);
      }
    }
  }

  Future<void> _loadData(String key, bool forceReload) async
  {
    if (_dataCache.containsKey(key) && !forceReload && _dataCache[key]!.data != null)
    {
      _setDataState(kAsyncDataState.loadedHasData);
      return;
    }

    final entry = _getOrCreateEntry(key);

    try
    {
      entry.data = null;
      entry.errorMessage = null;
      entry.originalException = null;

      _setDataState(kAsyncDataState.loading);
      setState(() {
        _isLoading = true;
      });

      T? data = await widget.onLoad(key);

      if (entry.canceled)
      {
        entry.canceled = false;
        return;
      }

      entry.data = data;

      if (data == null)
      {
        _setDataState(kAsyncDataState.loadedNoData);
      }
      else
      {
        _setDataState(kAsyncDataState.loadedHasData);
      }

      if (mounted)
      {
        setState(() 
        {
          _isLoading = false;
        });
      }
    }
    catch (e)
    {
      if (entry.canceled)
      {
        entry.canceled = false;
        return;
      }

      entry.errorMessage = ExceptionTool.toUserFriendlyMessage(e);
      entry.originalException = e;
      _setDataState(kAsyncDataState.error);

      if (mounted)
      {
        setState(() 
        {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _retry() async
  {
    if (widget.dataKey != null)
    {
      await _loadData(widget.dataKey!, true);
    }
  }

  _AsyncDataLoadingEntry<T> _getOrCreateEntry(String key)
  {
    if (_dataCache.containsKey(key) == false)
    {
      _dataCache[key] = _AsyncDataLoadingEntry<T>();
    }

    return _dataCache[key]!;
  }

  @override
  Widget build(BuildContext context)
  {
    if (widget.dataKey == null)
    {
      return widget.builder(context, null, null, null, false, () {});
    }

    final entry = _getOrCreateEntry(widget.dataKey!);

    return widget.builder(context, entry.data, entry.errorMessage, entry.originalException, _isLoading, _retry);
  }
}