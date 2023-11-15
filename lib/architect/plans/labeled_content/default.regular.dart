

part of devspace;


class DefaultLabeledContentRegular extends ArchBaseStatelessWidget<LabeledContentData> {

  DefaultLabeledContentRegular({
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        _buildLabel(context),

        _buildContent(context),

      ],
    );
  }

  Widget _buildLabel(BuildContext context)
  {
    EdgeInsets padding = data.labelPadding ?? context.paddingM;

    return Padding(
      padding: padding,
      child: ArchLabel.fromData(data: data.labelData),
    );
  }

  Widget _buildContent(BuildContext context)
  {
    Widget content = data.contentWidget ?? _buildTextContent(context);

    return Padding(
      padding: _contentPadding(context),
      child: content,
    );
  }

  EdgeInsets _contentPadding(BuildContext context)
  {
    if (data.contentPadding != null)
    {
      return data.contentPadding!;
    }

    EdgeInsets padding = context.paddingM.fineLeft(_iconSize(context) + context.dimensions.spaceSValue);

    if (!data.emphasized)
    {
      return padding.excludeTop();
    }

    return padding;
  }


  double _iconSize(BuildContext context)
  {
    return switch (data.size)
    {
      kSize3.S => context.dimensions.iconSizeXS,
      kSize3.M => context.dimensions.iconSizeS,
      kSize3.L => context.dimensions.iconSizeM,
    };
  }

  Widget _buildTextContent(BuildContext context)
  {
    if (data.emphasized)
    {
      return TextHeadline.size3(
        data.size,
        data.contentText,
        bold: true,
        lineHeight: 1.0
      );
    }

    return TextBody.size3(
      data.size,
      data.contentText,
    );
  }

}















