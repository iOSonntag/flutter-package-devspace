

part of devspace;

abstract class DependencyResolver {

  DependencyResolver._();


  static List<List<Glue<GlueComponent>>> resolve(List<Glue<GlueComponent>> glues)
  {
    List<List<Glue<GlueComponent>>> dependenciesList = [];

    while (true)
    {
      dependenciesList.add([]);

      bool noGlueResolved = true;

      List<Glue<GlueComponent>> remainingGlues = [];

      for (Glue<GlueComponent> fiGlue in glues)
      {
        if (fiGlue.dependsOn.isEmpty || _isAlreadyAvailable(dependenciesList, fiGlue.dependsOn))
        {
          noGlueResolved = false;
          dependenciesList.last.add(fiGlue);
        }
        else
        {
          remainingGlues.add(fiGlue);
        }
      }

      if (noGlueResolved)
      {
        throw Exception('Dependencies cannot be resolved. Circular dependencies detected.');
      }

      if (remainingGlues.isEmpty)
      {
        break;
      }

      glues = remainingGlues;
    }

    return dependenciesList;
  }

  static bool _isAlreadyAvailable(List<List<Glue<GlueComponent>>> dependenciesList, List<Type> dependsOn)
  {
    List<Type> remainingTypes = List.from(dependsOn);
    List<Type> currentRemainingTypes = List.from(dependsOn);

    for (int i = 0; i < dependenciesList.length - 1; i++)
    {
      List<Glue<GlueComponent>> fiGluesList = dependenciesList[i];

      for (Glue<GlueComponent> fiGlue in fiGluesList)
      {
        for (Type fiType in remainingTypes)
        {
          if (fiType == fiGlue.type)
          {
            currentRemainingTypes.remove(fiType);

            if (currentRemainingTypes.isEmpty)
            {
              return true;
            }
          }
        }

        remainingTypes = List.from(currentRemainingTypes);
      }
    }

    if (currentRemainingTypes.isEmpty)
    {
      return true;
    }

    return false;
  }

}