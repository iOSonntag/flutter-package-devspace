

part of devspace;




class _FormAsyncDependency extends material.StatefulWidget {

  final FormAsyncDependency definition;
  final Color? labelColor;
  final bool onBackground;
  final bool isFirstElement;
  final bool isLastElement;
  final bool visuallyMarkRequired;
  final Map<String, dynamic> currentSavedValues;
  final Map<String, String> externalErrors;
  final void Function(String id, dynamic value) onSave;
  final VoidCallback onSubmitRequested;

  const _FormAsyncDependency({
    // ignore: unused_element
    super.key,
    required this.definition,
    this.labelColor,
    required this.onBackground,
    required this.isFirstElement,
    required this.isLastElement,
    required this.visuallyMarkRequired,
    required this.currentSavedValues,
    required this.externalErrors,
    required this.onSave,
    required this.onSubmitRequested
  });

  @override
  material.State<_FormAsyncDependency> createState() => _FormAsyncDependencyState();
}

class _FormAsyncDependencyState extends material.State<_FormAsyncDependency> {


  String? lastDataKey;
  Key key = UniqueKey();

  @override
  void initState()
  {
    super.initState();

    lastDataKey = widget.definition.dataKey;
  }

  @override
  Widget build(BuildContext context)
  {
    if (widget.definition.isActive == false)
    {
      return EmptyWidget();
    }

    if (widget.definition.dataKey != lastDataKey)
    {
      key = UniqueKey();
      lastDataKey = widget.definition.dataKey;
    }

    return AsyncContentBlock(
      dataKey: widget.definition.dataKey, 
      onLoad: widget.definition.onLoad, 
      internalWidgetsPadding: context.paddingL,
      noDataRequestedWidget: widget.definition.noDataRequestedWidget,
      builder: (context, data, retry)
      {
        FormElement formElement = widget.definition.builder(data);

        return _FormElementWidget(
          key: key,
          definition: formElement,
          labelColor: widget.labelColor,
          onBackground: widget.onBackground,
          isFirstElement: widget.isFirstElement,
          isLastElement: widget.isLastElement,
          visuallyMarkRequired: widget.visuallyMarkRequired,
          currentSavedValues: widget.currentSavedValues,
          externalErrors: widget.externalErrors,
          onSave: widget.onSave,
          onSubmitRequested: widget.onSubmitRequested
        );
      }
    );
  }
}