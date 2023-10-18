




part of devspace;

abstract class DefaultStatelessWidget<T extends PlanData> extends StatelessWidget {

  final T data;

  const DefaultStatelessWidget({
    super.key,
    required this.data
  });

}