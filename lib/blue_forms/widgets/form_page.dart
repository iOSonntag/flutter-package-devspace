

part of devspace;



class BlueFormsPageFormController extends ChangeNotifier {

  bool canContinue = false;

  bool tryToContinue()
  {
    canContinue = false;

    notifyListeners();

    return canContinue;
  }

}

class _FormPageWidget extends StatefulWidget {

    final FormPage definition;
    final BlueFormsPageFormController controller;
    final Map<String, dynamic> currentSavedValues;
    final Map<String, String> badInputs;
    final void Function(String id, String? value) onSave;

    const _FormPageWidget({
      // ignore: unused_element
      super.key,
      required this.definition,
      required this.controller,
      required this.currentSavedValues,
      required this.badInputs,
      required this.onSave,
    });

    @override
    State<_FormPageWidget> createState() => _FormPageWidgetState();
}

class _FormPageWidgetState extends State<_FormPageWidget> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _alwaysValidate = false;

  @override
  void initState()
  {
    super.initState();

    widget.controller.addListener(_tryToContinueListener);
  }

  @override
  void didUpdateWidget(_FormPageWidget oldWidget)
  {
    if (!widget.controller.hasListeners)
    {
      widget.controller.addListener(_tryToContinueListener);
    }

    super.didUpdateWidget(oldWidget);
  }

  void _tryToContinueListener()
  {
    if (_formKey.currentState == null)
    {
      return;
    }

    bool valid = _formKey.currentState!.validate();

    if (valid)
    {
      _formKey.currentState!.save();

      widget.controller.canContinue = true;
    }
    else if (!_alwaysValidate)
    {
      setState(()
      {
        _alwaysValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context)
  {
    List<Widget> children = [

      context.spaceL,

      TextTitle.medium(widget.definition.title,
        textAlign: TextAlign.center,
      ),

      context.spaceL,

    ];

    if (widget.definition.description != null)
    {
      children.addAll([

        TextBody.small(widget.definition.description,
          textAlign: TextAlign.center,
          lineHeight: 1.4,
        ),

        context.spaceL,

      ]);
    }

    for (int i = 0; i < widget.definition.elements.length; i++)
    {
      FormElement fiInputDefinition = widget.definition.elements[i];

      if (fiInputDefinition.isActive == false)
      {
        continue;
      }

      if (fiInputDefinition is FormInput)
      {
        children.add(_buildInput(context, fiInputDefinition, i == 0, i == widget.definition.elements.length - 1));
      }

      if (fiInputDefinition is FormCustomWidget)
      {
        children.add(fiInputDefinition.widget);
      }

    }
        

    return SingleChildScrollView(
      physics: context.animations.scrollPhysics,
      child: Form(
        key: _formKey,
        autovalidateMode: _alwaysValidate ? AutovalidateMode.always : null,
        child: Container(
          padding: context.paddingL,
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }

  Widget _buildInput(BuildContext context, FormInput definition, bool first, bool last)
  {
    // TODO: use first and last to setup return key logic and stuff, note that the last input might not be the last text input
    String? errorMsg = widget.badInputs[definition.id];
    

    if (definition is FormInputText)
    {
      return _FormInputTextWidget(
        key: Key(definition.id),
        definition: definition,
        currentSavedValue: widget.currentSavedValues[definition.id],
        errorMsg: errorMsg,
        onSave: (value)
        {
          widget.onSave(definition.id, value);
        },
      );
    }

    if (definition is FormInputPickOption)
    {
      return _FormInputPickOptionWidget(
        key: Key(definition.id),
        definition: definition,
        currentSavedValue: widget.currentSavedValues[definition.id],
        errorMsg: errorMsg,
        onSave: (value)
        {
          widget.onSave(definition.id, value);
        },
      );
    }

    if (definition is FormInputGroup)
    {
      List<Widget> groupChildren = [];

      for (int i = 0; i < definition.inputs.length; i++)
      {
        FormInput fiInputDefinition = definition.inputs[i];

        if (fiInputDefinition.isActive == false)
        {
          continue;
        }

        groupChildren.add(_buildInput(context, fiInputDefinition, i == 0 && first, i == widget.definition.elements.length - 1 && last));
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: groupChildren,
      );
    }

    throw Exception('BlueForms input type unsupported $definition.');
  }
}