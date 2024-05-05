
part of devspace;

class FormCustomWidget extends FormElement {
  final WidgetBuilder builder;

  const FormCustomWidget({
    super.id = 'NONE',
    required this.builder,
    super.isActive = true,
  });
}