
part of devspace;

abstract class FormElement {
  final String id;
  final bool isActive;

  const FormElement({
    required this.id,
    this.isActive = true,
  });

  bool get isRequired => false;
}

class FormElementButton {

  final VoidCallback onPressed;
  final IconData? icon;
  final String? title;

  const FormElementButton({
    required this.onPressed,
    this.icon,
    this.title,
  });

}


abstract class FormInput extends FormElement {

  final dynamic initialValue;
  final bool isOptional;
  final String? description;
  final String? label;
  final FormElementButton? extraButton;

  const FormInput({
    required super.id,
    this.initialValue,
    this.isOptional = false,
    this.description,
    this.label,
    super.isActive = true,
    this.extraButton,
  });

  @override
  bool get isRequired => isOptional == false;

}