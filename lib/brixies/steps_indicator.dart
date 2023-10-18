
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
    List<Widget> listSteps = [];

    for (int i = 0; i < stepsCount; i++)
    {
      listSteps.add(_buildStep(context, i, i == currentIndex));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: listSteps,
    );
  }


  Widget _buildStep(BuildContext context, int index, bool active)
  {
    Color col = active ? (color ?? context.colors.primary) : context.colors.onBackgroundLessFocus;

    double size = context.dimensions.barHeightS;

    if (!active)
    {
      size *= 0.666;
    }

    return AnimatedContainer(
      duration: animationDuration,
      curve: animationCurve,
      width: size,
      height: size,
      margin: context.paddingXS_0,
      decoration: BoxDecoration(
        color: col,
        borderRadius: BorderRadius.circular(100.0)
      ),
    );
  }

}