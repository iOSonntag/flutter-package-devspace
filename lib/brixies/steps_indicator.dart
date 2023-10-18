
part of devspace;

class StepIndicator extends StatelessWidget {

  final int currentIndex;
  final int stepsCount;
  final Duration animationDuration;
  final Curve animationCurve;
  final Color? color;

  const StepIndicator({
    super.key,
    required this.currentIndex,
    required this.stepsCount,
    required this.animationDuration,
    this.animationCurve = Curves.easeInOut,
    this.color,
  });


  @override
  Widget build(BuildContext context)
  {
    final double totalSize = context.dimensions.barHeightXS;
    final double indicatorSize = totalSize - context.dimensions.spaceXSValue * 2;

    List<Widget> listSteps = [
      SizedBox(height: totalSize)
    ];

    for (int i = 0; i < stepsCount; i++)
    {
      listSteps.add(_buildStep(context, i, i == currentIndex, indicatorSize));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: listSteps,
    );
  }


  Widget _buildStep(BuildContext context, int index, bool active, double size)
  {
    Color col = active ? (color ?? context.colors.primary) : context.colors.onBackgroundLessFocus;

    if (!active)
    {
      size *= 0.666;
    }

    return AnimatedContainer(
      duration: animationDuration,
      curve: animationCurve,
      width: size,
      height: size,
      margin: context.paddingXS,
      decoration: BoxDecoration(
        color: col,
        borderRadius: BorderRadius.circular(100.0)
      ),
    );
  }

}