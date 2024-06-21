

part of devspace;

// TODO: implement

class FormAsyncDependency extends FormInput {

  final List<FormsInputPickOptionItem> options;
  final void Function(String? newValue)? onChange;

  const FormAsyncDependency({
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

