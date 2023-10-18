
part of devspace;

class AppFlowPagedSteps extends StatefulWidget {

  final int currentIndex;
  final bool showProgressIndicator;
  final bool specialFinalNextButton;
  final bool intrinsicHeight;
  final Color? activeColor;
  final VoidCallback? onCancel;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final String? customCancelButtonTitle;
  final String? customBackButtonTitle;
  final String? customNextButtonTitle;
  final String? customFinalNextButtonTitle;
  final Duration? animationDuration;
  final bool actionBarSeparation;
  final List<Widget> pages;

  const AppFlowPagedSteps({
    super.key,
    required this.currentIndex,
    this.showProgressIndicator = true,
    this.specialFinalNextButton = true,
    this.intrinsicHeight = false,
    this.activeColor,
    this.onCancel,
    required this.onBack,
    required this.onNext,
    this.customCancelButtonTitle,
    this.customBackButtonTitle,
    this.customNextButtonTitle,
    this.customFinalNextButtonTitle,
    this.animationDuration,
    this.actionBarSeparation = false,
    required this.pages,
  }) :
    assert(pages.length > 0);

  @override
  State<AppFlowPagedSteps> createState() => _AppFlowPagedStepsState();
}

class _AppFlowPagedStepsState extends State<AppFlowPagedSteps> {

  PageController? _controller;
  int _currentIndex = 0;

  @override
  void initState()
  {
    super.initState();

    _currentIndex = _cleanedIndex();
    _controller = PageController(initialPage: _currentIndex);
  }

  int _cleanedIndex()
  {
    if (widget.currentIndex < 0)
    {
      return 0;
    }

    if (widget.currentIndex >= widget.pages.length)
    {
      return widget.pages.length - 1;
    }

    return widget.currentIndex;
  }

  @override
  Widget build(BuildContext context)
  {
    int index = _cleanedIndex();

    if (index != _currentIndex)
    {
      _currentIndex = index;

      WidgetsBinding.instance.addPostFrameCallback((timeStamp)
      { 
        if (_controller != null)
        {
          _controller!.animateToPage(index,
            duration: widget.animationDuration ?? context.animations.durationPageSlide,
            curve: context.animations.curvePageSlide
          );
        }
      });
    }

    List<Widget> children = [];

    if (widget.intrinsicHeight)
    {
      children.add(
        IntrinsicHeightPageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: widget.pages,
        ),
      );
    }
    else
    {
      children.add(
        Expanded(
          child: PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.pages,
          ),
        ),
      );
    }

    if (widget.actionBarSeparation)
    {
      children.add(
        EdgeShadow(
          top: true,
          bottom: true,
          shadows: [
            context.highlights.boxShadowXL,
          ],
          child: LineDivider(
            // thickness: 1.0,
            color: context.colors.onBackgroundLeastFocus,
            fade: true,
          ),
        ),
      );
    }

    children.add(
      Padding(
        padding: context.paddingL.excludeTop(condition: !widget.actionBarSeparation),
        child: StepsBar(
          stepsCount: widget.pages.length, 
          currentIndex: _currentIndex, 
          showProgressIndicator: widget.pages.length > 1 && widget.showProgressIndicator,
          specialFinalNextButton: widget.specialFinalNextButton,
          activeColor: widget.activeColor,
          onCancel: widget.onCancel,
          onBack: widget.onBack, 
          onNext: widget.onNext,
          customCancelButtonTitle: widget.customCancelButtonTitle,
          customBackButtonTitle: widget.customBackButtonTitle,
          customNextButtonTitle: widget.customNextButtonTitle,
          customFinalNextButtonTitle: widget.customFinalNextButtonTitle,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  @override
  void dispose()
  {
    _controller?.dispose();
    _controller = null;

    super.dispose();
  }
}