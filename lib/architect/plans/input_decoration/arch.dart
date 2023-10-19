


part of devspace;

class ArchInputDecoration extends ArchObjectBase<InputDecoration, kNoVariants, InputDecorationData> {

  const ArchInputDecoration({
    super.data = const InputDecorationData(),
    super.variant = kNoVariants.regular,
  });

  static InputDecoration create(BuildContext context, [InputDecorationData? data])
  {
    return const ArchInputDecoration().build(context);
  }

}