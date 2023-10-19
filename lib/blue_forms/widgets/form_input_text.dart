



part of devspace;

class _FormInputTextWidget extends StatelessWidget {

  final FormInputText definition;
  final dynamic currentSavedValue;
  final String? errorMsg;
  final void Function(String? value) onSave;

  const _FormInputTextWidget({
    super.key,
    required this.definition,
    required this.currentSavedValue,
    required this.onSave,
    this.errorMsg,
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
    final InputDecoration decoration = ArchInputDecoration.create(context, InputDecorationData(
      hint: definition.hint,
      label: definition.label,
      error: errorMsg,
    ));

    return _FormInputContainerWidget(
      description: definition.description,
      child: TextFormField(
        initialValue: currentSavedValue ?? definition.initialValue,
        decoration: decoration,
        maxLines: definition.isTextArea ? 6 : 1,
        scrollPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 500.0),
        autofillHints: definition.autofillHints,
        autocorrect: definition.autocorrect,
        keyboardType: definition.keyboardType,
        onChanged: definition.onChange,
        obscureText: definition.obscureText,
        enableSuggestions: definition.enableSuggestions,
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
        onSaved: (value)
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
      )
    );
  }
}