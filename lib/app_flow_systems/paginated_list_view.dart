


part of devspace;


typedef FetchPageItems<T> = Future<PageFetchResult<T>> Function(int pageSize, String? pageCursor);

class LoadErrorConfig {

  final IconData? icon;
  final String? title;
  final String? message;
  final String? actionTitle;
  final VoidCallback? onResolve;

  const LoadErrorConfig({
    this.icon,
    this.title,
    this.message,
    this.actionTitle,
    this.onResolve,
  });

}

class NoItemsConfig {

  final IconData? icon;
  final String? title;
  final String? message;
  final String? actionTitle;
  final VoidCallback? onResolve;

  const NoItemsConfig({
    this.icon,
    this.title,
    this.message,
    this.actionTitle,
    this.onResolve,
  });

}

class PaginatedListView<T> extends StatefulWidget {

  final EdgeInsets? padding;
  final IndexedWidgetBuilder? separatorBuilder;
  final int pageSize;
  final FetchPageItems<T> fetchPageItems;
  final IndexItemBuilder<T> buildItem;
  final double? horizontalOverdraw;
  final LoadErrorConfig? loadErrorConfig;
  final NoItemsConfig? noItemsConfig;

  const PaginatedListView({
    super.key,
    this.pageSize = 20,
    this.padding,
    this.separatorBuilder,
    this.horizontalOverdraw = 12.0,
    this.loadErrorConfig,
    this.noItemsConfig,
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
            icon: widget.loadErrorConfig?.icon ?? Symbols.error_rounded,
            title: widget.loadErrorConfig?.title ?? LibStrings.lib_general_titleError.tr(),
            message: widget.loadErrorConfig?.message ?? LibStrings.lib_error_unknown.tr(),
            onAction: widget.loadErrorConfig?.onResolve ?? () => _controller.refresh(),
            actionTitle: widget.loadErrorConfig?.actionTitle ?? LibStrings.lib_general_actionRetry.tr(),
          ),
        ),
        noItemsFoundIndicatorBuilder: (_) => Center(
          child: ArchInfoBox.info(
            variant: kInfoBoxVariant.contentPlaceholder,
            icon: widget.noItemsConfig?.icon ?? Symbols.format_list_bulleted_rounded,
            title: widget.noItemsConfig?.title ?? LibStrings.lib_general_titleInfo.tr(),
            message: widget.noItemsConfig?.message ?? LibStrings.lib_lists_noItemsFound.tr(),
            onAction: widget.noItemsConfig?.onResolve ?? () => _controller.refresh(),
            actionTitle: widget.noItemsConfig?.actionTitle ?? LibStrings.lib_general_actionRetry.tr(),
          ),
        ),
        firstPageProgressIndicatorBuilder: (_) => Center(
          child: ArchLoadingIndicator(
            variant: kLoadingIndicatorVariant.special
          )
        ),
        newPageProgressIndicatorBuilder: (_) => Center(
          child: Padding(
            padding: context.paddingM,
            child: ArchLoadingIndicator(),
          )
        ),
        newPageErrorIndicatorBuilder: (_) => Center(
          child: Padding(
            padding: context.paddingM,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextBody.small(
                  LibStrings.lib_lists_loadingMoreItemsFailed.tr()
                ),

                context.spaceM,

                ArchButton(
                  type: kButtonType.primary,
                  title: LibStrings.lib_general_actionRetry.tr(),
                  onPressed: () => _controller.retryLastFailedRequest(),
                )
              ],
            ),
          ),
        ),
        noMoreItemsIndicatorBuilder: (_) => Center(
          child: Padding(
            padding: context.paddingM,
            child: TextBody.small(
              LibStrings.lib_lists_noMoreItems.tr()
            ),
          ),
        ),
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