

part of devspace;


class FormInputImagesFileSettings {

  final kImageConversionType conversion;
  final double conversionQuality;
  final int? maxWidth;
  final int? maxHeight;
  final int? minWidth;
  final int? minHeight;
  final bool cropToPreviewAspectRatio;

  const FormInputImagesFileSettings({
    this.conversion = kImageConversionType.jpeg,
    this.conversionQuality = 1.0,
    this.maxWidth,
    this.maxHeight,
    this.minWidth,
    this.minHeight,
    this.cropToPreviewAspectRatio = false,
  });


}


class FormInputImages extends FormInput {

  final double imagePreviewAspectRatio;
  final int min;
  final int max;
  final FormInputImagesFileSettings fileSettings;
  final void Function(List<Uint8List> images)? onChange;

  const FormInputImages({
    required super.id,
    super.initialValue,
    super.description,
    super.label,
    super.isActive,
    this.imagePreviewAspectRatio = 16 / 9,
    this.min = 1,
    this.max = 1,
    this.fileSettings = const FormInputImagesFileSettings(),
    super.isOptional,
    this.onChange,
  }) :
    assert(min >= 1 && min <= max);


  bool get isSingleImage => min == 1 && max == 1;



}

