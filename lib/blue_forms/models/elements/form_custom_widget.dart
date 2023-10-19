
part of devspace;

class FormCustomWidget extends FormElement {
  final Widget widget;

  const FormCustomWidget({
    required super.id,
    required this.widget,
    super.isActive = true,
  });
}