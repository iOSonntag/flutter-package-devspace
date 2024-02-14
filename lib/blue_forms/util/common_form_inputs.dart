

part of devspace;


abstract class CommonFormInputs {

  CommonFormInputs._();


  static FormInput emailPassword({
    String idPrefix = '',
    String? description,
    bool isOptional = false,
    bool isActive = true,
    String? initialEmail,
    String? initialPassword,
  })
  {
    return FormInputGroup(
      isActive: isActive,
      elements: [

        FormInputText(
          id: '${idPrefix}email',
          description: description,
          initialValue: initialEmail,
          label: LibStrings.lib_blueForms_commonInputs_emailLabel.tr(),
          hint: LibStrings.lib_blueForms_commonInputs_emailHint.tr(),
          autocorrect: false,
          isOptional: isOptional,
          autofillHints: [
            AutofillHints.email,
          ],
          validationType: kFormTextValidationType.trimNotEmpty,
        ),

        FormInputText(
          id: '${idPrefix}password',
          initialValue: initialPassword,
          label: LibStrings.lib_blueForms_commonInputs_passwordLabel.tr(),
          hint: LibStrings.lib_blueForms_commonInputs_passwordHint.tr(),
          autocorrect: false,
          isOptional: isOptional,
          autofillHints: [AutofillHints.password],
          obscureText: true,
          enableSuggestions: false,
          validationType: kFormTextValidationType.notEmpty,
        ),
      ],
    );
  }


  static FormInput email({
    String idPrefix = '',
    String? description,
    bool isOptional = false,
    bool isActive = true,
    String? initialEmail,
  })
  {
    return FormInputText(
      isActive: isActive,
      id: '${idPrefix}email',
      description: description,
      initialValue: initialEmail,
      label: LibStrings.lib_blueForms_commonInputs_emailLabel.tr(),
      hint: LibStrings.lib_blueForms_commonInputs_emailHint.tr(),
      autocorrect: false,
      isOptional: isOptional,
      autofillHints: [
        AutofillHints.email,
      ],
      validationType: kFormTextValidationType.trimNotEmpty,
    );
  }

  static FormInput phoneNumber({
    String idPrefix = '',
    String? description,
    bool isOptional = false,
    bool isActive = true,
    String? initialPhoneNumber,
  })
  {
    return FormInputText(
      isActive: isActive,
      id: '${idPrefix}phoneNumber',
      description: description,
      initialValue: initialPhoneNumber,
      label: LibStrings.lib_blueForms_commonInputs_phoneNumberLabel.tr(),
      hint: LibStrings.lib_blueForms_commonInputs_phoneNumberHint.tr(),
      autocorrect: false,
      isOptional: isOptional,
      autofillHints: [
        AutofillHints.telephoneNumber,
      ],
      validationType: kFormTextValidationType.trimNotEmpty,
    );
  }


  static FormInput fullName({
    String idPrefix = '',
    String? description,
    bool isOptional = false,
    bool isActive = true,
    String? initialGivenName,
    String? initialFamilyName,
    int elementsPerRow = 2,
  })
  {
    return FormInputGroup(
      isActive: isActive,
      elementsPerRow: elementsPerRow,
      elements: [

        FormInputText(
          id: '${idPrefix}givenName',
          description: description,
          initialValue: initialGivenName,
          label: LibStrings.lib_blueForms_commonInputs_givenNameLabel.tr(),
          hint: LibStrings.lib_blueForms_commonInputs_givenNameHint.tr(),
          autocorrect: false,
          isOptional: isOptional,
          autofillHints: [
            AutofillHints.givenName,
          ],
          validationType: kFormTextValidationType.trimNotEmpty,
        ),


        FormInputText(
          id: '${idPrefix}familyName',
          description: description,
          initialValue: initialFamilyName,
          label: LibStrings.lib_blueForms_commonInputs_familyNameLabel.tr(),
          hint: LibStrings.lib_blueForms_commonInputs_familyNameHint.tr(),
          autocorrect: false,
          isOptional: isOptional,
          autofillHints: [
            AutofillHints.familyName,
          ],
          validationType: kFormTextValidationType.trimNotEmpty,
        ),

      ],
    );
  }








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
      elements: [

        FormInputText(
          id: '${idPrefix}AddressStreet',
          description: description,
          autocorrect: false,
          isOptional: isOptional,
          initialValue: initialStreet,
          label: LibStrings.lib_blueForms_commonInputs_address_streetLabel.tr(),
          hint: LibStrings.lib_blueForms_commonInputs_address_streetHint.tr(),
          autofillHints: const [
              // TODO: check if ts the correct value
              AutofillHints.fullStreetAddress
          ],
          validationType: kFormTextValidationType.trimNotEmpty,
        ),

        FormInputText(
          id: '${idPrefix}AddressPostalCode',
          autocorrect: false,
          isOptional: isOptional,
          initialValue: initialPostalCode,
          label: LibStrings.lib_blueForms_commonInputs_address_postalCodeLabel.tr(),
          hint: LibStrings.lib_blueForms_commonInputs_address_postalCodeHint.tr(),
          autofillHints: const [
              AutofillHints.postalCode
          ],
          validationType: kFormTextValidationType.trimNotEmpty,
        ),

        FormInputText(
          id: '${idPrefix}AddressCity',
          autocorrect: false,
          isOptional: isOptional,
          initialValue: initialPostalCode,
          label: LibStrings.lib_blueForms_commonInputs_address_cityLabel.tr(),
          hint: LibStrings.lib_blueForms_commonInputs_address_cityHint.tr(),
          autofillHints: const [
              AutofillHints.addressCity
          ],
          validationType: kFormTextValidationType.trimNotEmpty,
        ),

      ],
    );
  }

}