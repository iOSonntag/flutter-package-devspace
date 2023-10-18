




part of devspace;

abstract class DefaultVariantSwitch<V extends Enum, T extends PlanData> extends StatelessWidget {

  final V variant;
  final T data;
  final List<String> _unsupportedFields = [];

  DefaultVariantSwitch({
    super.key,
    required this.variant,
    required this.data
  })
  {
    _logUnsupportedFields(data);

    if (!hasMinimumRequirements(data))
    {
      throw Exception('The data provided for the architect is not valid for the default widget. Check for required fields.');
    }

    if (data.variationId != null)
    {
      throw Exception('the data field variationId can not be used in combination with a default plan. Did you forgot to add your plan into the widget tree?');
    }
  }

  @override
  @nonVirtual
  Widget build(BuildContext context)
  {
    return buildStyle(context, variant);
  }

  Widget buildStyle(BuildContext context, V style);

  bool hasMinimumRequirements(T data);

  void checkUnsupportedFields(T data);

  void _logUnsupportedFields(T data)
  {
    checkUnsupportedFields(data);
    
    if (_unsupportedFields.isEmpty)
    {
      return;
    }

    debugPrint('The following fields are not supported by the default widget:\n');

    for (var element in _unsupportedFields)
    {
      debugPrint('- $element');
    }

    debugPrint('\nIf you want to use these fields, you have to create your own widget.');
  }


  void unsupported(dynamic value, String name)
  {
    if (value != null)
    {
      _unsupportedFields.add(name);
    }
  }

  void unsupportedIf(bool condition, String name, String? message)
  {
    if (condition)
    {
      _unsupportedFields.add('$name ($message)');
    }
  }
  

}