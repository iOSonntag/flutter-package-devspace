

part of devspace;

class ArchCard extends ArchBaseWithChild<kCardVariant, CardData> {


  const ArchCard({
    super.key,
    super.data = const CardData(),
    // required super.data,
    super.variant = kCardVariant.regular,
    required super.child,
  });


  const ArchCard.background({
    super.key,
    super.data = const CardData(),
    required super.child,
  }) : super(variant: kCardVariant.background);
  
}