part of devspace;



typedef InfinitItemBuilder<T> = Widget Function(BuildContext context, T item, int index, bool isLast, List<T> items);

class InfinitQueryList<T> extends StatefulWidget {

  final EdgeInsetsGeometry padding;
  final double itemSeperation;
  final double cellRadius;
  final InfiniteQuery<PageFetchResult<T>, String?> query;
  final InfinitItemBuilder<T> buildItem;
  final WidgetBuilder? buildNoItemsFound;
  final bool reverse;
  final bool shrinkWrap;
  final bool disablePullToRefresh;
  final bool Function(BuildContext context)? onAllowPullToRefresh;
  final List<T> Function(List<T> items)? onTransformItems;

  const InfinitQueryList({
    super.key,
    this.padding = EdgeInsets.zero,
    this.itemSeperation = 0.0,
    required this.cellRadius,
    required this.query,
    required this.buildItem,
    this.buildNoItemsFound,
    this.reverse = false,
    this.shrinkWrap = false,
    this.disablePullToRefresh = false,
    this.onAllowPullToRefresh,
    this.onTransformItems,
  });

  @override
  State<InfinitQueryList<T>> createState() => _InfinitQueryListState<T>();
}

class _InfinitQueryListState<T> extends State<InfinitQueryList<T>> {

  final _scrollController = ScrollController();

  @override
  void initState()
  {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context)
  {
    return InfiniteQueryBuilder<PageFetchResult<T>, String?>(
      query: widget.query,
      buildWhen: (oldState, newState)
      {
        return oldState.status != newState.status || oldState.data != newState.data || oldState.error != newState.error;
      },
      builder: (context, state, query)
      {
        if (widget.disablePullToRefresh)
        {
          return _buildContent(context, state, query);
        }

        return RefreshIndicator(
          backgroundColor: context.colors.surface,
          onRefresh: () async
          {
            if (widget.onAllowPullToRefresh != null && !widget.onAllowPullToRefresh!(context))
            {
              await 400.randomize(startValue: 200).delay();
              return;
            }

            await query.refetchByUser();
          },
          child: _buildContent(context, state, query)
        );
      }
    );
  }

  Widget _buildContent(BuildContext context, InfiniteQueryState<PageFetchResult<T>> state, InfiniteQuery<PageFetchResult<T>, String?> query)
  {
    List<T>? allPosts = state.data?.expand((e) => e.items).toList();

    if (allPosts != null && widget.onTransformItems != null)
    {
      allPosts = widget.onTransformItems!(List<T>.from(allPosts));
    }

    if (state.status == QueryStatus.success && allPosts.isNullOrEmpty)
    {
      return Stack(
        children: [


          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              physics: context.animations.scrollPhysics,
            )
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: widget.buildNoItemsFound!(context),
          ),

          
        ],
      );
    }

    EdgeInsets resolvedPadding = widget.padding.resolve(null);

    List<Widget> slivers = [];

    

    if (resolvedPadding.top > 0)
    {
      slivers.add(
        SliverToBoxAdapter(
          child: SizedBox(height: resolvedPadding.top),
        )
      );
    }

    if (allPosts != null && allPosts.isNotEmpty) 
    {
      

      slivers.add(
        SliverList(
          delegate: SliverChildBuilderDelegate((context, i)
            {
              if (resolvedPadding.left > 0 || resolvedPadding.right > 0)
              {
                return Padding(
                  padding: EdgeInsets.only(
                    top: i == 0 ? 0.0 : widget.itemSeperation,
                    left: resolvedPadding.left,
                    right: resolvedPadding.right,
                  ),
                  child: widget.buildItem(context, allPosts![i], i, i == allPosts.length - 1, allPosts),
                );
              }

              if (widget.itemSeperation > 0 && i > 0)
              {
                return Padding(
                  padding: EdgeInsets.only(top: widget.itemSeperation),
                  child: widget.buildItem(context, allPosts![i], i, i == allPosts.length - 1, allPosts),
                );
              }

              return widget.buildItem(context, allPosts![i], i, i == allPosts.length - 1, allPosts);
            },
            childCount: allPosts.length,
          ),
        ),
      );


      if (resolvedPadding.bottom > 0)
      {
        slivers.add(
          SliverToBoxAdapter(
            child: SizedBox(height: resolvedPadding.bottom),
          )
        );
      }
    }

    if (query.isFetchingNextPage) 
    {
      slivers.add(
        SliverToBoxAdapter(
          child: Container(
            margin: resolvedPadding.excludeTop(condition: allPosts.isNullOrEmpty),
            child: Center(
              child: ArchLoadingIndicator(),
            ),
          ),
        ),
      );
    }
    else if (state.status == QueryStatus.error)
    {
      slivers.add(
        SliverToBoxAdapter(
          child: Container(
            margin: resolvedPadding.excludeTop(condition: allPosts.isNullOrEmpty),
            padding: context.paddingXL_M.fineHorizontal(-4.0),
            decoration: BoxDecoration(
              color: context.colors.error,
              borderRadius: BorderRadius.circular(widget.cellRadius),
            ),
            child: Row(
              children: [

                TextBody.small(ExceptionTool.toUserFriendlyMessage(state.error), 
                  color: context.colors.onError
                ).expand(),

                context.spaceL,

                ArchButton(
                  onPressed: ()
                  {
                    query.refetchByUser();
                  },
                  type: kButtonType.regular,
                  size: kSize3.S,
                  onSurface: true,
                  title: LibStrings.lib_general_actionRetry.tr(),
                ),

              ],
            )
          ),
        )
      );
    }



    return LoadableView(
      isLoading: query.isFetchingForTheFirstTime || query.isRefetching,
      child: CustomScrollView(
        controller: _scrollController,
        physics: context.animations.scrollPhysics,
        shrinkWrap: widget.shrinkWrap,
        clipBehavior: widget.shrinkWrap ? Clip.none : Clip.hardEdge,
        reverse: widget.reverse,
        slivers: slivers,
      ),
    );
  }

  void _onScroll()
  {
    if (widget.query.state.status != QueryStatus.loading && _isBottom)
    {
      widget.query.fetchNextPageAdvanced();
    }
  }

  bool get _isBottom
  {
    if (!_scrollController.hasClients) return false;

    return _scrollController.offset >= (_scrollController.position.maxScrollExtent * 0.9);
  }

  @override
  void dispose()
  {
    _scrollController.dispose();
    
    super.dispose();
  }
}