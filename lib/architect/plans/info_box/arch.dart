

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
    bool onSurface = false,
    IconData? icon,
    String? title,
    String? subtitle,
    String? message,
    String? actionTitle,
    VoidCallback? onAction,
    super.variant = kInfoBoxVariant.regular,
  }) : super(
    data: InfoBoxData(
      onSurface: onSurface,
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
    bool onSurface = false,
    IconData? icon,
    String? title,
    String? subtitle,
    String? message,
    String? actionTitle,
    VoidCallback? onAction,
    super.variant = kInfoBoxVariant.regular,
  }) : super(
    data: InfoBoxData(
      onSurface: onSurface,
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