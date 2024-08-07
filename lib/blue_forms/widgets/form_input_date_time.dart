



part of devspace;

class _FormInputDateTimeWidget extends material.StatefulWidget {

  final FormInputDateTime definition;
  final Color? labelColor;
  final bool visuallyMarkRequired;
  final dynamic currentSavedValue;
  final String? externalError;
  final void Function(DateTime? value) onSave;
  final VoidCallback onSubmitRequested;

  const _FormInputDateTimeWidget({
    super.key,
    required this.definition,
    this.labelColor,
    required this.visuallyMarkRequired,
    required this.currentSavedValue,
    required this.onSave,
    required this.onSubmitRequested,
    this.externalError,
  });

  @override
  material.State<_FormInputDateTimeWidget> createState() => _FormInputDateTimeWidgetState();
}

class _FormInputDateTimeWidgetState extends material.State<_FormInputDateTimeWidget> {


  DateTime? _value;

  @override
  void initState() {
    _value = widget.currentSavedValue as DateTime? ?? widget.definition.initialValue;
    super.initState();
  }

  String _toDisplayString(DateTime? value)
  {
    if (value == null)
    {
      return '';
    }

    if (widget.definition.toDisplayString != null)
    {
      return widget.definition.toDisplayString!(value);
    }

    DateTime converted = value.toLocal();

    if (widget.definition.type == kFormInputDateTimeType.date)
    {
      return DateFormat.yMd().format(converted);
    }

    if (widget.definition.type == kFormInputDateTimeType.time)
    {
      return DateFormat.Hm().format(converted);
    }

    return '${DateFormat.yMd().format(converted)} - ${DateFormat.Hm().format(converted)}';
  }

  Future<void> _pickDateTime() async
  {
    DateTime? dateTime = await showOmniDateTimePicker(
      context: context,
      initialDate: _value,
      firstDate: widget.definition.firstDate ?? DateTime(1900),
      lastDate: widget.definition.lastDate ?? DateTime(2100),
      is24HourMode: true,
      isShowSeconds: false,
      type: switch (widget.definition.type)
      {
        kFormInputDateTimeType.date => OmniDateTimePickerType.date,
        kFormInputDateTimeType.time => OmniDateTimePickerType.time,
        kFormInputDateTimeType.dateAndTime => OmniDateTimePickerType.dateAndTime,
      },
      constraints: const BoxConstraints(
        maxWidth: 400.0,
      ),
      minutesInterval: 1,
      secondsInterval: 1,
      borderRadius: context.dimensions.borderRadiusL,
      barrierDismissible: false,
    );

    widget.definition.onChange?.call(dateTime);
    setState(() {
      _value = dateTime;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return _FormInputContainerWidget(
      description: widget.definition.description,
      child: TapDetector(
        onTap: _pickDateTime,
        child: _FakeTextField<DateTime>(
          labelColor: widget.labelColor,
          visuallyMarkAsRequired: widget.visuallyMarkRequired && widget.definition.isOptional == false,
          label: widget.definition.label,
          hint: widget.definition.hint,
          externalError: widget.externalError,
          value: _value,
          toDisplayString: _toDisplayString,
          onSave: (value)
          {
            widget.onSave(value);
          },
          validator: (value)
          {
            if (!widget.definition.isOptional && value == null)
            {
              return InputValidators.notEmpty()(null);
            }
            
            return null;
          },
        ),
      )
    );


  }
}



class _FakeTextField<T> extends material.StatefulWidget {
  
  final T? value;
  final void Function(T?)? onSave;
  final String? Function(T?)? validator;
  final String? externalError;
  final String? label;
  final Color? labelColor;
  final bool visuallyMarkAsRequired;
  final String? hint;
  final String Function(T? value) toDisplayString;

  const _FakeTextField({
    this.value,
    this.onSave,
    this.validator,
    this.externalError,
    this.label,
    this.labelColor,
    this.hint,
    this.visuallyMarkAsRequired = false,
    required this.toDisplayString,
  });

  @override
  material.State<_FakeTextField<T>> createState() => _FakeTextFieldState<T>();
}

class _FakeTextFieldState<T> extends material.State<_FakeTextField<T>> {


  FormFieldState<T>? _state;

  @override
  void didUpdateWidget(covariant _FakeTextField<T> oldWidget)
  {
    if (oldWidget.value != widget.value)
    {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _state?.didChange(widget.value);
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context)
  {
    return FormField<T>(
      initialValue: widget.value,
      onSaved: widget.onSave,
      validator: widget.validator,
      builder: (FormFieldState<T> state)
      {
        _state = state;

        bool hasError = state.hasError || widget.externalError != null;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            if (widget.label != null) _buildLabel(context, hasError),
      
            Container(
              decoration: BoxDecoration(
                  borderRadius: context.dimensions.borderRadiusL,
                  color: context.colors.surface,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: context.dimensions.borderRadiusL,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                    ),
                    BoxShadow(
                      color: Theme.of(context).colorScheme.surface,
                      spreadRadius: -1.0,
                      blurRadius: 3.0,
                    ),
                  ]
                ),
                child: ControllerHolder<TextEditingController>(
                  create: () => TextEditingController(text: widget.toDisplayString(state.value)),
                  builder: (context, controller)
                  {
                    String newDisplayValue = widget.toDisplayString(state.value);

                    if (newDisplayValue != controller.text)
                    {
                      controller.text = newDisplayValue;
                    }

                    return ScrollConfiguration(
                      behavior: const NoScrollBarBehavior(),
                      child: TextField(
                        controller: controller,
                        enabled: false,
                        style: context.text.bodyMedium,
                        decoration: _buildInputDecoration(context, hasError),
                        maxLines: 1,
                        scrollPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 500.0),
                        autocorrect: false,
                        enableSuggestions: false,
                      ),
                    );
                  },
                ),
              ),
            ),

            if (hasError) Padding(
              padding: context.dimensions.paddingMOnly(left: true, top: true),
              child: TextLabel.small(
                state.errorText ?? widget.externalError,
                color: context.colors.error,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLabel(BuildContext context, bool hasError)
  {
    return Padding(
      padding: context.dimensions.paddingMOnly(left: true, bottom: true),
      child: Row(
        children: [
          TextLabel.small(
            widget.label!,
            color: hasError ? context.colors.error : widget.labelColor ?? context.colors.onBackgroundLessFocus,
          ),

          if (widget.visuallyMarkAsRequired) TextLabel.small(
            ' *',
            color: context.colors.primary,
          )
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context, bool hasError)
  {
    Color focusColor = context.colors.primary;
    Color hintColor = context.colors.onSurfaceLeastFocus;
    Color errorColor = context.colors.error;


    InputBorder? enabledBorder = _buildBorder(context, Colors.transparent, 0.0);
    InputBorder? focusedBorder = _buildBorder(context, focusColor, context.dimensions.lineThicknessL);

    if (hasError)
    {
      enabledBorder = _buildBorder(context, errorColor, context.dimensions.lineThicknessM);
      focusedBorder = _buildBorder(context, errorColor, context.dimensions.lineThicknessL);
    }

    return InputDecoration(
      enabledBorder: enabledBorder,
      disabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      hintText: widget.hint,
      hintStyle: TextStyle(
        color: hintColor,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      errorMaxLines: 3,
      contentPadding: context.paddingL_M,
    );
  }

  InputBorder _buildBorder(BuildContext context, Color color, double width)
  {
    return OutlineInputBorder(
      // gapPadding: context.dimensions.spaceMValue,
      borderSide: BorderSide(
        width: width,
        color: color
      ),
      borderRadius: context.dimensions.borderRadiusL,
    );
  }
}