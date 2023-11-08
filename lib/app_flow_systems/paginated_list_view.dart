


part of devspace;


typedef FetchPageItems<T> = Future<PageFetchResult<T>> Function(int pageSize, String? pageCursor);

class PaginatedListView<T> extends StatefulWidget {

  final EdgeInsets? padding;
  final IndexedWidgetBuilder? separatorBuilder;
  final int pageSize;
  final FetchPageItems<T> fetchPageItems;
  final IndexItemBuilder<T> buildItem;
  final double? horizontalOverdraw;

  const PaginatedListView({
    super.key,
    this.pageSize = 20,
    this.padding,
    this.separatorBuilder,
    this.horizontalOverdraw = 12.0,
    required this.fetchPageItems,
    required this.buildItem
  });

  @override
  State<PaginatedListView> createState() => _PaginatedListViewState<T>();
}

const String _pagninatedListStartCursor = 'INIT';

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {

  final PagingController<String, T> _controller = PagingController(firstPageKey: _pagninatedListStartCursor);

  @override
  void initState()
  {
    _controller.addPageRequestListener(_fetchPage);
    super.initState();
  }

  Future<void> _fetchPage(String pageKey) async
  {
    try
    {
      String? pageCursor = pageKey == _pagninatedListStartCursor ? null : pageKey;

      final fetchResult = await widget.fetchPageItems(widget.pageSize, pageCursor);

      final isLastPage = fetchResult.items.length < widget.pageSize || fetchResult.nextCursor == null;

      if (isLastPage)
      {
        _controller.appendLastPage(fetchResult.items);
      }
      else
      {
        _controller.appendPage(fetchResult.items, fetchResult.nextCursor);
      }
    }
    catch (error)
    {
      _controller.error = error;
    }
  }

  @override
  Widget build(BuildContext context)
  {
    if (widget.horizontalOverdraw == null)
    {
      return _buildPaginationWidget(context, widget.padding);
    }

    EdgeInsets fixedPadding = widget.padding ?? EdgeInsets.zero;

    fixedPadding = fixedPadding.fine(left: widget.horizontalOverdraw, right: widget.horizontalOverdraw);


    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -widget.horizontalOverdraw!,
          right: -widget.horizontalOverdraw!,
          top: 0,
          bottom: 0,
          child: _buildPaginationWidget(context, fixedPadding)
        )
      ],
    );
  }

  Widget _buildPaginationWidget(BuildContext context, EdgeInsets? padding)
  {
    return PagedListView<String, T>.separated(
      pagingController: _controller,
      physics: context.animations.scrollPhysics,
      padding: padding,
      separatorBuilder: (context, index) => widget.separatorBuilder?.call(context, index) ?? const SizedBox.shrink(),
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: widget.buildItem,
        firstPageErrorIndicatorBuilder: (_) => Center(
          child: ArchInfoBox.error(
            variant: kInfoBoxVariant.contentPlaceholder,
            icon: Symbols.error_rounded,
            title: LibStrings.lib_general_titleError.tr(),
            message: LibStrings.lib_general_errorUnknown.tr(),
            onAction: () => _controller.refresh(),
          ),
        ),
        noItemsFoundIndicatorBuilder: (_) => Center(
          child: ArchInfoBox.info(
            variant: kInfoBoxVariant.contentPlaceholder,
            icon: Symbols.format_list_bulleted_rounded,
            title: LibStrings.lib_general_titleInfo.tr(),
            message: LibStrings.lib_general_infoNoItemsFound.tr(),
            onAction: () => _controller.refresh(),
          ),
        ),
        firstPageProgressIndicatorBuilder: (_) => const Center(child: ArchLoadingIndicator(variant: kLoadingIndicatorVariant.special)),
        newPageProgressIndicatorBuilder: (_) => const Center(child: ArchLoadingIndicator()),
        // TODO: add all 3 
        // newPageErrorIndicatorBuilder: (_) => NewPageErrorIndicator(
        //   error: _controller.error,
        //   onTryAgain: () => _controller.retryLastFailedRequest(),
        // ),
        // noMoreItemsIndicatorBuilder: (_) => NoMoreItemsIndicator(),
      ),
    );
  }

  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }
}