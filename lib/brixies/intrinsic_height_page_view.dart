

part of devspace;


class IntrinsicHeightPageView extends StatefulWidget {

  final PageController? controller;
  final ScrollPhysics? physics;
  final List<Widget> children;

  const IntrinsicHeightPageView({
    super.key,
    this.controller,
    this.physics,
    required this.children,
  });

  @override
  State<IntrinsicHeightPageView> createState() => _IntrinsicHeightPageViewState();
}

class _IntrinsicHeightPageViewState extends State<IntrinsicHeightPageView> with TickerProviderStateMixin {

  late PageController _pageController;
  late List<double> _heights;
  int _currentPage = 0;

  double get _currentHeight => _heights[_currentPage];

  @override
  void initState()
  {
    _heights = widget.children.map((e) => 0.0).toList();
    _pageController = widget.controller ?? PageController();

    _pageController.addListener(()
    {
      final newPage = _pageController.page?.round() ?? 0;

      if (_currentPage != newPage)
      {
        setState(() => _currentPage = newPage);
      }
    });

    super.initState();
  }

  @override
  void dispose()
  {
    if (widget.controller != _pageController)
    {
      _pageController.dispose();
    }
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: _currentHeight, 
      child: PageView(
        controller: _pageController,
        physics: widget.physics,
        clipBehavior: Clip.none,
        children: _buildChildren(context),
      ),
    );

    return TweenAnimationBuilder<double>(
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 100),
      tween: Tween<double>(begin: _heights[0], end: _currentHeight),
      builder: (context, value, child)
      {
        return SizedBox(
          height: _currentHeight, 
          child: PageView(
            controller: _pageController,
            physics: widget.physics,
            children: _buildChildren(context),
          ),
        );
      },
      // child: PageView(
      //   controller: _pageController,
      //   physics: widget.physics,
      //   children: _sizeReportingChildren
      //     .asMap()
      //     .map((index, child) => MapEntry(index, child))
      //     .values
      //     .toList(),
      // ),
    );
  }

  void _onSizeChanged(int index, Size size)
  {
    safePrint('size: $size');
    setState(() => _heights[index] = size.height);
  }

  List<Widget> _buildChildren(BuildContext context)
  {
    List<Widget> children = [];

    for (int i = 0; i < widget.children.length; i++)
    {
      // children.add(
      //   Column(
      //     children: [
            // MeasureSize(
            //   onChange: (size) => _onSizeChanged(i, size),
            //   child: widget.children[i],
            // ),
      //     ],
      //   ),
      // );

      children.add(
        OverflowBox(
          // needed, so that parent will not impose its constraints on the children,
          // thus skewing the measurement results.
          minHeight: 0,
          maxHeight: double.infinity,
          alignment: Alignment.topCenter,
          child: MeasureSize(
            onChange: (size) => _onSizeChanged(i, size),
            child: widget.children[i]
          ),
        ),
      );
    }

    return children;
  }

}