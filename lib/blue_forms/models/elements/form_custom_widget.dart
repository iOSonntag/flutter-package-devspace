
part of devspace;

class FormCustomWidget extends FormElement {
  final WidgetBuilder builder;

  const FormCustomWidget({
    required super.id,
    required this.builder,
    super.isActive = true,
  });
}