

part of devspace;



class FormInputPickOption extends FormInput {

  final List<BlueFormsInputOptionSelectionItem> options;
  final int? overwriteDecorationStyle;
  final void Function(String? newValue)? onChange;

  const FormInputPickOption({
    required super.id,
    super.initialValue,
    super.description,
    super.label,
    super.isActive,
    required this.options,
    super.isOptional,
    this.overwriteDecorationStyle,
    this.onChange,
  });

}

class BlueFormsInputOptionSelectionItem {

  final String id;
  final String title;

  const BlueFormsInputOptionSelectionItem({
    required this.id,
    required this.title,
  });

}