



part of devspace;

class BlueFormsInputText extends StatelessWidget {

  final int decorationStyle;
  final BlueFormsInputTextDefinition definition;
  final dynamic currentSavedValue;
  final String? errorMsg;
  final void Function(String? value) onSave;

  const BlueFormsInputText({
    super.key,
    required this.decorationStyle,
    required this.definition,
    required this.currentSavedValue,
    required this.onSave,
    this.errorMsg,
  });

  InputValidator _inputValidator()
  {
    switch (definition.validationType)
    {
      case kBlueFormsInputTextValidationType.none:
        return InputValidators.noValidation();

      case kBlueFormsInputTextValidationType.trimNotEmpty:
        return InputValidators.notEmpty(trimBeforeCheck: true);

      case kBlueFormsInputTextValidationType.notEmpty:
        return InputValidators.notEmpty(trimBeforeCheck: false);

      case kBlueFormsInputTextValidationType.phoneNumber:
        return InputValidators.phoneNumber();

      case kBlueFormsInputTextValidationType.custom:
        return definition.customValidator ?? InputValidators.noValidation();
    }

    // ignore: dead_code
    throw Exception('Unsupported text validation type.');
  }

  @override
  Widget build(BuildContext context)
  {
    final InputDecoration decoration = ArchInputDecoration.create(context, InputDecorationData(
      // TODO: implement
      // style: widget.definition.overwriteDecorationStyle ?? widget.decorationStyle,
      hint: definition.hint,
      label: definition.label,
      error: errorMsg,
    ));

    return BlueFormsInputContainer(
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