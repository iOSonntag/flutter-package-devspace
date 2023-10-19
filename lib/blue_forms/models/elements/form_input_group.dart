
part of devspace;

// TODO: IMPROVEMENT add isOptional and label and description to group cascading the isOptional value down to the fields
class FormInputGroup extends FormInput {

  final List<FormInput> elements;

  const FormInputGroup({
      required this.elements,
      super.isActive,
  }) :
    super(id: '');



  @override
  bool get isRequired => elements.any((element) => element.isRequired);

}