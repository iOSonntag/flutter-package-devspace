
part of devspace;

// TODO: IMPROVEMENT add isOptional and label and description to group cascading the isOptional value down to the fields
class FormGroup extends FormInput {

  final int elementsPerRow;
  final List<FormElement> elements;


  const FormGroup({
    this.elementsPerRow = 1,
    required this.elements,
    super.isActive,
  }) :
    super(id: '');



  @override
  bool get isRequired => elements.any((element) => element.isRequired);

}