
part of devspace;

// TODO: IMPROVEMENT add isOptional and label and description to group cascading the isOptional value down to the fields
class FormInputGroup extends FormInput {

  final List<FormInput> inputs;

  const FormInputGroup({
      required this.inputs,
      super.isActive,
  }) :
    super(id: '');

}