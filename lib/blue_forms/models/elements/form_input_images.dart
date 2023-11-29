

part of devspace;


class FormInputImagesFileSettings {

  const FormInputImagesFileSettings();

}


class FormInputImages extends FormInput {

  final int min;
  final int max;
  final FormInputImagesFileSettings fileSettings;
  final void Function(List<File> images)? onChange;

  const FormInputImages({
    required super.id,
    super.initialValue,
    super.description,
    super.label,
    super.isActive,
    this.min = 1,
    this.max = 1,
    this.fileSettings = const FormInputImagesFileSettings(),
    super.isOptional,
    this.onChange,
  }) :
    assert(min >= 1 && min <= max);


  bool get isSingleImage => min == 1 && max == 1;



}

