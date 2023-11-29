

part of devspace;


class DefaultImageRegular extends ArchBaseStatelessWidget<ImageData> {

  DefaultImageRegular({
    super.key,
    required super.data
  }) : super(allowCustomVariants: false);


  @override
  bool hasMinimumRequirements() => true;
    
  
  @override
  void checkUnsupportedFields()
  {
    
  }

  @override
  Widget build(BuildContext context)
  {
    Widget widget = Image(
      fit: data.style.fit,
      image: data.image
    );

    if (data.style.borderPreset != kImageBorderPreset.rectangle)
    {
      BorderRadiusGeometry radius = data.style.borderRadius ?? (data.style.borderPreset == kImageBorderPreset.rounded ? context.dimensions.borderRadiusM : BorderRadius.circular(double.infinity));

      widget = ClipRRect(
        borderRadius: radius,
        child: widget,
      );
    }

    if (data.style.aspectRatio != null)
    {
      widget = AspectRatio(
        aspectRatio: data.style.aspectRatio!,
        child: widget,
      );
    }

    return widget;
  }

}















