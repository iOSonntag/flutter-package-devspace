

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

    BorderRadius? radius;

    if (data.style.shapePreset != kImageShapePreset.rectangle)
    {
      radius = data.style.borderRadius ?? (data.style.shapePreset == kImageShapePreset.rounded ? context.dimensions.borderRadiusM : BorderRadius.circular(10000));

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

  Widget _buildEdgeWidget(BuildContext context, Widget child, BorderRadius? radius)
  {
    BoxShadow? shadow;
    BoxBorder? border;

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
      case kImageEdgePreset.borderS:
        border = Border.all(
          color: data.style.borderColor ?? context.colors.primary,
          width: context.dimensions.borderThicknessS,
        );
        break;
      case kImageEdgePreset.borderM:
        border = Border.all(
          color: data.style.borderColor ?? context.colors.primary,
          width: context.dimensions.borderThicknessM,
        );
        break;
      case kImageEdgePreset.borderL:
        border = Border.all(
          color: data.style.borderColor ?? context.colors.primary,
          width: context.dimensions.borderThicknessL,
        );
        break;
      default:
        break;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: _borderRadiusForOuterContainer(context, radius, border),
        border: border,
        boxShadow: [
          if (shadow != null) shadow
        ],
      ),
      child: child,
    );
  }

  BorderRadius? _borderRadiusForOuterContainer(BuildContext context, BorderRadius? original, BoxBorder? border)
  {
    if (original == null)
    {
      return null;
    }

    if (border == null)
    {
      return original;
    }

    final add = (border.top.width);

    return BorderRadius.only(
      topLeft: Radius.circular(original.topLeft.x + add),
      topRight: Radius.circular(original.topRight.x + add),
      bottomLeft: Radius.circular(original.bottomLeft.x + add),
      bottomRight: Radius.circular(original.bottomRight.x + add),
    );
  }

}















