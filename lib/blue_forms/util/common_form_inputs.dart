

part of devspace;


abstract class CommonFormInputs {

  CommonFormInputs._();

  // TODO: maybe add server name
  /// Creates inputs with ids:
  /// - AddressStreet
  /// - AddressPostalCode
  /// - AddressCity
  /// - (AddressCountry)
  static FormInput address({
    required String idPrefix,
    String? description,
    bool isOptional = false,
    bool isActive = true,
    bool includeCountry = false,
    String? initialStreet,
    String? initialPostalCode,
    String? initialCity,
    String? initialCountry,
  })
  {
    assert(includeCountry || initialCountry == null, 'You provided a initial country, but the widget ignores the country. Set [includeCountry] to true.');

    if (includeCountry)
    {
      throw UnimplementedError('This feature has not been implemented yet.');
    }


    return FormInputGroup(
      isActive: isActive,
      inputs: [

        FormInputText(
          id: '${idPrefix}AddressStreet',
          description: description,
          autocorrect: false,
          isOptional: isOptional,
          initialValue: initialStreet,
          label: LibStrings.lib_blueFormsCommonInputs_address_streetLabel.tr(),
          hint: LibStrings.lib_blueFormsCommonInputs_address_streetHint.tr(),
          autofillHints: const [
              // TODO: check if ts the correct value
              AutofillHints.fullStreetAddress
          ],
          validationType: kFormTextValidationType.trimNotEmpty,
        ),

        FormInputText(
          id: '${idPrefix}AddressPostalCode',
          description: description,
          autocorrect: false,
          isOptional: isOptional,
          initialValue: initialPostalCode,
          label: LibStrings.lib_blueFormsCommonInputs_address_postalCodeLabel.tr(),
          hint: LibStrings.lib_blueFormsCommonInputs_address_postalCodeHint.tr(),
          autofillHints: const [
              AutofillHints.postalCode
          ],
          validationType: kFormTextValidationType.trimNotEmpty,
        ),

        FormInputText(
          id: '${idPrefix}AddressCity',
          description: description,
          autocorrect: false,
          isOptional: isOptional,
          initialValue: initialPostalCode,
          label: LibStrings.lib_blueFormsCommonInputs_address_cityLabel.tr(),
          hint: LibStrings.lib_blueFormsCommonInputs_address_cityHint.tr(),
          autofillHints: const [
              AutofillHints.addressCity
          ],
          validationType: kFormTextValidationType.trimNotEmpty,
        ),

      ],
    );
  }

}