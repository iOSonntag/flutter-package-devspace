


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
    WidgetPlanChildless<V, T> plan = Arch.of(context).planForWidget<T>() as WidgetPlanChildless<V, T>;

    return plan.builder(context, variant, data);
  }
}

class ArchBaseWithChildren<V extends Enum, T extends PlanData> extends StatelessWidget {

  final V variant;
  final T data;
  final List<Widget> children;

  const ArchBaseWithChildren({
    super.key,
    required this.data,
    required this.variant,
    required this.children,
  });

  @override
  Widget build(BuildContext context)
  {
    WidgetPlanChildful<V, T, List<Widget>> plan = Arch.of(context).planForWidget<T>() as WidgetPlanChildful<V, T, List<Widget>>;

    return plan.builder(context, variant, data, children);
  }
}

class ArchBaseWithChild<V extends Enum, T extends PlanData> extends StatelessWidget {

  final V variant;
  final T data;
  final Widget child;

  const ArchBaseWithChild({
    super.key,
    required this.data,
    required this.variant,
    required this.child,
  });

  @override
  Widget build(BuildContext context)
  {
    WidgetPlanChildful<V, T, Widget> plan = Arch.of(context).planForWidget<T>() as WidgetPlanChildful<V, T, Widget>;

    return plan.builder(context, variant, data, child);
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