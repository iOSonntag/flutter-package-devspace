


part of devspace;


class ArchButton extends ArchBase<kButtonVariant, ButtonData> {

  const ArchButton(super.data, {
    super.key,
    super.variant = kButtonVariant.regular,
  });

  const ArchButton.soft(super.data, {
    super.key,
  }) : super(variant: kButtonVariant.soft);

  const ArchButton.special(super.data, {
    super.key,
  }) : super(variant: kButtonVariant.special);

}