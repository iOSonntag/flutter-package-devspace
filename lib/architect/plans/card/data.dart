
part of devspace;

// ignore: camel_case_types
enum kCardVariant
{
  regular,
  background
}


class CardData extends PlanDataWithChild {

  final Color? color;

  const CardData({
    super.variationId,
    this.color,
    required super.child,
  });

}