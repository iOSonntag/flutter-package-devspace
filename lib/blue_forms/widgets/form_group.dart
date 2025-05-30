



part of devspace;


class _FormGroup extends StatelessWidget {

  final FormGroup definition;
  final Color? labelColor;
  final bool onBackground;
  final bool isFirstElement;
  final bool isLastElement;
  final bool visuallyMarkRequired;
  final Map<String, dynamic> currentSavedValues;
  final Map<String, String> externalErrors;
  final void Function(String id, dynamic value) onSave;
  final VoidCallback onSubmitRequested;

  const _FormGroup({
    // ignore: unused_element
    super.key,
    required this.definition,
    this.labelColor,
    required this.onBackground,
    required this.isFirstElement,
    required this.isLastElement,
    required this.visuallyMarkRequired,
    required this.currentSavedValues,
    required this.externalErrors,
    required this.onSave,
    required this.onSubmitRequested
  });


  @override
  Widget build(BuildContext context)
  {
    List<Widget> groupChildren = [];
    List<Widget> rowChildren = [];
    int rowElementsCount = 0;

    for (int i = 0; i < definition.elements.length; i++)
    {
      FormElement fiInputDefinition = definition.elements[i];

      if (fiInputDefinition.isActive == false && definition.elementsPerRow == 1)
      {
        continue;
      }

      bool isFirst = i == 0 && isFirstElement;
      bool isLast = i == definition.elements.length - 1 && isLastElement;

      if (definition.elementsPerRow > 1)
      {
        rowChildren.add(
          Expanded(
            child: fiInputDefinition.isActive == false ? EmptyWidget() : _FormElementWidget(
              definition: fiInputDefinition, 
              labelColor: labelColor,
              onBackground: onBackground,
              isFirstElement: isFirst, 
              isLastElement: isLast, 
              visuallyMarkRequired: visuallyMarkRequired,
              currentSavedValues: currentSavedValues, 
              externalErrors: externalErrors, 
              onSave: onSave,
              onSubmitRequested: onSubmitRequested,
            ),
          )
        );
        rowElementsCount++;

        if (i % definition.elementsPerRow != definition.elementsPerRow - 1 && i != definition.elements.length - 1)
        {
          rowChildren.add(
            context.spaceL
          );
        }

        if (rowChildren.length == definition.elementsPerRow * 2 - 1 || i == definition.elements.length - 1)
        {
          int mod = rowElementsCount % definition.elementsPerRow;
          
          if (mod > 0)
          {
            for (int j = 0; j < definition.elementsPerRow - mod; j++)
            {
              rowChildren.add(
                Expanded(
                  child: Container(),
                )
              );
            }
          }

          // Note: normally this would be wrapped in an intrinsic height, but it
          // leads to problems if the async dependency is used in the form group
          groupChildren.add(
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: rowChildren,
            )
          );
          rowChildren = [];


          if (i != definition.elements.length - 1)
          {
            groupChildren.add(
              context.spaceXL
            );
          }

        }

        continue;
      }

      groupChildren.add(
        _FormElementWidget(
          definition: fiInputDefinition, 
          labelColor: labelColor,
          onBackground: onBackground,
          isFirstElement: isFirst, 
          isLastElement: isLast, 
          visuallyMarkRequired: visuallyMarkRequired,
          currentSavedValues: currentSavedValues, 
          externalErrors: externalErrors, 
          onSave: onSave,
          onSubmitRequested: onSubmitRequested,
        )
      );

      if (i != definition.elements.length - 1)
      {
        groupChildren.add(
          context.spaceXL
        );
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: groupChildren,
    );
  }

}