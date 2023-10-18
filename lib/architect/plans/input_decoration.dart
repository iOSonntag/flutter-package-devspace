


part of devspace;

// ignore: camel_case_types
enum kInputDecorationType
{
  regular,
}

class InputDecorationData extends PlanData {

  final kInputDecorationType type;
  final kSize3 size;
  final bool enabled;
  final String? label;
  final String? hint;
  final String? error;

  InputDecorationData({
    super.variationId,
    this.size = kSize3.M,
    this.type = kInputDecorationType.regular,
    this.enabled = true,
    this.label,
    this.hint,
    this.error,
  });



}