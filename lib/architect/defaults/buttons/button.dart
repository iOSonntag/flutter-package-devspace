

part of devspace;

class DefaultButton extends DefaultVariantSwitch<kButtonVariant, ButtonData> {

  static PlanBuilder<Widget, kButtonVariant, ButtonData> builder = (BuildContext context, kButtonVariant variant, ButtonData data)
  {
    return DefaultButton(variant: variant, data: data);
  };

  DefaultButton({
    super.key,
    required super.variant,
    required super.data
  });

  @override
  Widget buildStyle(BuildContext context, kButtonVariant style)
  {
    switch (style)
    {
      case kButtonVariant.soft: return DefaultButtonSoft(data: data);
      case kButtonVariant.regular: return DefaultButtonRegular(data: data);
      case kButtonVariant.special: return DefaultButtonSpecial(data: data);
    }
  }
  
  @override
  bool hasMinimumRequirements(ButtonData data) =>
    data.onPrimaryAction != null &&
    (data.title != null || data.icon != null);
    
  
  @override
  void checkUnsupportedFields(ButtonData data)
  {
    unsupportedIf(data.icon != null && data.title != null, 'icon and title', 'they can not be used together');
    unsupportedIf(data.size != kSize3.M, 'size', 'only M is supported');
    unsupported(data.child, 'child');
    unsupported(data.subtitle, 'subtitle');
    unsupported(data.onSecondaryAction, 'onSecondaryAction');
    unsupported(data.onTertiaryAction, 'onTertiaryAction');
  }
    
}

