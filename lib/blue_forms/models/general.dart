

part of devspace;

// ignore: camel_case_types
enum kFormTextValidationType
{
    none,
    trimNotEmpty,
    notEmpty,
    phoneNumber,
    custom
}

typedef OnInputChange = void Function(dynamic newValue);
typedef OnCompleteForms = void Function(Map<String, dynamic> formValues);