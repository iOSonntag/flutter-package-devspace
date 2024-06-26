
part of devspace;

// ignore: camel_case_types
enum kInfoBoxVariant
{
  regular,
  contentPlaceholder,
  smallBrick
}

// ignore: camel_case_types
enum kInfoBoxType
{
  info,
  warning,
  error,
  success,
  congratulations,
}

class InfoBoxData extends PlanData {

  final kInfoBoxType type;
  final bool onSurface;
  final IconData? icon;
  final String? title;
  final String? subtitle;
  final String? message;
  final String? actionTitle;
  final VoidCallback? onAction;


  const InfoBoxData({
    super.variationId,
    this.onSurface = false,
    this.type = kInfoBoxType.info,
    this.icon,
    this.title,
    this.subtitle,
    this.message,
    this.actionTitle,
    this.onAction,
  });

}