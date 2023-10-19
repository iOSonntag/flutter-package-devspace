

part of devspace;


class FormPage extends FormPageBase {

  final String title;
  final String? description;
  final List<FormElement> elements;
  BlueFormsPageFormController? _controller;

  FormPage({
    required this.title,
    this.description,
    required this.elements,
  });


  
  @override
  bool allowsToContinue()
  {
    if (_controller != null)
    {
      return _controller!.tryToContinue();
    }

    return false;
  }

}
