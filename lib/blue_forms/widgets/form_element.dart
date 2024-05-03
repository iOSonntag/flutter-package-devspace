

part of devspace;


class _FormElementWidget extends StatelessWidget {

  final FormElement definition;
  final Color? labelColor;
  final bool isFirstElement;
  final bool isLastElement;
  final bool visuallyMarkRequired;
  final Map<String, dynamic> currentSavedValues;
  final Map<String, String> externalErrors;
  final void Function(String id, dynamic value) onSave;

  const _FormElementWidget({
    // ignore: unused_element
    super.key,
    required this.definition,
    this.labelColor,
    required this.isFirstElement,
    required this.isLastElement,
    required this.visuallyMarkRequired,
    required this.currentSavedValues,
    required this.externalErrors,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context)
  {
    if (definition.isActive == false)
    {
      return const SizedBox.shrink();
    }

    if (definition is FormCustomWidget)
    {
      return (definition as FormCustomWidget).builder(context);
    }

    if (definition is FormInputText)
    {
      return _FormInputTextWidget(
        key: Key(definition.id),
        definition: definition as FormInputText,
        labelColor: labelColor,
        visuallyMarkRequired: visuallyMarkRequired,
        currentSavedValue: currentSavedValues[definition.id],
        externalError: externalErrors[definition.id],
        onSave: (value) => onSave(definition.id, value),
      );
    }

    if (definition is FormInputImages)
    {
      return _FormInputImagesWidget(
        key: Key(definition.id),
        definition: definition as FormInputImages,
        labelColor: labelColor,
        visuallyMarkRequired: visuallyMarkRequired,
        currentSavedValue: currentSavedValues[definition.id],
        externalError: externalErrors[definition.id],
        onSave: (value) => onSave(definition.id, value),
      );
    }

    if (definition is FormInputPickOption)
    {
      return _FormInputPickOptionWidget(
        key: Key(definition.id),
        definition: definition as FormInputPickOption,
        labelColor: labelColor,
        visuallyMarkRequired: visuallyMarkRequired,
        currentSavedValue: currentSavedValues[definition.id],
        externalError: externalErrors[definition.id],
        onSave: (value) => onSave(definition.id, value),
      );
    }

    if (definition is FormInputGroup)
    {
      return _FormInputGroup(
        definition: definition as FormInputGroup,
        labelColor: labelColor,
        isFirstElement: isFirstElement,
        isLastElement: isLastElement,
        visuallyMarkRequired: visuallyMarkRequired,
        currentSavedValues: currentSavedValues, 
        externalErrors: externalErrors, 
        onSave: onSave
      );
    }

    throw Exception('Unknown FormElement type: ${definition.runtimeType}');
  }
}