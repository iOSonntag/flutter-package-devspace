

part of devspace;

// IMPROVEMENT: add markdown support to description

class FormPageInfo extends FormPageBase {

  final String title;
  final String description;

  const FormPageInfo({
    required this.title,
    required this.description,
  });
  
  @override
  bool allowsToContinue()
  {
    return true;
  }
}
