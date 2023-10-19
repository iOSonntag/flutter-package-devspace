




part of devspace;

abstract class ArchBaseVariantSwitch<V extends Enum, T extends PlanData> extends StatelessWidget {

  final V variant;
  final T data;

  const ArchBaseVariantSwitch({
    super.key,
    required this.variant,
    required this.data
  });

  @override
  @nonVirtual
  Widget build(BuildContext context)
  {
    return buildStyle(context, variant);
  }

  Widget buildStyle(BuildContext context, V style);

  

}