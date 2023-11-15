
part of devspace;

// ignore: camel_case_types
enum kBonusInfoVariant
{
  regular,
}


class BonusInfoData extends PlanData {

  final kSize3 size;
  final IconData icon;
  final Color? iconColor;
  final String? title;
  final String? message;


  const BonusInfoData({
    super.variationId,
    this.size = kSize3.M,
    required this.icon,
    this.iconColor,
    this.title,
    required this.message,
  });

}