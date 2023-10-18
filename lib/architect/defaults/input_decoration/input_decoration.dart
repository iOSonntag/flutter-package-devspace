


part of devspace;

class DefaultInputDecoration extends ArchObject<InputDecoration, InputDecorationData> {

  static PlanBuilder<InputDecoration, kNoVariants, InputDecorationData> builder = (context, variant, data)
  {
    return DefaultInputDecoration(data: data).build(context);
  };

  DefaultInputDecoration({
    // TODO: add default sitch for arch objects and create mixin for the "default" part"
    // required super.variant,
    required super.data
  });

  @override
  InputDecoration build(BuildContext context)
  {
    Color defaultBorderColor = context.colors.onBackgroundLeastFocus;
    Color focusedBorderColor = context.colors.primary;
    Color errorBorderColor = context.colors.error;
    Color hintColor = context.colors.onBackgroundLessFocus;
    Color labelColor = context.colors.onBackgroundLessFocus;
    Color errorColor = context.colors.error;

    double defaultBorderWidth = context.dimensions.lineThicknessM;
    double focusedBorderWidth = context.dimensions.lineThicknessL;
    double errorBorderWidth = context.dimensions.lineThicknessL;

    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: defaultBorderWidth,
          color: defaultBorderColor
        ),
        borderRadius: context.dimensions.borderRadiusL,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: focusedBorderWidth,
          color: focusedBorderColor
        ),
        borderRadius: context.dimensions.borderRadiusL,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: errorBorderWidth,
          color: errorBorderColor
        ),
        borderRadius: context.dimensions.borderRadiusL,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: errorBorderWidth,
          color: errorBorderColor
        ),
        borderRadius: context.dimensions.borderRadiusL,
      ),
      hintText: data.hint,
      labelText: data.label,
      errorText: data.error,
      labelStyle: TextStyle(
        color: labelColor
      ),
      hintStyle: TextStyle(
        color: hintColor
      ),
      errorStyle: TextStyle(
        color: errorColor
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      errorMaxLines: 3,
      contentPadding: context.paddingM,
  );
  }
  
}

