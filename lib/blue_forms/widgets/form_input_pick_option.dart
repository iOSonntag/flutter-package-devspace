



part of devspace;


// TODO: refactor once onced once
class _FormInputPickOptionWidget extends StatefulWidget {

  final FormInputPickOption definition;
  final bool visuallyMarkRequired;
  final dynamic currentSavedValue;
  final String? externalError;
  final void Function(String? value) onSave;

  const _FormInputPickOptionWidget({
    super.key,
    required this.definition,
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

    if (_dropdownValue == null && widget.definition.isOptional)
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


    // TODO: find better way than to assume that the theming provides a border color and radius
    Color? borderColor = decoration.focusedBorder?.borderSide.color;
    BorderRadius? borderRadius;

    if (decoration.enabledBorder is OutlineInputBorder)
    {
      OutlineInputBorder border = decoration.enabledBorder! as OutlineInputBorder;
      borderRadius = border.borderRadius;
    }

    borderRadius ??= context.dimensions.borderRadiusM;

    List<DropdownMenuItem<String>> items = [];

    if (widget.definition.isOptional)
    {
      items.add(
        DropdownMenuItem<String>(
          value: _OPTION_SELECTION_UNSET_VALUE,
          child: TextBody.small(LibStrings.lib_blueForms_inputPickOption_pleaseChoose.tr(),
            color: context.colors.onBackgroundLessFocus,
          ),
        ),
      );
    }

    for (BlueFormsInputOptionSelectionItem fiItem in widget.definition.options)
    {
      items.add(
        DropdownMenuItem<String>(
          value: fiItem.id,
          child: TextBody.small(fiItem.title),
        ),
      );
    }

    return _FormInputContainerWidget(
      description: widget.definition.description,
      child: DropdownButtonFormField<String>(
        decoration: decoration,
        iconEnabledColor: borderColor,
        iconDisabledColor: borderColor,
        dropdownColor: context.colors.onBackground,
        value: _dropdownValue,
        borderRadius: borderRadius,
        selectedItemBuilder: (context)
        {
          List<Widget> selectedItems = [];

          if (widget.definition.isOptional)
          {
            selectedItems.add(
              TextBody.small(LibStrings.lib_blueForms_inputPickOption_pleaseChoose.tr(),
                color: context.colors.onBackgroundLessFocus,
              ),
            );
          }

          for (BlueFormsInputOptionSelectionItem fiItem in widget.definition.options)
          {
            selectedItems.add(
              TextBody.small(fiItem.title),
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
            widget.definition.onChange!(value);
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
    );
  }
}