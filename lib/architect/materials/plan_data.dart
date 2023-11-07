



part of devspace;

// ignore: camel_case_types
enum kNoVariants
{
  regular
}



abstract class PlanData {

  final String? variationId;

  const PlanData({
    required this.variationId,
  });

}

abstract class PlanDataWithChild extends PlanData {

  final Widget? child;

  const PlanDataWithChild({
    required super.variationId,
    required this.child,
  });

}

typedef ChildOption<T> = T;

typedef PlanBuilderChildless<R, V extends Enum, T extends PlanData> = R Function(BuildContext, V variant, T data);
typedef PlanBuilderChildful<R, V extends Enum, T extends PlanData, C> = R Function(BuildContext, V variant, T data, ChildOption<C> child);

class WidgetPlan {


}

class WidgetPlanChildless<V extends Enum, T extends PlanData> extends WidgetPlan {

  final PlanBuilderChildless<Widget, V, T> builder;

  WidgetPlanChildless({
    required this.builder,
  });

}

class WidgetPlanChildful<V extends Enum, T extends PlanData, C> extends WidgetPlan {

  final PlanBuilderChildful<Widget, V, T, C> builder;

  WidgetPlanChildful({
    required this.builder,
  });

}


class ObjectPlan<R extends Object, V extends Enum, T extends PlanData> {

  final PlanBuilderChildless<R, V, T> builder;

  ObjectPlan({
    required this.builder,
  });

}