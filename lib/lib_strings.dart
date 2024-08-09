


// ignore_for_file: constant_identifier_names

// TODO: check if every string is set for every language during dev builds

abstract class LibStrings {

  LibStrings._();

  static const String lib_general_valueNotSet = 'lib_general_valueNotSet';
  static const String lib_general_valueNotYetSet = 'lib_general_valueNotYetSet';
  static const String lib_general_valueNotAvailable = 'lib_general_valueNotAvailable';
  static const String lib_general_actionNext = 'lib_general_actionNext';
  static const String lib_general_actionBack = 'lib_general_actionBack';
  static const String lib_general_actionComplete = 'lib_general_actionComplete';
  static const String lib_general_actionCancel = 'lib_general_actionCancel';
  static const String lib_general_actionSave = 'lib_general_actionSave';
  static const String lib_general_actionRetry = 'lib_general_actionRetry';
  static const String lib_general_actionConfirm = 'lib_general_actionConfirm';
  static const String lib_general_actionDismiss = 'lib_general_actionDismiss';
  static const String lib_general_actionClose = 'lib_general_actionClose';
  static const String lib_general_actionOkay = 'lib_general_actionOkay';
  static const String lib_general_actionYes = 'lib_general_actionYes';
  static const String lib_general_actionNo = 'lib_general_actionNo';
  static const String lib_general_actionSend = 'lib_general_actionSend';
  static const String lib_general_actionDelete = 'lib_general_actionDelete';
  static const String lib_general_actionEdit = 'lib_general_actionEdit';
  static const String lib_general_actionAdd = 'lib_general_actionAdd';
  static const String lib_general_actionSubmit = 'lib_general_actionSubmit';
  static const String lib_general_actionRemove = 'lib_general_actionRemove';
  static const String lib_general_actionSelect = 'lib_general_actionSelect';
  static const String lib_general_actionChoose = 'lib_general_actionChoose';
  static const String lib_general_actionDeviceSettings = 'lib_general_actionDeviceSettings';

  static const String lib_general_titleError = 'lib_general_titleError';
  static const String lib_general_titleInfo = 'lib_general_titleInfo';
  static const String lib_general_titleWarning = 'lib_general_titleWarning';
  static const String lib_general_titleSuccess = 'lib_general_titleSuccess';
  static const String lib_general_titleConfirm = 'lib_general_titleConfirm';
  static const String lib_general_titleCongratulation = 'lib_general_titleCongratulation';


  static const String lib_commonDialogs_permissionDeniedCamera_title = 'lib_commonDialogs_permissionDeniedCamera_title';
  static const String lib_commonDialogs_permissionDeniedCamera_message = 'lib_commonDialogs_permissionDeniedCamera_message';
  static const String lib_commonDialogs_permissionDeniedGallery_title = 'lib_commonDialogs_permissionDeniedGallery_title';
  static const String lib_commonDialogs_permissionDeniedGallery_message = 'lib_commonDialogs_permissionDeniedGallery_message';

  static const String lib_lists_noItemsFound = 'lib_lists_noItemsFound';
  static const String lib_lists_noMoreItems = 'lib_lists_noMoreItems';
  static const String lib_lists_loadingMoreItemsFailed = 'lib_lists_loadingMoreItemsFailed';
  
  static const String lib_error_network = 'lib_error_network';
  static const String lib_error_unknown = 'lib_error_unknown';

  static const String lib_warning_resourceNotFound_title = 'lib_warning_resourceNotFound_title';
  static const String lib_warning_resourceNotFound_message = 'lib_warning_resourceNotFound_message';

  static const String lib_imageNotAvailable_message = 'lib_imageNotAvailable_message';

  static const String lib_models_cognitoSignIn_invalidCredentials_message = 'lib_models_cognitoSignIn_invalidCredentials_message';
  static const String lib_models_cognitoSignIn_passwordChangeRequired_message = 'lib_models_cognitoSignIn_passwordChangeRequired_message';
  static const String lib_models_cognitoChangeInitialPassword_unauthorized_message = 'lib_models_cognitoChangeInitialPassword_unauthorized_message';
  static const String lib_models_cognitoChangeInitialPassword_passwordTooShort_message = 'lib_models_cognitoChangeInitialPassword_passwordTooShort_message';
  static const String lib_models_cognitoChangeInitialPassword_passwordUpperMissing_message = 'lib_models_cognitoChangeInitialPassword_passwordUpperMissing_message';
  static const String lib_models_cognitoChangeInitialPassword_passwordLowerMissing_message = 'lib_models_cognitoChangeInitialPassword_passwordLowerMissing_message';
  static const String lib_models_cognitoChangeInitialPassword_passwordNumberMissing_message = 'lib_models_cognitoChangeInitialPassword_passwordNumberMissing_message';
  static const String lib_models_cognitoChangeInitialPassword_passwordSymbolMissing_message = 'lib_models_cognitoChangeInitialPassword_passwordSymbolMissing_message';
  static const String lib_models_cognitoForgotPasswordRequest_userNotFound_message = 'lib_models_cognitoForgotPasswordRequest_userNotFound_message';
  static const String lib_models_cognitoForgotPasswordRequest_sendLimitExceeded_message = 'lib_models_cognitoForgotPasswordRequest_sendLimitExceeded_message';
  static const String lib_models_cognitoResetPassword_codeInvalid_message = 'lib_models_cognitoResetPassword_codeInvalid_message';
  
