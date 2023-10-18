

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
      return LibStrings.lib_general_complete.tr();
    }

    return _nextButtonTitle();
  }

  String _nextButtonTitle()
  {
    return customNextButtonTitle ?? LibStrings.lib_general_next.tr();
  }

  String _backButtonTitle()
  {
    if (currentIndex == 0)
    {
      if (onCancel == null)
      {
          return '';
      }

      return customCancelButtonTitle ?? LibStrings.lib_general_cancel.tr();
    }

    return customBackButtonTitle ?? LibStrings.lib_general_back.tr();
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
      SmoothSwap<String>(
        value: _backButtonTitle(), 
        builder: (context, title)
        {
          return ArchButton.soft(ButtonData.simpleText(
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
          ));
        },
      ),
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

              return ArchButton.soft(ButtonData.simpleText(
                title: title,
                onPressed: onNext,
              ));
            }

            return ArchButton(ButtonData.simpleText(
              title: _finalNextButtonTitle(),
              onPressed: onNext,
            ));
          },
        ),
      );
    }

    List<Widget> stackChildren = [

      Opacity(
        opacity: 0.0,
        child: ArchButton(ButtonData.simpleText(
          title: _finalNextButtonTitle(),
          onPressed: () {},
        )),
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



    return Container(
      padding: context.paddingM_S,
      child: Stack(
        alignment: Alignment.center,
        children: stackChildren,
      ),
    );
  }
}