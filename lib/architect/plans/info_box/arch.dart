

part of devspace;

class ArchInfoBox extends ArchBase<kInfoBoxVariant, InfoBoxData> {

  const ArchInfoBox({
    super.key,
    super.data = const InfoBoxData(),
    // required super.data,
    super.variant = kInfoBoxVariant.regular,
  });

  ArchInfoBox.info({
    super.key,
    IconData? icon,
    String? title,
    String? subtitle,
    String? message,
    String? actionTitle,
    VoidCallback? onAction,
    super.variant = kInfoBoxVariant.regular,
  }) : super(
    data: InfoBoxData(
      type: kInfoBoxType.info,
      icon: icon,
      title: title,
      subtitle: subtitle,
      message: message,
      actionTitle: actionTitle,
      onAction: onAction,
    )
  );

  ArchInfoBox.error({
    super.key,
    IconData? icon,
    String? title,
    String? subtitle,
    String? message,
    String? actionTitle,
    VoidCallback? onAction,
    super.variant = kInfoBoxVariant.regular,
  }) : super(
    data: InfoBoxData(
      type: kInfoBoxType.error,
      icon: icon,
      title: title,
      subtitle: subtitle,
      message: message,
      actionTitle: actionTitle,
      onAction: onAction,
    )
  );
  
}