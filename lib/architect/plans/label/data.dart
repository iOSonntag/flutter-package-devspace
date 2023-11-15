
part of devspace;

// ignore: camel_case_types
enum kLabelVariant
{
  regular,
}


class LabelData extends PlanData {

  final kSize3 size;
  final IconData? icon;
  final Color? color;
  final String? title;
  final String? subtitle;
  final String? explainationTitle;
  final String? explainationMessage;


  const LabelData({
    super.variationId,
    this.size = kSize3.M,
    this.icon,
    this.color,
    this.title,
    this.subtitle,
    this.explainationTitle,
    this.explainationMessage,
  });

}