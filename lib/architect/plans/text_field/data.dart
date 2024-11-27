
part of devspace;

// ignore: camel_case_types
enum kTextFieldVariant
{
  regular,
}


class TextFieldData extends PlanData {

  final kSize3 size;
  final Color? labelColor;
  final bool enabled;
  final bool isFormField;
  final bool isTextArea;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? initialValue;
  final Iterable<String>? autofillHints;
  final bool autocorrect;
  final bool obscureText;
  final bool enableSuggestions;

  /// The Textfield will assume it will be displayed on a surface, if it is
  /// displayed on a background, set this to true to adjust the colors accordingly.
  final bool onBackground;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSave;
  final ValueChanged<String>? onSubmit;
  final FormFieldValidator<String?>? validator;
  final bool visuallyMarkAsRequired;
  final int? displayMaxChars;
  final String? label;
  final String? hint;
  final String? externalError;


  const TextFieldData({
    super.variationId,
    this.size = kSize3.M,
    this.labelColor,
    this.focusNode,
    this.enabled = true,
    this.isFormField = true,
    this.isTextArea = false,
    this.visuallyMarkAsRequired = false,
    this.displayMaxChars,
    this.maxLines,
    this.initialValue,
    this.autofillHints,
    this.autocorrect = true,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.onBackground = false,
    this.textInputType,
    this.onChanged,
    this.onSave,
    this.onSubmit,
    this.validator,
    this.label,
    this.hint,
    this.externalError,
  });



}