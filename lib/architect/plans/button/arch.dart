


part of devspace;


class ArchButton extends ArchBase<kButtonVariant, ButtonData> {

  const ArchButton({
    super.key,
    super.data = const ButtonData(),
    super.variant = kButtonVariant.regular,
  });

  const ArchButton.soft({
    super.key,
    super.data = const ButtonData(),
  }) : super(variant: kButtonVariant.soft);

  const ArchButton.special({
    super.key,
    super.data = const ButtonData(),
  }) : super(variant: kButtonVariant.special);

}