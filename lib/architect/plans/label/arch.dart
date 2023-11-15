

part of devspace;

class ArchLabel extends ArchBase<kLabelVariant, LabelData> {

  ArchLabel({
    super.key,
    super.variant = kLabelVariant.regular,
    String? variationId,
    kSize3 size = kSize3.M,
    IconData? icon,
    Color? color,
    String? title,
    String? subtitle,
    String? explainationTitle,
    String? explainationMessage,
  }) :
    super(
      data: LabelData(
        variationId: variationId,
        size: size,
        icon: icon,
        color: color,
        title: title,
        subtitle: subtitle,
        explainationTitle: explainationTitle,
        explainationMessage: explainationMessage,
      )
    );

  const ArchLabel.fromData({
    super.key,
    super.variant = kLabelVariant.regular,
    required LabelData data,
  }) : super(data: data);
  
}