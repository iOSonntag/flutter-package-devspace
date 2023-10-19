

part of devspace;


class _FormElementWidget extends StatelessWidget {

  final FormElement definition;
  final bool isFirstElement;
  final bool isLastElement;
  final bool visuallyMarkRequired;
  final Map<String, dynamic> currentSavedValues;
  final Map<String, String> externalErrors;
  final void Function(String id, String? value) onSave;

  const _FormElementWidget({
    // ignore: unused_element
    super.key,
    required this.definition,
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
        visuallyMarkRequired: visuallyMarkRequired,
        currentSavedValue: currentSavedValues[definition.id],
        externalError: externalErrors[definition.id],
        onSave: (value) => onSave(definition.id, value),
      );
    }

    if (definition is FormInputGroup)
    {
      FormInputGroup groupDefinition = definition as FormInputGroup;

      List<Widget> groupChildren = [];

      for (int i = 0; i < groupDefinition.elements.length; i++)
      {
        FormInput fiInputDefinition = groupDefinition.elements[i];

        if (fiInputDefinition.isActive == false)
        {
          continue;
        }

        bool isFirst = i == 0 && isFirstElement;
        bool isLast = i == groupDefinition.elements.length - 1 && isLastElement;

        groupChildren.add(
          _FormElementWidget(
            definition: fiInputDefinition, 
            isFirstElement: isFirst, 
            isLastElement: isLast, 
            visuallyMarkRequired: visuallyMarkRequired,
            currentSavedValues: currentSavedValues, 
            externalErrors: externalErrors, 
            onSave: onSave
          )
        );
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: groupChildren,
      );
    }

    throw Exception('Unknown FormElement type: ${definition.runtimeType}');
  }
}