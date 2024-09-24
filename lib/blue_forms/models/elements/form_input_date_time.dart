
part of devspace;

// ignore: camel_case_types
enum kFormInputDateTimeType 
{
  date,
  // time,
  dateAndTime
}

class FormInputDateTime extends FormInput {

  final kFormInputDateTimeType type;

  /// Defaults to 1900
  final DateTime? firstDate;

  /// Defaults to 2100
  final DateTime? lastDate;
  /// If you want to display the date in a different format than the
  /// default, you can provide a function here.
  final String Function(DateTime? value)? toDisplayString;
  final String? hint;
  final void Function(DateTime? newValue)? onChange;

  const FormInputDateTime({
    required super.id,
    super.initialValue,
    super.description,
    super.label,
    super.isOptional,
    super.isActive,
    this.type = kFormInputDateTimeType.date,
    this.firstDate,
    this.lastDate,
    this.toDisplayString,
    this.hint,
    this.onChange,
  });

}