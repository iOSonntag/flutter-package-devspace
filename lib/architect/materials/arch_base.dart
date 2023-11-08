


part of devspace;


class ArchBase<V extends Enum, T extends PlanData> extends StatelessWidget {

  final V variant;
  final T data;

  const ArchBase({
    super.key,
    required this.data,
    required this.variant,
  });

  @override
  Widget build(BuildContext context)
  {
    WidgetPlan<V, T> plan = Arch.of(context).planForWidget<T>() as WidgetPlan<V, T>;

    return plan.builder(context, variant, data);
  }
}


class ArchObjectBase<R extends Object, V extends Enum, T extends PlanData> {

  final V variant;
  final T data;

  const ArchObjectBase({
    required this.data,
    required this.variant,
  });

  R build(BuildContext context)
  {
    ObjectPlan<R, V, T> plan = Arch.of(context).planForObject<T>() as ObjectPlan<R, V, T>;

    return plan.builder(context, variant, data);
  }
}