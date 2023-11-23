

part of devspace;



class FormInputPickOption extends FormInput {

  final List<FormsInputPickOptionItem> options;
  final void Function(String? newValue)? onChange;

  const FormInputPickOption({
    required super.id,
    super.initialValue,
    super.description,
    super.label,
    super.isActive,
    required this.options,
    super.isOptional,
    this.onChange,
  });

}

class FormsInputPickOptionItem {

  final String id;
  final String title;

  const FormsInputPickOptionItem({
    required this.id,
    required this.title,
  });

}