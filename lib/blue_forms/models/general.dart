

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

class FormError
{
    final IconData? icon;
    final String? title;
    final String? subtitle;
    final String message;

    const FormError({
        this.icon,
        this.title,
        this.subtitle,
        required this.message,
    });
}