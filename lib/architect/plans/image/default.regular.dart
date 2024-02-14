

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

    if (data.style.colorFilter != null)
    {
      widget = ColorFiltered(
        colorFilter: data.style.colorFilter!,
        child: widget,
      );
    }

    if (data.style.padding != null)
    {
      widget = Padding(
        padding: data.style.padding!,
        child: widget,
      );
    }

    if (data.style.backgroundColor != null)
    {
      widget = Container(
        color: data.style.backgroundColor,
        child: widget,
      );
    }

    BorderRadiusGeometry? radius;

    if (data.style.shapePreset != kImageShapePreset.rectangle)
    {
      radius = data.style.borderRadius ?? (data.style.shapePreset == kImageShapePreset.rounded ? context.dimensions.borderRadiusM : BorderRadius.circular(double.infinity));

      widget = ClipRRect(
        borderRadius: radius,
        child: widget,
      );
    }

    if (data.style.edgePreset != kImageEdgePreset.none)
    {
      widget = _buildEdgeWidget(context, widget, radius);
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

  Widget _buildEdgeWidget(BuildContext context, Widget child, BorderRadiusGeometry? radius)
  {
    BoxShadow? shadow;

    switch (data.style.edgePreset)
    {
      case kImageEdgePreset.outerShadowS:
        shadow = context.highlights.boxShadowS;
        break;
      case kImageEdgePreset.outerShadowM:
        shadow = context.highlights.boxShadowM;
        break;
      case kImageEdgePreset.outerShadowL:
        shadow = context.highlights.boxShadowL;
        break;
      default:
        break;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          if (shadow != null) shadow
        ],
      ),
      child: child,
    );
  }

}















