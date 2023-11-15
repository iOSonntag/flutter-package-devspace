

part of devspace;

class ArchLabeledContent extends ArchBase<kLabeledContentVariant, LabeledContentData> {

  ArchLabeledContent({
    super.key,
    super.variant = kLabeledContentVariant.regular,
    String? variationId,
    kSize3 size = kSize3.M,
    EdgeInsets? labelPadding,
    IconData? labelIcon,
    Color? labelColor,
    String? labelTitle,
    String? labelSubtitle,
    String? explainationTitle,
    String? explainationMessage,
    EdgeInsets? contentPadding,
    String? contentText,
    bool emphasized = false,
    Widget? contentWidget,
  }) :
    super(
      data: LabeledContentData(
        variationId: variationId,
        size: size,
        labelPadding: labelPadding,
        contentPadding: contentPadding,
        contentText: contentText,
        emphasized: emphasized,
        contentWidget: contentWidget,
        labelData: LabelData(
          size: size,
          icon: labelIcon,
          color: labelColor,
          title: labelTitle,
          subtitle: labelSubtitle,
          explainationTitle: explainationTitle,
          explainationMessage: explainationMessage,
        )
      )
    );
  
}