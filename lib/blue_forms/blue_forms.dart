


// IMPROVE: next and previous page doenst hide keyboard atm BUT the focus node is the last active textfield leading into wrong textfield to enter input!!!!!!


part of devspace;


class BlueForms extends StatefulWidget {

  final VoidCallback? onCancel;
  final OnCompleteForms onComplete;
  /// BlueForms assume it will be displayed on a surface, if it is displayed on
  /// a background, set this to true to adjust the colors accordingly.
  final bool onBackground;
  final bool isLoading;
  final String? errorMessage;
  final FormError? error;
  final Map<String, String> externalErrors;
  final bool actionBarSeparation;
  final List<FormPageBase> pages;
  final String? completeButtonTitle;
  final String? cancelButtonTitle;
  final bool intrinsicHeight;
  final bool visuallyMarkRequiredFields;
  final bool disableEnterToSubmit;
  final Widget? bottomContent;
  final Color? labelColor;
  final bool clipPagination;

  const BlueForms({
    super.key,
    this.onCancel,
    required this.onComplete,
    this.onBackground = false,
    this.isLoading = false,
    this.error,
    this.errorMessage,
    this.externalErrors = const {},
    this.actionBarSeparation = true,
    this.completeButtonTitle,
    this.cancelButtonTitle,
    this.intrinsicHeight = false,
    this.visuallyMarkRequiredFields = true,
    this.clipPagination = true,
    this.disableEnterToSubmit = false,
    this.bottomContent,
    this.labelColor,
    required this.pages,
  }) :
    assert(pages.length > 0),
    assert(errorMessage == null || error == null, 'You cannot use both errorMessage and error at the same time. errorMessage is just a shorthand for error. Use error if you need more customization.')
    ;

  @override
  State<BlueForms> createState() => _BlueFormsState();
}

class _BlueFormsState extends State<BlueForms> {

  int _currentIndex = 0;

  final List<FormPageController> _formController = [];
  final Map<String, dynamic> _savedInputs = {};


  @override
  Widget build(BuildContext context)
  {
    List<Widget> pages = [];

    for (FormPageBase fiPage in widget.pages)
    {
      pages.add(_buildPage(context, fiPage));
    }

    Widget child = AppFlowPagedSteps(
      clip: widget.clipPagination ? Clip.hardEdge : Clip.none,
      onCancel: widget.onCancel,
      cancelButtonTitle: widget.cancelButtonTitle,
      currentIndex: _currentIndex,
      actionBarSeparation: widget.actionBarSeparation,
      actionBarHeader: _buildErrorWidget(context),
      lastNextButtonTitle: widget.completeButtonTitle,
      intrinsicHeight: widget.intrinsicHeight,
      onBack: _onBack,
      onNext: _onNext,
      pages: pages, 
    );
    
    if (widget.bottomContent != null)
    {
      child = Column(
        children: [
          child,
          widget.bottomContent!,
        ],
      );
    }

    return HideKeyboardOnTap(
      child: LoadableView(
        isLoading: widget.isLoading,
        child: child,
      ),
    );
  }

  Widget? _buildErrorWidget(BuildContext context)
  {
    if (widget.errorMessage == null && widget.error == null)
    {
      return null;
    }

    if (widget.error != null)
    {
      return Padding(
        padding: context.paddingXL.setTop(0),
        child: ArchInfoBox.error(
          title: widget.error?.title,
          subtitle: widget.error?.subtitle,
          icon: widget.error?.icon,
          message: widget.error?.message,
        ),
      );
    }

    return Padding(
        padding: context.paddingXL.setTop(0),
      child: ArchInfoBox.error(
        message: widget.errorMessage,
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
      // IMPROVE: copy all values to make the usage of this widget safer
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
        FormPageController controller = FormPageController();

        _formController.add(controller);
        page._controller = controller;

      }

      return _FormPageWidget(
        controller: page._controller!,
        definition: page,
        onBackground: widget.onBackground,
        labelColor: widget.labelColor,
        visuallyMarkRequiredFields: widget.visuallyMarkRequiredFields,
        currentSavedValues: _savedInputs,
        externalErrors: widget.externalErrors,
        onValidationFailed: () => setState(() {}),
        onWidgetRequestedSubmit: ()
        {
          if (widget.disableEnterToSubmit)
          {
            return;
          }

          _onNext();
        },
        onSave: (id, value)
        {
          _savedInputs[id] = value;
        },
      );
    }

    throw Exception('BlueForms page type unsupported $page.');
  }

  @override
  void dispose()
  {
    for (FormPageController fiController in _formController)
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