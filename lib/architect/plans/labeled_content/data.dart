
part of devspace;

// ignore: camel_case_types
enum kLabeledContentVariant
{
  regular,
}


class LabeledContentData extends PlanData {

  final kSize3 size;
  final EdgeInsets? labelPadding;
  final EdgeInsets? contentPadding;

  final LabelData labelData;
  final bool emphasized;
  final Widget? contentWidget;
  final String? contentText;



  const LabeledContentData({
    super.variationId,
    this.size = kSize3.M,
    this.labelPadding,
    this.contentPadding,
    required this.labelData,
    this.emphasized = false,
    this.contentWidget,
    this.contentText,
  });

}