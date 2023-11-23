

part of devspace;

class StepsBar extends StatelessWidget {

  final int stepsCount;
  final int currentIndex;
  final bool showProgressIndicator;
  final bool specialFinalNextButton;
  final Color? activeColor;
  final VoidCallback? onCancel;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final String? customCancelButtonTitle;
  final String? customBackButtonTitle;
  final String? customNextButtonTitle;
  final String? customFinalNextButtonTitle;
  final Duration? animationDuration;

  const StepsBar({
    super.key,
    required this.stepsCount,
    required this.currentIndex,
    this.showProgressIndicator = true,
    this.specialFinalNextButton = true,
    this.activeColor,
    this.onCancel,
    required this.onBack,
    required this.onNext,
    this.customCancelButtonTitle,
    this.customBackButtonTitle,
    this.customNextButtonTitle,
    this.customFinalNextButtonTitle,
    this.animationDuration,
  });

  String _finalNextButtonTitle()
  {
    if (customFinalNextButtonTitle != null)
    {
      return customFinalNextButtonTitle!;
    }

    if (specialFinalNextButton)
    {
      return LibStrings.lib_general_actionComplete.tr();
    }

    return _nextButtonTitle();
  }

  String _nextButtonTitle()
  {
    return customNextButtonTitle ?? LibStrings.lib_general_actionNext.tr();
  }

  String _backButtonTitle()
  {
    if (currentIndex == 0)
    {
      if (onCancel == null)
      {
          return '';
      }

      return customCancelButtonTitle ?? LibStrings.lib_general_actionCancel.tr();
    }

    return customBackButtonTitle ?? LibStrings.lib_general_actionBack.tr();
  }

  bool _finalNextButtonDiffersInAnyWay()
  {
    if (specialFinalNextButton)
    {
      return true;
    }

    if (_nextButtonTitle() != _finalNextButtonTitle())
    {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context)
  {
    List<Widget> rowChildren = [
      _buildBackButton(context),
    ];

    if (_finalNextButtonDiffersInAnyWay())
    {
      rowChildren.add(
        SmoothSwap<bool>(
          value: currentIndex == stepsCount - 1, 
          builder: (context, isFinalButton)
          {
            if (!isFinalButton || !specialFinalNextButton)
            {
              String title = isFinalButton ? _finalNextButtonTitle() : _nextButtonTitle();

              return ArchButton.soft(
                title: title,
                onPressed: onNext,
              );
            }

            return ArchButton(
              title: _finalNextButtonTitle(),
              onPressed: onNext,
            );
          },
        ),
      );
    }

    List<Widget> stackChildren = [

      Opacity(
        opacity: 0.0,
        child: ArchButton(
          title: _finalNextButtonTitle(),
          onPressed: () {},
        ),
      ),

    ];


    if (showProgressIndicator)
    {
      stackChildren.add(
        StepIndicator(
          animationDuration: animationDuration ?? context.animations.durationPageSlide,
          currentIndex: currentIndex,
          stepsCount: stepsCount,
          color: activeColor,
        ),
      );
    }

    stackChildren.add(
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rowChildren,
        ),
      ),
    );



    return Stack(
      alignment: Alignment.center,
      children: stackChildren,
    );
  }


  Widget _buildBackButton(BuildContext context)
  {
    return SmoothSwap<String>(
      value: _backButtonTitle(), 
      duration: animationDuration ?? context.animations.durationPageSlide,
      builder: (context, title)
      {
        if (title.isEmpty)
        {
          return EmptyWidget();
        }

        return ArchButton.soft(
          title: title, 
          type: kButtonType.lowFocus,
          onPressed: ()
          {
            if (currentIndex == 0)
            {
              if (onCancel == null)
              {
                return;
              }

              onCancel!();
              return;
            }

            onBack();
          },
        );
      },
    );
  }
}