



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

typedef PlanBuilder<R, V extends Enum, T extends PlanData> = R Function(BuildContext, V variant, T data);

class WidgetPlan<V extends Enum, T extends PlanData> {

  final PlanBuilder<Widget, V, T> builder;

  WidgetPlan({
    required this.builder,
  });

}

class ObjectPlan<R extends Object, V extends Enum, T extends PlanData> {

  final PlanBuilder<R, V, T> builder;

  ObjectPlan({
    required this.builder,
  });

}