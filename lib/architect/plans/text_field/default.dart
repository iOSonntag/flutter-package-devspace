

part of devspace;


class DefaultTextField extends ArchBaseVariantSwitch<kTextFieldVariant, TextFieldData> {

  static PlanBuilder<Widget, kTextFieldVariant, TextFieldData> builder = (context, variant, data)
  {
    return DefaultTextField(variant: variant, data: data);
  };

  const DefaultTextField({
    super.key,
    required super.variant,
    required super.data
  });

  @override
  Widget buildStyle(BuildContext context, kTextFieldVariant style)
  {
    return switch (style)
    {
      kTextFieldVariant.regular => DefaultTextFieldRegular(data: data),
    };
  }
  
}

