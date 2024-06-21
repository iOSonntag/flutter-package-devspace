part of devspace;

typedef AsyncContentBuilder<T> = Widget Function(BuildContext context, T data, void Function() retry);

// ignore: camel_case_types
enum kAsyncContentBlockType
{
  smallBrick,
  hugeSection
}

class AsyncContentBlock<T> extends StatelessWidget {

  final kAsyncContentBlockType type;
  /// {@macro AsyncDataLoader.dataKey}
  final String? dataKey;
  final AsyncDataLoaderCallback<T> onLoad;
  final Widget? noDataKeyWidget;
  final AsyncContentBuilder<T> builder;

  const AsyncContentBlock({
    super.key,
    this.type = kAsyncContentBlockType.smallBrick,
    this.noDataKeyWidget,
    required this.dataKey,
    required this.onLoad,
    required this.builder,
  });

  @override
  Widget build(BuildContext context)
  {
    return AsyncDataLoader<T>(
      dataKey: dataKey,
      onLoad: onLoad,
      builder: (context, data, errorMessage, isLoading, retry)
      {
        if (isLoading)
        {
          return Center(
            child: ArchLoadingIndicator(
              size: type == kAsyncContentBlockType.smallBrick ? kSize3.S : kSize3.M,
            )
          );
        }

        if (dataKey == null)
        {
          return noDataKeyWidget ?? EmptyWidget();
        }

        if (errorMessage != null)
        {
          return _buildError(context, errorMessage, retry);
        }
        
        
        if (data != null)
        {
          return builder(context, data, retry);
        }

        return _buildNotFound(context, retry);
      },
    );
  }

  Widget _buildError(BuildContext context, String errorMessage, void Function() retry)
  {
    return Center(
      child: Padding(
        padding: type == kAsyncContentBlockType.hugeSection ? context.paddingXXL : EdgeInsets.zero,
        child: ArchInfoBox.error(
          variant: type == kAsyncContentBlockType.hugeSection ? kInfoBoxVariant.contentPlaceholder : kInfoBoxVariant.smallBrick,
          icon: Symbols.warning_rounded,
          title: LibStrings.lib_general_titleError.tr(),
          message: errorMessage,
          onAction: retry,
        ),
      )
    );
  }

  Widget _buildNotFound(BuildContext context, void Function() retry)
  {
    return Center(
      child: Padding(
        padding: type == kAsyncContentBlockType.hugeSection ? context.paddingXXL : EdgeInsets.zero,
        child: ArchInfoBox.info(
          variant: type == kAsyncContentBlockType.hugeSection ? kInfoBoxVariant.contentPlaceholder : kInfoBoxVariant.smallBrick,
          icon: Symbols.info_rounded,
          title: LibStrings.lib_warning_resourceNotFound_title.tr(),
          message: LibStrings.lib_warning_resourceNotFound_message.tr(),
          onAction: retry,
        ),
      )
    );
  }
}