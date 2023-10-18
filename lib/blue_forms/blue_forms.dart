


// TODO: next and previous page doenst hide keyboard atm BUT the focus node is the last active textfield leading into wrong textfield to enter input!!!!!!


part of devspace;

abstract class BlueFormsPageDefinition {

  const BlueFormsPageDefinition();

  bool allowsToContinue();

}

class BlueFormsPageInfoDefinition extends BlueFormsPageDefinition {

  final String title;
  final String description;

  const BlueFormsPageInfoDefinition({
    required this.title,
    required this.description,
  });
  
  @override
  bool allowsToContinue()
  {
    return true;
  }
}

class BlueFormsPageFormDefinition extends BlueFormsPageDefinition {

  final String title;
  final String? description;
  final List<BlueFormsElementDefinition> elements;
  BlueFormsPageFormController? _controller;

  BlueFormsPageFormDefinition({
    required this.title,
    this.description,
    required this.elements,
  });


  
  @override
  bool allowsToContinue()
  {
    if (_controller != null)
    {
      return _controller!.tryToContinue();
    }

    return false;
  }

}

typedef BlueFormsInputChangeHandler = void Function(dynamic newValue);

abstract class BlueFormsElementDefinition {
  final String id;
  final bool isActive;

  const BlueFormsElementDefinition({
    required this.id,
    this.isActive = true,
  });
}

class BlueFormsCustomWidgetDefinition extends BlueFormsElementDefinition {
  final Widget child;

  const BlueFormsCustomWidgetDefinition({
    required super.id,
    required this.child,
    super.isActive = true,
  });
}

abstract class BlueFormsInputDefinition extends BlueFormsElementDefinition {

  final dynamic initialValue;
  final bool isOptional;
  final String? description;
  final String? label;

  const BlueFormsInputDefinition({
    required super.id,
    this.initialValue,
    this.isOptional = false,
    this.description,
    this.label,
    super.isActive = true,
  });

}

// TODO: IMPROVEMENT add isOptional and label and description to group cascading the isOptional value down to the fields
class BlueFormsInputGroup extends BlueFormsInputDefinition {

  final List<BlueFormsInputDefinition> inputs;

  const BlueFormsInputGroup({
      required this.inputs,
      super.isActive,
  }) :
    super(id: '');

}

class BlueFormsCommonInputs {

  BlueFormsCommonInputs._();

  // TODO: maybe add server name
  /// Creates inputs with ids:
  /// - AddressStreet
  /// - AddressPostalCode
  /// - AddressCity
  /// - (AddressCountry)
  static BlueFormsInputDefinition address({
    required String idPrefix,
    String? description,
    bool isOptional = false,
    bool isActive = true,
    bool includeCountry = false,
    String? initialStreet,
    String? initialPostalCode,
    String? initialCity,
    String? initialCountry,
  })
  {
    assert(includeCountry || initialCountry == null, 'You provided a initial country, but the widget ignores the country. Set [includeCountry] to true.');

    if (includeCountry)
    {
      throw UnimplementedError('This feature has not been implemented yet.');
    }


    return BlueFormsInputGroup(
      isActive: isActive,
      inputs: [

        BlueFormsInputTextDefinition(
          id: '${idPrefix}AddressStreet',
          description: description,
          autocorrect: false,
          isOptional: isOptional,
          initialValue: initialStreet,
          label: LibStrings.lib_blueFormsCommonInputs_address_streetLabel.tr(),
          hint: LibStrings.lib_blueFormsCommonInputs_address_streetHint.tr(),
          autofillHints: const [
              // TODO: check if ts the correct value
              AutofillHints.fullStreetAddress
          ],
          validationType: kBlueFormsInputTextValidationType.trimNotEmpty,
        ),

        BlueFormsInputTextDefinition(
          id: '${idPrefix}AddressPostalCode',
          description: description,
          autocorrect: false,
          isOptional: isOptional,
          initialValue: initialPostalCode,
          label: LibStrings.lib_blueFormsCommonInputs_address_postalCodeLabel.tr(),
          hint: LibStrings.lib_blueFormsCommonInputs_address_postalCodeHint.tr(),
          autofillHints: const [
              AutofillHints.postalCode
          ],
          validationType: kBlueFormsInputTextValidationType.trimNotEmpty,
        ),

        BlueFormsInputTextDefinition(
          id: '${idPrefix}AddressCity',
          description: description,
          autocorrect: false,
          isOptional: isOptional,
          initialValue: initialPostalCode,
          label: LibStrings.lib_blueFormsCommonInputs_address_cityLabel.tr(),
          hint: LibStrings.lib_blueFormsCommonInputs_address_cityHint.tr(),
          autofillHints: const [
              AutofillHints.addressCity
          ],
          validationType: kBlueFormsInputTextValidationType.trimNotEmpty,
        ),

      ],
    );
  }

}

// ignore: camel_case_types
enum kBlueFormsInputTextValidationType
{
    none,
    trimNotEmpty,
    notEmpty,
    phoneNumber,
    custom
}

/// If the input is marked as [isOptional] and a validator is set,
/// the field gets only validated if it contains input. White spaces 
/// are only excluded from this check if [trimOnSave] is enabled.
class BlueFormsInputTextDefinition extends BlueFormsInputDefinition {

  final String? hint;
  final bool trimOnSave;
  final bool isTextArea;
  final kBlueFormsInputTextValidationType validationType;
  final InputValidator? customValidator;
  final int? overwriteDecorationStyle;
  final Iterable<String>? autofillHints;
  final bool autocorrect;
  final bool obscureText;
  final bool enableSuggestions;
  final TextInputType? keyboardType;
  final void Function(String newValue)? onChange;

