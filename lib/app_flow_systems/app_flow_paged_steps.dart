
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
  final String? cancelButtonTitle;
  final String? backButtonTitle;
  final String? nextButtonTitle;
  final String? lastNextButtonTitle;
  final Duration? animationDuration;
  final bool actionBarSeparation;
  final Widget? actionBarHeader;
  final Clip clip;
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
    this.cancelButtonTitle,
    this.backButtonTitle,
    this.nextButtonTitle,
    this.lastNextButtonTitle,
    this.animationDuration,
    this.actionBarSeparation = false,
    this.actionBarHeader,
    this.clip = Clip.none,
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

    if (widget.actionBarHeader != null)
    {
      children.add(
        widget.actionBarHeader!,
      );
    }

    children.add(
      Padding(
        padding: context.paddingXL.excludeTop(condition: !widget.actionBarSeparation || widget.actionBarHeader != null),
        child: StepsBar(
          stepsCount: widget.pages.length, 
          currentIndex: _currentIndex, 
          showProgressIndicator: widget.pages.length > 1 && widget.showProgressIndicator,
          specialFinalNextButton: widget.specialFinalNextButton,
          activeColor: widget.activeColor,
          onCancel: widget.onCancel,
          onBack: widget.onBack, 
          onNext: widget.onNext,
          customCancelButtonTitle: widget.cancelButtonTitle,
          customBackButtonTitle: widget.backButtonTitle,
          customNextButtonTitle: widget.nextButtonTitle,
          customFinalNextButtonTitle: widget.lastNextButtonTitle,
        ),
      ),
    );

    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );

    if (widget.clip != Clip.none)
    {
      child = ClipRect(
        clipBehavior: widget.clip,
        child: child,
      );
    }
    
    return child;
  }

  @override
  void dispose()
  {
    _controller?.dispose();
    _controller = null;

    super.dispose();
  }
}