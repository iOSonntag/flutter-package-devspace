

part of devspace;

Map<Type, WidgetPlan> _defaultWidgetPlans = <Type, WidgetPlan>{

  ButtonData: WidgetPlanChildless<kButtonVariant, ButtonData>(builder: DefaultButton.builder),
  CardData: WidgetPlanChildful<kCardVariant, CardData, Widget>(builder: DefaultCard.builder),
  InfoBoxData: WidgetPlanChildless<kInfoBoxVariant, InfoBoxData>(builder: DefaultInfoBox.builder),
  LoadingIndicatorData: WidgetPlanChildless<kLoadingIndicatorVariant, LoadingIndicatorData>(builder: DefaultLoadingIndicator.builder),
  TextFieldData: WidgetPlanChildless<kTextFieldVariant, TextFieldData>(builder: DefaultTextField.builder),

};


Map<Type, ObjectPlan> _defaultObjectPlans = <Type, ObjectPlan>{

  InputDecorationData: ObjectPlan<InputDecoration, kNoVariants, InputDecorationData>(builder: DefaultInputDecoration.builder),
  
};

class ArchitectPlans {

  static ArchitectPlans fallback()
  {
    return const ArchitectPlans();
  }

  final Map<Type, WidgetPlanChildless> _widgets;
  final Map<Type, ObjectPlan> _objects;

  const ArchitectPlans({
    Map<Type, WidgetPlanChildless>? widgets,
    Map<Type, ObjectPlan>? objects,
  }) : 
    _widgets = widgets ?? const {},
    _objects = objects ?? const {};

  WidgetPlan planForWidget<T extends PlanData>()
  {
    final WidgetPlan? plan = _widgets[T] ?? _defaultWidgetPlans[T];

    if (plan == null)
    {
      throw Exception('No plan found for type $T. Are You accessing a custom type and have forgotten to add it to the architect?');
    }

    return plan;
  }

  ObjectPlan planForObject<T extends PlanData>()
  {
    final ObjectPlan? plan = _objects[T] ?? _defaultObjectPlans[T];

    if (plan == null)
    {
      throw Exception('No plan found for type $T. Are You accessing a custom type and have forgotten to add it to the architect?');
    }

    return plan;
  }











  @override
  bool operator ==(Object other)
  {
    if (other.runtimeType != runtimeType)
    {
      return false;
    }
    return other is ArchitectPlans && false;
  }

  @override
  int get hashCode
  {
    final List<Object?> values = <Object?>[
    ];

    return Object.hashAll(values);
  }

}