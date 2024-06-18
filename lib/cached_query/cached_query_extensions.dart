part of devspace;



typedef QueryBuilderFunction<T> = Widget Function(BuildContext context, QueryState<T> state);

class ExtendedInfinitQueryData {

  bool isFetchingNextPage;
  bool isRefetchingByUser;
  bool isRefetchingBySystem;

  ExtendedInfinitQueryData({
    required this.isFetchingNextPage,
    required this.isRefetchingByUser,
    required this.isRefetchingBySystem,
  });

}

// TODO: fix memory leak, reverse map and search for value
final Map<InfiniteQuery, ExtendedInfinitQueryData> _inifnitQueryData = {};

extension ExtensionOnInfiniteQuery<T, Arg> on InfiniteQuery<T, Arg> {
  
  
  ExtendedInfinitQueryData _getData()
  {
    ExtendedInfinitQueryData? data = _inifnitQueryData[this];

    if (data != null) return data;

    final newData = ExtendedInfinitQueryData(
      isFetchingNextPage: false,
      isRefetchingByUser: false,
      isRefetchingBySystem: false,
    );

    _inifnitQueryData[this] = newData;

    return newData;
  }

  bool get isFetchingNextPage => _getData().isFetchingNextPage;
  bool get isRefetching => isRefetchingByUser || isRefetchingBySystem;
  bool get isRefetchingByUser => _getData().isRefetchingByUser;
  bool get isRefetchingBySystem => _getData().isRefetchingBySystem;
  bool get isFetchingForTheFirstTime => state.status == QueryStatus.loading && state.data.isNullOrEmpty;

  Future<InfiniteQueryState<T>> refetchByUser() async
  {
    _getData().isRefetchingByUser = true;
    final state = await refetch();
    _getData().isRefetchingByUser = false;
    update((data) => data);

    return state;
  }
  Future<InfiniteQueryState<T>> refetchBySystem() async
  {
    _getData().isRefetchingByUser = true;
    final state = await refetch();
    _getData().isRefetchingByUser = false;
    update((data) => data);

    return state;
  }

  Future<InfiniteQueryState<T>?> fetchNextPageAdvanced() async
  {
    _getData().isFetchingNextPage = true;
    final state = await getNextPage();
    _getData().isFetchingNextPage = false;
    update((data) => data);

    return state;
  }

  void invalidateQueryAndRefetchIfNeeded()
  {
    invalidateQuery();

    if (hasListener)
    {
      refetchBySystem();
    }
  }

}

extension ExtensionOnQuery<T> on Query<T> {

  void invalidateQueryAndRefetchIfNeeded()
  {
    invalidateQuery();

    if (hasListener)
    {
      // TODO: think if we should use refetchBySystem
      refetch();
    }
  }

}


abstract class CachedQueryInvalidations {

  CachedQueryInvalidations._();

  static void invalidateQueriesAndRefetchIfNeeded(KeyFilterFunc filterFunc)
  {
    CachedQuery.instance.invalidateCache(
      filterFn: filterFunc,
    );

    final queriesNeedRefetching = CachedQuery.instance.whereQuery((query)
    {
      if (query.hasListener)
      {
        return filterFunc(query.unencodedKey, query.key);
      }

      return false;
    });

    if (queriesNeedRefetching == null) return;

    for (final query in queriesNeedRefetching)
    {
      if (query is InfiniteQuery)
      {
        query.refetchBySystem();
      }
      else
      {
        // TODO: think if we should use refetchBySystem
        query.refetch();
      }
    }
  }

  static void invalidateQueriesAndRefetchIfNeededStartingWith(List<String> startWith)
  {
    invalidateQueriesAndRefetchIfNeeded((unencodedKey, key)
    {
      for (final start in startWith)
      {
        if (key.startsWith(start))
        {
          return true;
        }
      }

      return false;
    });
  }

}
















extension ExtensionOnQueryState<T> on QueryState<T> {
  
  bool get hasData => data != null;


  // TODO: refactor
  void invalidateQueriesAndRefetchWithListeners(KeyFilterFunc filterFunc)
  {
    CachedQuery.instance.invalidateCache(
      filterFn: filterFunc,
    );

    final queriesNeedRefetching = CachedQuery.instance.whereQuery((query)
    {
      if (query.hasListener)
      {
        return filterFunc(query.unencodedKey, query.key);
      }

      return false;
    });

    if (queriesNeedRefetching == null) return;

    for (final query in queriesNeedRefetching)
    {
      query.refetch();
    }
  }

  // TODO: refactor
  void invalidateQueriesAndRefetchWithListenersStartWidth(List<String> startWith)
  {
    invalidateQueriesAndRefetchWithListeners((unencodedKey, key)
    {
      for (final start in startWith)
      {
        if (key.startsWith(start))
        {
          return true;
        }
      }

      return false;
    });
  }

}