  const BlueFormsInputTextDefinition({
    required super.id,
    super.initialValue,
    super.description,
    super.label,
    this.hint,
    this.validationType = kBlueFormsInputTextValidationType.trimNotEmpty,
    this.customValidator,
    this.trimOnSave = true,
    this.isTextArea = false,
    super.isOptional,
    this.overwriteDecorationStyle,
    this.autofillHints,
    this.autocorrect = true,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.keyboardType,
    this.onChange,
    super.isActive,
  }) :
    assert((customValidator == null && validationType != kBlueFormsInputTextValidationType.custom) || (customValidator != null && validationType == kBlueFormsInputTextValidationType.custom)),
    assert(isOptional == true || validationType != kBlueFormsInputTextValidationType.none);

}

class BlueFormsInputOptionSelectionDefinition extends BlueFormsInputDefinition {

  final List<BlueFormsInputOptionSelectionItem> options;
  final int? overwriteDecorationStyle;
  final void Function(String? newValue)? onChange;

  const BlueFormsInputOptionSelectionDefinition({
    required super.id,
    super.initialValue,
    super.description,
    super.label,
    super.isActive,
    required this.options,
    super.isOptional,
    this.overwriteDecorationStyle,
    this.onChange,
  });

}

class BlueFormsInputOptionSelectionItem {

  final String id;
  final String title;

  const BlueFormsInputOptionSelectionItem({
    required this.id,
    required this.title,
  });

}

typedef OnCompleteBlueForms = void Function(Map<String, dynamic> formValues);

class BlueForms extends StatefulWidget {

  final VoidCallback? onCancel;
  final OnCompleteBlueForms onComplete;
  final Color? processBarActiveColor;
  final int textFieldDecorationStyle;
  final bool buttonSplitterEnabled;
  final List<BlueFormsPageDefinition> pages;
  final BlueFormsController? controller;
  final String? customFinalButtonTitle;

  const BlueForms({
    super.key,
    this.onCancel,
    this.controller,
    required this.onComplete,
    this.processBarActiveColor,
    this.textFieldDecorationStyle = 0,
    this.buttonSplitterEnabled = true,
    this.customFinalButtonTitle,
    required this.pages,
  }) :
    assert(pages.length > 0);

  @override
  State<BlueForms> createState() => _BlueFormsState();
}

class _BlueFormsState extends State<BlueForms> {

  int _currentIndex = 0;

  final List<BlueFormsPageFormController> _formController = [];
  final Map<String, dynamic> _savedInputs = {};

  Map<String, String> _badInputs = {};

  
  @override
  void initState()
  {
    super.initState();

    // TODO: check
    // if(widget.controller != null)
    // {
    //     widget.controller!.addListener(() {
    //     });
    // }
  }
  
  @override
  Widget build(BuildContext context)
  {
    List<Widget> pages = [];

    for (BlueFormsPageDefinition fiPage in widget.pages)
    {
      pages.add(_buildPage(context, fiPage));
    }

    return HideKeyboardOnTap(
      child: AppFlowPagedSteps(
        onCancel: widget.onCancel,
        activeColor: widget.processBarActiveColor,
        currentIndex: _currentIndex,
        actionBarSplitterEnabled: widget.buttonSplitterEnabled,
        customFinalNextButtonTitle: widget.customFinalButtonTitle,
        onBack: _onBack,
        onNext: _onNext,
        pages: pages, 
      ),
    );
  }

  void _onBack()
  {
    if (_currentIndex <= 0)
    {
      if (widget.onCancel != null)
      {
        widget.onCancel!();
      }

      return;
    }

    setState(() 
    {
      _currentIndex--;
    });
  }

  void _onNext()
  {
    BlueFormsPageDefinition page = widget.pages[_currentIndex];

    if (page.allowsToContinue())
    {
      _showNextPage();
      return;
    }
  }
  
  void _showNextPage()
  {
    if (_currentIndex >= widget.pages.length - 1)
    {
      // TODO: IMPROVEMENT copy all values to make the usage of this widget safer
      widget.onComplete(_savedInputs);

      return;
    }

    setState(() 
    {
      _currentIndex++;
    });
  }

  Widget _buildPage(BuildContext context, BlueFormsPageDefinition page)
  {
    if (page is BlueFormsPageInfoDefinition)
    {
      return BlueFormsPageInfo(definition: page);
    }

    if (page is BlueFormsPageFormDefinition)
    {
      if (page._controller == null)
      {
        BlueFormsPageFormController controller = BlueFormsPageFormController();

        _formController.add(controller);
        page._controller = controller;

      }

      return BlueFormsPageForm(
        controller: page._controller!,
        textFieldDecorationStyle: widget.textFieldDecorationStyle,
        definition: page,
        currentSavedValues: _savedInputs,
        badInputs: _badInputs,
        onSave: (id, value)
        {
          _savedInputs[id] = value;
        },
      );
    }

    throw Exception('BlueForms page type unsupported $page.');
  }

  // TODO: check
  // void _blueFormsControllerListener() {
  //     switch (widget.controller?.currentEvent) {
  //         case kBlueFormsControllerEvent.next:
  //             _onNext();
  //             break;
  //         case kBlueFormsControllerEvent.badInputs:
  //             setState(() {
  //                 _badInputs = widget.controller!.getBadInputMessages();
  //             });
  //             break;
  //     }
  // }

  @override
  void dispose()
  {
    for (BlueFormsPageFormController fiController in _formController)
    {
      fiController.dispose();
    }

    for (BlueFormsPageDefinition fiPage in widget.pages)
    {
      if (fiPage is BlueFormsPageFormDefinition)
      {
        fiPage._controller = null;
      }
    }

    super.dispose();
  }

}