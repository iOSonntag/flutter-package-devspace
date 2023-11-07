

part of devspace;

class DefaultButton extends ArchBaseVariantSwitch<kButtonVariant, ButtonData> {

  static PlanBuilderChildless<Widget, kButtonVariant, ButtonData> builder = (context, variant, data)
  {
    return DefaultButton(variant: variant, data: data);
  };

  const DefaultButton({
    super.key,
    required super.variant,
    required super.data
  });

  @override
  Widget buildStyle(BuildContext context, kButtonVariant style)
  {
    return switch (style)
    {
      kButtonVariant.soft => DefaultButtonSoft(data: data),
      kButtonVariant.regular => DefaultButtonRegular(data: data),
      kButtonVariant.special => DefaultButtonSpecial(data: data),
    };
  }
  
}

