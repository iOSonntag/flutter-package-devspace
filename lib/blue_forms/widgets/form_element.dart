

part of devspace;


class _FormElementWidget extends StatelessWidget {

  final FormElement definition;
  final Color? labelColor;
  final bool onBackground;
  final bool isFirstElement;
  final bool isLastElement;
  final bool visuallyMarkRequired;
  final Map<String, dynamic> currentSavedValues;
  final Map<String, String> externalErrors;
  final void Function(String id, dynamic value) onSave;
  final VoidCallback onSubmitRequested;

  const _FormElementWidget({
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
        onBackground: onBackground,
        visuallyMarkRequired: visuallyMarkRequired,
        currentSavedValue: currentSavedValues[definition.id],
        externalError: externalErrors[definition.id],
        onSave: (value) => onSave(definition.id, value),
        onSubmitRequested: onSubmitRequested
      );
    }

    if (definition is FormInputDateTime)
    {
      return _FormInputDateTimeWidget(
        key: Key(definition.id),
        definition: definition as FormInputDateTime,
        labelColor: labelColor,
        onBackground: onBackground,
        visuallyMarkRequired: visuallyMarkRequired,
        currentSavedValue: currentSavedValues[definition.id],
        externalError: externalErrors[definition.id],
        onSave: (value) => onSave(definition.id, value),
        onSubmitRequested: onSubmitRequested
      );
    }

    if (definition is FormInputImages)
    {
      return _FormInputImagesWidget(
        key: Key(definition.id),
        definition: definition as FormInputImages,
        labelColor: labelColor,
        onBackground: onBackground,
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
        onBackground: onBackground,
        visuallyMarkRequired: visuallyMarkRequired,
        currentSavedValue: currentSavedValues[definition.id],
        externalError: externalErrors[definition.id],
        onSave: (value) => onSave(definition.id, value),
      );
    }

    if (definition is FormAsyncDependency)
    {
      return _FormAsyncDependency(
        definition: definition as FormAsyncDependency,
        labelColor: labelColor,
        onBackground: onBackground,
        isFirstElement: isFirstElement,
        isLastElement: isLastElement,
        visuallyMarkRequired: visuallyMarkRequired,
        currentSavedValues: currentSavedValues, 
        externalErrors: externalErrors, 
        onSave: onSave,
        onSubmitRequested: onSubmitRequested
      );
    }

    if (definition is FormGroup)
    {
      return _FormGroup(
        definition: definition as FormGroup,
        labelColor: labelColor,
        onBackground: onBackground,
        isFirstElement: isFirstElement,
        isLastElement: isLastElement,
        visuallyMarkRequired: visuallyMarkRequired,
        currentSavedValues: currentSavedValues, 
        externalErrors: externalErrors, 
        onSave: onSave,
        onSubmitRequested: onSubmitRequested
      );
    }

    throw Exception('Unknown FormElement type: ${definition.runtimeType}');
  }
}