



part of devspace;


class _FormInputPickOptionWidget extends StatefulWidget {

  final FormInputPickOption definition;
  final Color? labelColor;
  final bool onBackground;
  final bool visuallyMarkRequired;
  final dynamic currentSavedValue;
  final String? externalError;
  final void Function(String? value) onSave;

  const _FormInputPickOptionWidget({
    super.key,
    required this.definition,
    this.labelColor,
    required this.onBackground,
    required this.visuallyMarkRequired,
    required this.currentSavedValue,
    required this.onSave,
    this.externalError,
  });

  @override
  State<_FormInputPickOptionWidget> createState() => _FormInputPickOptionWidgetState();
}


// ignore: constant_identifier_names
const String _OPTION_SELECTION_UNSET_VALUE = '__UNSET';

class _FormInputPickOptionWidgetState extends State<_FormInputPickOptionWidget> {


  String? _dropdownValue;

  @override
  void initState()
  {
    super.initState();

    _dropdownValue = widget.currentSavedValue ?? widget.definition.initialValue;

    if (_dropdownValue.isNullOrEmpty && widget.definition.isOptional == false)
    {
      _dropdownValue = _OPTION_SELECTION_UNSET_VALUE;
    }
  }

  @override
  Widget build(BuildContext context)
  {
    final InputDecoration decoration = ArchInputDecoration.create(context, InputDecorationData(
      label: widget.definition.label,
      hint: LibStrings.lib_blueForms_inputPickOption_pleaseChoose.tr(),
      error: widget.externalError,
    ));


    // IMPROVE: find better way than to assume that the theming provides a border color and radius
    Color? borderColor = decoration.focusedBorder?.borderSide.color;
    BorderRadius? borderRadius;

    if (decoration.enabledBorder is OutlineInputBorder)
    {
      OutlineInputBorder border = decoration.enabledBorder! as OutlineInputBorder;
      borderRadius = border.borderRadius;
    }

    borderRadius ??= context.dimensions.borderRadiusM;

    List<DropdownMenuItem<String>> items = [];

    if (!widget.definition.isOptional)
    {
      items.add(
        DropdownMenuItem<String>(
          value: _OPTION_SELECTION_UNSET_VALUE,
          child: TextBody.small(LibStrings.lib_blueForms_inputPickOption_pleaseChoose.tr(),
            color: context.colors.onSurfaceLessFocus,
            // color: context.isDarkMode && context.isWeb ? Colors.white.withOpacity(0.7) : context.colors.onSurfaceLessFocus,
          ),
        ),
      );
    }

    for (FormsInputPickOptionItem fiItem in widget.definition.options)
    {

      items.add(
        DropdownMenuItem<String>(
          value: fiItem.key,
          child: _buildItem(context, fiItem, false),
        ),
      );
    }

    return _FormInputContainerWidget(
      description: widget.definition.description,
      extraButtons: widget.definition.extraButtons,
      hasLabel: widget.definition.label != null,
      onBackground: widget.onBackground,
      child: Column(
        children: [

          // TODOLIB: this is actually wrong an internal error through validatyion
          // could still accour and thus the label should still be colored red
          // see archtextfield for reference (there it is done correctly)
          _buildLabel(context, widget.externalError != null),

          DropdownButtonFormField<String>(
            decoration: decoration,
            iconEnabledColor: borderColor,
            iconDisabledColor: borderColor,
            dropdownColor: context.colors.surface,
            value: _dropdownValue,
            borderRadius: borderRadius,
            selectedItemBuilder: (context)
            {
              List<Widget> selectedItems = [];

              if (!widget.definition.isOptional)
              {
                selectedItems.add(
                  Padding(
                    padding: context.paddingM_0,
                    child: TextBody.small(LibStrings.lib_blueForms_inputPickOption_pleaseChoose.tr(),
                      color: widget.onBackground ? context.colors.onBackgroundLessFocus : context.colors.onSurfaceLessFocus,
                    ),
                  ),
                );
              }

              for (FormsInputPickOptionItem fiItem in widget.definition.options)
              {
                selectedItems.add(
                  Padding(
                    padding: context.paddingM_0,
                    child: _buildItem(context, fiItem, true),
                  ),
                );
              }

              return selectedItems;
            },
            onChanged: (String? value)
            {
              setState(()
              {
                _dropdownValue = value;
              });

              if (widget.definition.onChange != null)
              {
                widget.definition.onChange!(value == _OPTION_SELECTION_UNSET_VALUE ? null : value);
              }
            },
            items: items,
            validator: (value)
            {
              if (value == _OPTION_SELECTION_UNSET_VALUE)
              {
                value = null;
              }

              if (widget.definition.isOptional == false && (value == null || value.isEmpty))
              {
                return LibStrings.lib_blueForms_inputValidators_failedOptionSelectionUntouched.tr();
              }

              return null;
            },
            onSaved: (String? value)
            {
              if (value == _OPTION_SELECTION_UNSET_VALUE)
              {
                value = null;
              }

              widget.onSave(value);
            }
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, FormsInputPickOptionItem item, bool selected)
  {
    if (item.color == null)
    {
      return _buildItemInfo(context, item, selected);
    }

    return Row(
      children: [
        Container(
          width: selected ? context.dimensions.iconSizeS : context.dimensions.iconSizeM,
          height: selected ? context.dimensions.iconSizeS : context.dimensions.iconSizeM,
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [context.highlights.boxShadowM],
          ),
        ),

        selected ? context.spaceS : context.spaceM,

        _buildItemInfo(context, item, selected),
      ],
    );
  }

  Widget _buildItemInfo(BuildContext context, FormsInputPickOptionItem item, bool selected)
  {
    if (item.subtitle.isNullOrEmpty)
    {
      return _buildItemTitle(context, item.title, selected);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemTitle(context, item.title, selected),
        
        if (!selected) context.spaceXXS,
        
        TextBody.small(item.subtitle!,
          color: !selected ? context.colors.onSurfaceLessFocus : (widget.onBackground ? context.colors.onBackgroundLessFocus : context.colors.onSurfaceLessFocus),
          italic: true,
        ),
      ],
    );
  }

  Widget _buildItemTitle(BuildContext context, String title, bool selected)
  {
    if (selected)
    {
      return TextLabel.small(title,
        color: widget.onBackground ? context.colors.onBackground : context.colors.onSurface,
      );
    }

    return TextBody.medium(title,
      color: context.colors.onSurface,
    );
  }


  Widget _buildLabel(BuildContext context, bool hasError)
  {
    return Padding(
      padding: context.dimensions.paddingMOnly(left: true, bottom: true),
      child: Row(
        children: [
          TextLabel.small(
            widget.definition.label,
            color: hasError ? context.colors.error : widget.labelColor ?? (widget.onBackground ? context.colors.onBackgroundLessFocus : context.colors.onSurfaceLessFocus),
          ),

          if (widget.visuallyMarkRequired && widget.definition.isRequired) TextLabel.small(
            ' *',
            color: context.colors.primary,
          )
        ],
      ),
    );
  }
}