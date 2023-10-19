


part of devspace;

class ArchInputDecoration extends ArchObjectBase<InputDecoration, kNoVariants, InputDecorationData> {

  const ArchInputDecoration(super.data, {
    super.variant = kNoVariants.regular,
  });

  static InputDecoration create(BuildContext context, [InputDecorationData? data])
  {
    return ArchInputDecoration(data ?? const InputDecorationData()).build(context);
  }

}