
part of devspace;

abstract class FormElement {
  final String id;
  final bool isActive;

  const FormElement({
    required this.id,
    this.isActive = true,
  });
}


abstract class FormInput extends FormElement {

  final dynamic initialValue;
  final bool isOptional;
  final String? description;
  final String? label;

  const FormInput({
    required super.id,
    this.initialValue,
    this.isOptional = false,
    this.description,
    this.label,
    super.isActive = true,
  });

}