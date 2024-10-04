
part of devspace;



/// If the input is marked as [isOptional] and a validator is set,
/// the field gets only validated if it contains input. White spaces 
/// are only excluded from this check if [trimOnSave] is enabled.
class FormInputText extends FormInput {

  final String? hint;
  final bool trimOnSave;
  final bool isTextArea;
  final kFormTextValidationType validationType;
  final InputValidator? customValidator;
  final int? overwriteDecorationStyle;
  final Iterable<String>? autofillHints;
  final bool autocorrect;
  final bool obscureText;
  final bool enableSuggestions;
  final TextInputType? textInputType;
  final void Function(String newValue)? onChange;

  const FormInputText({
    required super.id,
    super.extraButtons,
    super.initialValue,
    super.description,
    super.label,
    this.hint,
    this.validationType = kFormTextValidationType.trimNotEmpty,
    this.customValidator,
    this.trimOnSave = true,
    this.isTextArea = false,
    super.isOptional,
    this.overwriteDecorationStyle,
    this.autofillHints,
    this.autocorrect = true,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.textInputType,
    this.onChange,
    super.isActive,
  }) :
    assert((customValidator == null && validationType != kFormTextValidationType.custom) || (customValidator != null && validationType == kFormTextValidationType.custom)),
    assert(isOptional == true || validationType != kFormTextValidationType.none);

}