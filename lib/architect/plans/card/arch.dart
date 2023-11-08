

part of devspace;

class ArchCard extends ArchBase<kCardVariant, CardData> {


  ArchCard({
    super.key,
    super.variant = kCardVariant.regular,
    String? variationId,
    Color? color,
    required Widget child,
  }) : super(
    data: CardData(
      variationId: variationId,
      color: color,
      child: child,
    ),
  );


  ArchCard.background({
    super.key,
    String? variationId,
    Color? color,
    required Widget child,
  }) : super(
    variant: kCardVariant.background,
    data: CardData(
      variationId: variationId,
      color: color,
      child: child,
    ),
  );
  
}