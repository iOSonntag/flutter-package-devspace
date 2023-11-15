

part of devspace;

class ArchBonusInfo extends ArchBase<kBonusInfoVariant, BonusInfoData> {

  ArchBonusInfo({
    super.key,
    super.variant = kBonusInfoVariant.regular,
    String? variationId,
    kSize3 size = kSize3.M,
    IconData icon = Symbols.help_outline_rounded,
    Color? iconColor,
    String? title,
    String? message,
  }) : 
    super(
      data: BonusInfoData(
        variationId: variationId,
        size: size,
        icon: icon,
        iconColor: iconColor,
        title: title,
        message: message,
      )
    );
  
}