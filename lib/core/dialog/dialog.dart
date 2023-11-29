part of devspace;



abstract class Dialog {

  Dialog._();


  static Future<bool> showConfirmation(BuildContext context, {
    String? title, 
    required String message, 
    String? denialText,
    String? approveText,
    bool barrierDismissible = false,
    }) async
  {
    String titleResolved = title ?? LibStrings.lib_general_titleConfirm.tr();
    String denial = denialText ?? LibStrings.lib_general_actionNo.tr();
    String approve = approveText ?? LibStrings.lib_general_actionConfirm.tr();

    final confirmed = await _internalShowDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context)
      {

        return TextDialog(
          title: titleResolved,
          text: message,
          actions: [
            DialogAction(
                title: denial,
                type: kButtonType.regular,
                onPressed: ()
                {
                  // TODO: ensure that the correct popup gets rejected (NOT the top screen lol)
                  Navigator.of(context).pop(false);
                }
            ),
            DialogAction(
                title: approve,
                type: kButtonType.primary,
                onPressed: ()
                {
                  // TODO: ensure that the correct popup gets rejected (NOT the top screen lol)
                  Navigator.of(context).pop(true);
                }
            )
          ],

        );
      }
    );

    return confirmed ?? false;
  }



  static Future<void> showNotice(BuildContext context, {
    String? title, 
    required String message, 
    kDialogNoticeType type = kDialogNoticeType.info,
    String? dismissText, 
    bool barrierDismissible = false,
    }) async
  {
    final dismiss = dismissText ?? LibStrings.lib_general_actionOkay.tr();
    
    await _internalShowDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context)
      {
        return TextDialog(
          title: title ?? type.title,
          text: message,
          actions: [
            DialogAction(
              title: dismiss, 
              type: type.buttonType,
              iconOverride: type.icon,
              onPressed: ()
              {
                Navigator.of(context).pop();
              }
            ),
          ],
        );
      }
    );
  }




  static Future<T?> _internalShowDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  })
  {
    return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(_internalBuildDialogRoute<T>(
      context: context,
      builder: builder,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      traversalEdgeBehavior: traversalEdgeBehavior ?? TraversalEdgeBehavior.closedLoop,
    ));
  }


  // INFO: this was copied from the original Flutter source code as of 2023-11-25
  static DialogRoute<T> _internalBuildDialogRoute<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  })
  {
    final CapturedThemes themes = InheritedTheme.capture(
      from: context,
      to: Navigator.of(
        context,
        rootNavigator: useRootNavigator,
      ).context,
    );

    return DialogRoute<T>(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      settings: routeSettings,
      anchorPoint: anchorPoint,
      themes: themes,
      traversalEdgeBehavior: traversalEdgeBehavior ?? TraversalEdgeBehavior.closedLoop,
    );
  }


}


// TODO: add congratulations
// ignore: camel_case_types
enum kDialogNoticeType
{
  info,
  success,
  error,
}

extension ExtensionOnDialogNoticeType on kDialogNoticeType
{
  IconData get icon
  {
    return switch (this)
    {
      kDialogNoticeType.info => Icons.info_outline_rounded,
      kDialogNoticeType.success => Icons.check_rounded,
      kDialogNoticeType.error => Icons.error_outline_rounded,
    };
  }

  Color color(BuildContext context)
  {
    return switch (this)
    {
      kDialogNoticeType.info => context.colors.primary,  
      kDialogNoticeType.success => context.colors.success,
      kDialogNoticeType.error => context.colors.destructive,
    };
  }

  String get title
  {
    return switch (this)
    {
      kDialogNoticeType.info => LibStrings.lib_general_titleInfo.tr(),
      kDialogNoticeType.success => LibStrings.lib_general_titleSuccess.tr(),
      kDialogNoticeType.error => LibStrings.lib_general_titleError.tr(),
    };
  }

  kButtonType get buttonType
  {
    switch (this)
    {
      case kDialogNoticeType.info:
        return kButtonType.regular;
      case kDialogNoticeType.success:
        return kButtonType.success;
      case kDialogNoticeType.error:
        return kButtonType.destructive;
    }
  }
}