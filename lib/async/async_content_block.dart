part of devspace;

typedef AsyncContentBuilder<T> = Widget Function(BuildContext context, T data, void Function() retry);

typedef AsyncContentWrapperBuilder<T> = Widget Function(BuildContext context, T? data, void Function() retry, Widget child);

typedef AsyncContentCustomErrorBuilder = AsyncContentBlockCustomError? Function(BuildContext context, Object originalException);

// ignore: camel_case_types
enum kAsyncContentBlockType
{
  smallBrick,
  hugeSection
}

class AsyncContentBlockCustomError {

  final IconData? icon;
  final String? title;
  final String message;

  const AsyncContentBlockCustomError({
    this.icon,
    this.title,
    required this.message
  });

}

class AsyncContentBlock<T> extends StatelessWidget {

  final kAsyncContentBlockType type;
  /// {@macro AsyncDataLoader.dataKey}
  final String? dataKey;
  final EdgeInsets internalWidgetsPadding;
  final AsyncDataLoaderCallback<T> onLoad;
  final Widget? noDataRequestedWidget;
  final void Function(kAsyncDataState state)? onStateChange;
  final AsyncContentBuilder<T> builder;
  final AsyncContentWrapperBuilder<T>? wrapperBuilder;
  final AsyncContentCustomErrorBuilder? customErrorBuilder;

  const AsyncContentBlock({
    super.key,
    this.type = kAsyncContentBlockType.smallBrick,
    this.noDataRequestedWidget,
    this.onStateChange,
    this.internalWidgetsPadding = EdgeInsets.zero,
    required this.dataKey,
    required this.onLoad,
    required this.builder,
    this.customErrorBuilder,
    this.wrapperBuilder
  });

  @override
  Widget build(BuildContext context)
  {
    return AsyncDataLoader<T>(
      dataKey: dataKey,
      onLoad: onLoad,
      onStateChange: onStateChange,
      builder: (context, data, errorMessage, originalException, isLoading, retry)
      {
        Widget child = _buildChild(context, data, errorMessage, originalException, isLoading, retry);

        if (wrapperBuilder != null)
        {
          child = wrapperBuilder!(context, data, retry, child);
        }

        return child;
      },
    );
  }

  Widget _buildChild(BuildContext context, T? data, String? errorMessage, Object? originalException, bool isLoading, void Function() retry)
  {
    if (isLoading)
    {
      return Center(
        child: Padding(
          padding: internalWidgetsPadding,
          child: ArchLoadingIndicator(
            size: type == kAsyncContentBlockType.smallBrick ? kSize3.S : kSize3.M,
          ),
        )
      );
    }

    if (dataKey == null)
    {
      return noDataRequestedWidget ?? EmptyWidget();
    }

    if (errorMessage != null)
    {
      return _buildError(context, errorMessage, originalException, retry);
    }
    
    
    if (data != null)
    {
      return builder(context, data, retry);
    }

    return _buildNotFound(context, retry);
  }

  Widget _buildError(BuildContext context, String errorMessage, Object? originalException, void Function() retry)
  {
    AsyncContentBlockCustomError? customError = customErrorBuilder != null && originalException != null ? customErrorBuilder!(context, originalException) : null;

    return Center(
      child: Padding(
        padding: internalWidgetsPadding,
        child: Padding(
          padding: type == kAsyncContentBlockType.hugeSection ? context.paddingXXL : EdgeInsets.zero,
          child: ArchInfoBox.error(
            variant: type == kAsyncContentBlockType.hugeSection ? kInfoBoxVariant.contentPlaceholder : kInfoBoxVariant.smallBrick,
            icon: customError?.icon ?? Symbols.warning_rounded,
            title: customError?.title ??  LibStrings.lib_general_titleError.tr(),
            message: customError?.message ?? errorMessage,
            onAction: retry,
          ),
        ),
      )
    );
  }

  Widget _buildNotFound(BuildContext context, void Function() retry)
  {
    return Center(
      child: Padding(
        padding: internalWidgetsPadding,
        child: Padding(
          padding: type == kAsyncContentBlockType.hugeSection ? context.paddingXXL : EdgeInsets.zero,
          child: ArchInfoBox.info(
            variant: type == kAsyncContentBlockType.hugeSection ? kInfoBoxVariant.contentPlaceholder : kInfoBoxVariant.smallBrick,
            icon: Symbols.info_rounded,
            title: LibStrings.lib_warning_resourceNotFound_title.tr(),
            message: LibStrings.lib_warning_resourceNotFound_message.tr(),
            onAction: retry,
          ),
        ),
      )
    );
  }
}