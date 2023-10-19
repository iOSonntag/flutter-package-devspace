
part of devspace;

// ignore: camel_case_types
enum kLoadingIndicatorVariant
{
  regular,
}


class LoadingIndicatorData extends PlanData {

  final kSize3 size;

  const LoadingIndicatorData({
    super.variationId,
    this.size = kSize3.M,
  });

}