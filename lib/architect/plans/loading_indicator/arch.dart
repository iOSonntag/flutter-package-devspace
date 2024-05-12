

part of devspace;

class ArchLoadingIndicator extends ArchBase<kLoadingIndicatorVariant, LoadingIndicatorData> {

  ArchLoadingIndicator({
    super.key,
    super.variant = kLoadingIndicatorVariant.regular,
    kSize3 size = kSize3.M,
    String? variationId,
  }) :
    super(
      data: LoadingIndicatorData(
        variationId: variationId,
        size: size,
      ),
    );


}