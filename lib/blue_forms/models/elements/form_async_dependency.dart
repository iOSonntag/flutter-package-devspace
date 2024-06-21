

part of devspace;

typedef FormAsyncDependencyBuilder<T> = FormElement Function(T data);

class FormAsyncDependency<T> extends FormInput {

  /// {@macro AsyncDataLoader.dataKey}
  final String? dataKey;
  final AsyncDataLoaderCallback<T> onLoad;
  final Widget? noDataRequestedWidget;
  final FormAsyncDependencyBuilder<T> builder;
  final bool preventSubmitWithoutData;

  const FormAsyncDependency({
    super.id = 'NONE',
    super.isActive,
    required this.dataKey,
    required this.onLoad,
    this.noDataRequestedWidget,
    this.preventSubmitWithoutData = true,
    required this.builder,
  });

}

