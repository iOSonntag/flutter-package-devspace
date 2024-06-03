part of devspace;


extension ExtensionSnackBarOnContext on BuildContext
{
  void showError(Object exceptionOrString)
  {
    final message = exceptionOrString is String ? exceptionOrString : ExceptionTool.toUserFriendlyMessage(exceptionOrString);

    _showSnackBar(message, colors.error, colors.onError);
  }

  void showSuccess([String? message])
  {
    message ??= LibStrings.lib_general_titleSuccess.tr();

    _showSnackBar(message, colors.success, colors.onSuccess);
  }

  void _showSnackBar(String message, Color backgroundColor, Color textColor)
  {
    final snackBar = SnackBar(
      content: TextBody.medium(message,
        color: textColor,
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: dimensions.borderRadiusL,
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: paddingXXL.fineBottom(MediaQuery.paddingOf(this).bottom),
      elevation: 30,
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}