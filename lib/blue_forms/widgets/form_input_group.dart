



part of devspace;


class _FormInputGroup extends StatelessWidget {

  final FormInputGroup definition;
  final bool isFirstElement;
  final bool isLastElement;
  final bool visuallyMarkRequired;
  final Map<String, dynamic> currentSavedValues;
  final Map<String, String> externalErrors;
  final void Function(String id, dynamic value) onSave;

  const _FormInputGroup({
    // ignore: unused_element
    super.key,
    required this.definition,
    required this.isFirstElement,
    required this.isLastElement,
    required this.visuallyMarkRequired,
    required this.currentSavedValues,
    required this.externalErrors,
    required this.onSave,
  });


  @override
  Widget build(BuildContext context)
  {
    List<Widget> groupChildren = [];
    List<Widget> rowChildren = [];
    int rowElementsCount = 0;

    for (int i = 0; i < definition.elements.length; i++)
    {
      FormInput fiInputDefinition = definition.elements[i];

      if (fiInputDefinition.isActive == false)
      {
        continue;
      }

      bool isFirst = i == 0 && isFirstElement;
      bool isLast = i == definition.elements.length - 1 && isLastElement;

      if (definition.elementsPerRow > 1)
      {
        rowChildren.add(
          Expanded(
            child: _FormElementWidget(
              definition: fiInputDefinition, 
              isFirstElement: isFirst, 
              isLastElement: isLast, 
              visuallyMarkRequired: visuallyMarkRequired,
              currentSavedValues: currentSavedValues, 
              externalErrors: externalErrors, 
              
              onSave: onSave
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
            for (int j = 0; j < mod; j++)
            {
              rowChildren.add(
                Expanded(
                  child: Container(),
                )
              );
            }
          }

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
          isFirstElement: isFirst, 
          isLastElement: isLast, 
          visuallyMarkRequired: visuallyMarkRequired,
          currentSavedValues: currentSavedValues, 
          externalErrors: externalErrors, 
          onSave: onSave
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