




part of devspace;

abstract class ArchBaseStatelessWidget<T extends PlanData> extends StatelessWidget {

  final T data;
  final List<String> _unsupportedFields = [];
  final bool allowCustomVariants;

  ArchBaseStatelessWidget({
    super.key,
    required this.data,
    this.allowCustomVariants = true,
  })
  {
    _logUnsupportedFields();

    if (!hasMinimumRequirements())
    {
      throw Exception('The data provided for the architect is not valid for the widget. Check for required fields.');
    }

    if (!allowCustomVariants && data.variationId != null)
    {
      throw Exception('the data field variationId can not be used in combination with a default plan. Did you forgot to add your plan into the widget tree?');
    }
  }


  bool hasMinimumRequirements();

  void checkUnsupportedFields();

  void _logUnsupportedFields()
  {
    checkUnsupportedFields();
    
    if (_unsupportedFields.isEmpty)
    {
      return;
    }

    debugPrint('The following fields are not supported by the widget:\n');

    for (var element in _unsupportedFields)
    {
      debugPrint('- $element');
    }

    debugPrint('\nIf you want to use these fields, you have to create create your own widget or and make sure it is not marked as unsupported.');
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