  static const String lib_commonContentPlaceholder_featureInDevelopment_title = 'lib_commonContentPlaceholder_featureInDevelopment_title';
  static const String lib_commonContentPlaceholder_featureInDevelopment_message = 'lib_commonContentPlaceholder_featureInDevelopment_message';
  static const String lib_blueForms_formInputImages_noImageSelected = 'lib_blueForms_formInputImages_noImageSelected';
  static const String lib_blueForms_formInputImages_selectImage = 'lib_blueForms_formInputImages_selectImage';
  static const String lib_blueForms_formInputImages_takePhoto = 'lib_blueForms_formInputImages_takePhoto';
  static const String lib_blueForms_formInputImages_changeImage = 'lib_blueForms_formInputImages_changeImage';
  static const String lib_blueForms_formInputImagesSingle_errorRequired = 'lib_blueForms_formInputImagesSingle_errorRequired';
  static const String lib_blueForms_formInputImagesSingle_errorMinWidth = 'lib_blueForms_formInputImagesSingle_errorMinWidth';
  static const String lib_blueForms_formInputImagesSingle_errorMinHeight = 'lib_blueForms_formInputImagesSingle_errorMinHeight';

  static const String lib_blueForms_inputValidators_failedOptionSelectionUntouched = 'lib_blueForms_inputValidators_failedOptionSelectionUntouched';
  static const String lib_blueForms_inputValidators_failedNotEmptyCheck = 'lib_blueForms_inputValidators_failedNotEmptyCheck';
  static const String lib_blueForms_inputValidators_failedPhoneNumberCheck = 'lib_blueForms_inputValidators_failedPhoneNumberCheck';

  static const String lib_blueForms_inputPickOption_pleaseChoose = 'lib_blueForms_inputPickOption_pleaseChoose';

  static const String lib_blueForms_requiredFieldsNotice = 'lib_blueForms_requiredFieldsNotice';

  static const String lib_blueForms_commonInputs_emailLabel = 'lib_blueForms_commonInputs_emailLabel';
  static const String lib_blueForms_commonInputs_emailHint = 'lib_blueForms_commonInputs_emailHint';
  static const String lib_blueForms_commonInputs_passwordLabel = 'lib_blueForms_commonInputs_passwordLabel';
  static const String lib_blueForms_commonInputs_passwordHint = 'lib_blueForms_commonInputs_passwordHint';

  static const String lib_blueForms_commonInputs_phoneNumberLabel = 'lib_blueForms_commonInputs_phoneNumberLabel';
  static const String lib_blueForms_commonInputs_phoneNumberHint = 'lib_blueForms_commonInputs_phoneNumberHint';

  static const String lib_blueForms_commonInputs_givenNameLabel = 'lib_blueForms_commonInputs_givenNameLabel';
  static const String lib_blueForms_commonInputs_givenNameHint = 'lib_blueForms_commonInputs_givenNameHint';
  static const String lib_blueForms_commonInputs_familyNameLabel = 'lib_blueForms_commonInputs_familyNameLabel';
  static const String lib_blueForms_commonInputs_familyNameHint = 'lib_blueForms_commonInputs_familyNameHint';

  static const String lib_blueForms_commonInputs_address_streetLabel = 'lib_blueForms_commonInputs_address_streetLabel';
  static const String lib_blueForms_commonInputs_address_streetHint = 'lib_blueForms_commonInputs_address_streetHint';
  static const String lib_blueForms_commonInputs_address_postalCodeLabel = 'lib_blueForms_commonInputs_address_postalCodeLabel';
  static const String lib_blueForms_commonInputs_address_postalCodeHint = 'lib_blueForms_commonInputs_address_postalCodeHint';
  static const String lib_blueForms_commonInputs_address_cityLabel = 'lib_blueForms_commonInputs_address_cityLabel';
  static const String lib_blueForms_commonInputs_address_cityHint = 'lib_blueForms_commonInputs_address_cityHint';


  // NOT IN USE
  static const String lib_performAsyncTask_errorDescription = 'lib_performAsyncTask_errorDescription';
  static const String lib_performAsyncTask_errorRetryButton = 'lib_performAsyncTask_errorRetryButton';
  static const String lib_performAsyncTask_errorResolveButton = 'lib_performAsyncTask_errorResolveButton';

  static const String lib_dateTimeFormatter_today = 'lib_dateTimeFormatter_today';
  static const String lib_dateTimeFormatter_yesterday = 'lib_dateTimeFormatter_yesterday';
  static const String lib_dateTimeFormatter_tomorrow = 'lib_dateTimeFormatter_tomorrow';

  static const String lib_infoScreen_completeButton = 'lib_infoScreen_completeButton';
  static const String lib_appDialog_notionDismissButton = 'lib_appDialog_notionDismissButton';
  static const String lib_singleTextInputScreen_confirmButton = 'lib_singleTextInputScreen_confirmButton';
  static const String lib_singleTextInputScreen_minCharactersError = 'lib_singleTextInputScreen_minCharactersError';
  static const String lib_appDialog_confirmationTitle = 'lib_appDialog_confirmationTitle';
  static const String lib_appDialog_confirmationCancelButton = 'lib_appDialog_confirmationCancelButton';
  static const String lib_appDialog_confirmationConfirmButton = 'lib_appDialog_confirmationConfirmButton';

}