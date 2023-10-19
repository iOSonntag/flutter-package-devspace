


// TODO: next and previous page doenst hide keyboard atm BUT the focus node is the last active textfield leading into wrong textfield to enter input!!!!!!


part of devspace;


class BlueForms extends StatefulWidget {

  final VoidCallback? onCancel;
  final OnCompleteForms onComplete;
  final Color? processBarActiveColor;
  final int textFieldDecorationStyle;
  final bool actionBarSeparation;
  final List<FormPageBase> pages;
  final BlueFormsController? controller;
  final String? customFinalButtonTitle;
  final bool intrinsicHeight;

  const BlueForms({
    super.key,
    this.onCancel,
    this.controller,
    required this.onComplete,
    this.processBarActiveColor,
    this.textFieldDecorationStyle = 0,
    this.actionBarSeparation = true,
    this.customFinalButtonTitle,
    this.intrinsicHeight = false,
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
    if(widget.controller != null)
    {
        widget.controller!.addListener(() {
        });
    }
  }
  
  @override
  Widget build(BuildContext context)
  {
    List<Widget> pages = [];

    for (FormPageBase fiPage in widget.pages)
    {
      pages.add(_buildPage(context, fiPage));
    }

    return HideKeyboardOnTap(
      child: AppFlowPagedSteps(
        onCancel: widget.onCancel,
        activeColor: widget.processBarActiveColor,
        currentIndex: _currentIndex,
        actionBarSeparation: widget.actionBarSeparation,
        customFinalNextButtonTitle: widget.customFinalButtonTitle,
        intrinsicHeight: widget.intrinsicHeight,
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
    FormPageBase page = widget.pages[_currentIndex];

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

  Widget _buildPage(BuildContext context, FormPageBase page)
  {
    if (page is FormPageInfo)
    {
      return _FormPageInfoWidget(definition: page);
    }

    if (page is FormPage)
    {
      if (page._controller == null)
      {
        BlueFormsPageFormController controller = BlueFormsPageFormController();

        _formController.add(controller);
        page._controller = controller;

      }

      return _FormPageWidget(
        controller: page._controller!,
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

    for (FormPageBase fiPage in widget.pages)
    {
      if (fiPage is FormPage)
      {
        fiPage._controller = null;
      }
    }

    super.dispose();
  }

}