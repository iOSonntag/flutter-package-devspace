

part of devspace;



class FormPageController extends ChangeNotifier {

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
  final FormPageController controller;
  final bool visuallyMarkRequiredFields;
  final Map<String, dynamic> currentSavedValues;
  final Map<String, String> externalErrors;
  final void Function(String id, dynamic value) onSave;
  final VoidCallback onValidationFailed;

  const _FormPageWidget({
    // ignore: unused_element
    super.key,
    required this.definition,
    required this.controller,
    required this.visuallyMarkRequiredFields,
    required this.currentSavedValues,
    required this.externalErrors,
    required this.onSave,
    required this.onValidationFailed,
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
    if (oldWidget.controller != widget.controller)
    {
      oldWidget.controller.removeListener(_tryToContinueListener);

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

      widget.onValidationFailed();
    }
  }

  @override
  Widget build(BuildContext context)
  {
    List<Widget> children = [
      Padding(
        padding: context.padding0_XL,
        child: TextTitle.medium(widget.definition.title,
          textAlign: TextAlign.center,
        ),
      ),

      if (widget.definition.description != null) Padding(
        padding: context.dimensions.paddingXLOnly(bottom: true),
        child: TextBody.medium(widget.definition.description,
          textAlign: TextAlign.center,
          lineHeight: 1.4,
        ),
      ),

      context.spaceL,
    ];

    bool displayRequiredNotice = false;

    for (int i = 0; i < widget.definition.elements.length; i++)
    {
      children.add(
        _FormElementWidget(
          definition: widget.definition.elements[i], 
          isFirstElement: i == 0, 
          isLastElement: i == widget.definition.elements.length - 1, 
          visuallyMarkRequired: widget.visuallyMarkRequiredFields,
          currentSavedValues: widget.currentSavedValues, 
          externalErrors: widget.externalErrors, 
          onSave: widget.onSave
        )
      );

      if (widget.visuallyMarkRequiredFields && displayRequiredNotice == false)
      {
        if (widget.definition.elements[i].isRequired)
        {
          displayRequiredNotice = true;
        }
      }

      bool isLastElement = i == widget.definition.elements.length - 1;

      if (!isLastElement || displayRequiredNotice)
      {
        children.add(context.spaceXL);
      }
    }

    if (displayRequiredNotice)
    {
      children.add(
        Padding(
          padding: context.dimensions.paddingXLOnly(bottom: true),
          child: Row(
            children: [
              Icon(Icons.info_outline_rounded,
                color: context.colors.onBackgroundLeastFocus,
                size: context.dimensions.iconSizeXS,
              ),
              context.spaceS,
              TextBody.small(LibStrings.lib_blueForms_requiredFieldsNotice.tr(args: ['*']),
                color: context.colors.onBackgroundLeastFocus,
              ),
            ],
          ),
        ),
      );
    }
        

    return SingleChildScrollView(
      physics: context.animations.scrollPhysics,
      child: Form(
        key: _formKey,
        autovalidateMode: _alwaysValidate ? AutovalidateMode.always : null,
        child: Container(
          padding: context.paddingXL,
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}