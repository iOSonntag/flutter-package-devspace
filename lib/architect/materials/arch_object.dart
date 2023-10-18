


part of devspace;

abstract class ArchObject<O extends Object, T extends PlanData> {

  final T data;

  const ArchObject({
    required this.data
  });

  O build(BuildContext context);

}