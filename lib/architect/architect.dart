

part of devspace;

abstract class Arch {

  static ArchitectPlans of(BuildContext context)
  {
    return Architect.of(context);
  }
}

class Architect extends StatelessWidget {
  
  const Architect({
    super.key,
    required this.plans,
    required this.child,
  });

  final ArchitectPlans plans;
  final Widget child;

  static final ArchitectPlans _kFallbackPlans = ArchitectPlans.fallback();

  static ArchitectPlans of(BuildContext context)
  {
    final _InheritedArchitect? inheritedArchitect = context.dependOnInheritedWidgetOfExactType<_InheritedArchitect>();

    // final MaterialLocalizations? localizations = Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
    // final ScriptCategory category = localizations?.scriptCategory ?? ScriptCategory.englishLike;

    final ArchitectPlans plans = inheritedArchitect?.architect.plans ?? _kFallbackPlans;

    return plans;
  }

  @override
  Widget build(BuildContext context)
  {
    return _InheritedArchitect(
      architect: this,
      child: child,
    );
  }

}

class _InheritedArchitect extends InheritedWidget {
  const _InheritedArchitect({
    required this.architect,
    required super.child,
  });

  final Architect architect;

  Widget wrap(BuildContext context, Widget child)
  {
    return Architect(plans: architect.plans, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedArchitect old) => architect.plans != old.architect.plans;
}
