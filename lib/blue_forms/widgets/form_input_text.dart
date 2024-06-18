



part of devspace;

class _FormInputTextWidget extends StatelessWidget {

  final FormInputText definition;
  final Color? labelColor;
  final bool visuallyMarkRequired;
  final dynamic currentSavedValue;
  final String? externalError;
  final void Function(String? value) onSave;
  final VoidCallback onSubmitRequested;

  const _FormInputTextWidget({
    super.key,
    required this.definition,
    this.labelColor,
    required this.visuallyMarkRequired,
    required this.currentSavedValue,
    required this.onSave,
    required this.onSubmitRequested,
    this.externalError,
  });

  InputValidator _inputValidator()
  {
    switch (definition.validationType)
    {
      case kFormTextValidationType.none:
        return InputValidators.noValidation();

      case kFormTextValidationType.trimNotEmpty:
        return InputValidators.notEmpty(trimBeforeCheck: true);

      case kFormTextValidationType.notEmpty:
        return InputValidators.notEmpty(trimBeforeCheck: false);

      case kFormTextValidationType.phoneNumber:
        return InputValidators.phoneNumber();

      case kFormTextValidationType.custom:
        return definition.customValidator ?? InputValidators.noValidation();
    }

    // ignore: dead_code
    throw Exception('Unsupported text validation type.');
  }

  @override
  Widget build(BuildContext context)
  {
    return _FormInputContainerWidget(
      description: definition.description,
      child: ArchTextField(
        data: TextFieldData(
          isFormField: true,
          labelColor: labelColor,
          visuallyMarkAsRequired: visuallyMarkRequired && definition.isOptional == false,
          isTextArea: definition.isTextArea,
          label: definition.label,
          hint: definition.hint,
          externalError: externalError,
          initialValue: currentSavedValue ?? definition.initialValue,
          autofillHints: definition.autofillHints,
          autocorrect: definition.autocorrect,
          obscureText: definition.obscureText,
          enableSuggestions: definition.enableSuggestions,
          textInputType: definition.textInputType,
          onChanged: definition.onChange,
          onSubmit: (value) => onSubmitRequested(),
          onSave: (value)
          {
            if (definition.trimOnSave)
            {
              value = value?.trim();
            }
      
            if (value != null && value.isEmpty)
            {
              value = null;
            }
      
            onSave(value);
          },
          validator: (value)
          {
            if (definition.isOptional)
            {
              if (value == null || value.isEmpty || (definition.trimOnSave && value.trim().isEmpty))
              {
                return null;
              }
            }
      
            InputValidator validator = _inputValidator();
      
            return validator(value);
          },
        )
      ),
    );


  }
}