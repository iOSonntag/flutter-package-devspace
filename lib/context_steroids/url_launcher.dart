


part of devspace;

extension ExtensionContextUrlLauncher on BuildContext
{
  Future<void> openUrl(String url, {
    bool webOpenInNewTap = true
  }) async
  {
    final Uri uri = Uri.parse(url);

    final launched = await p_url_launcher.launchUrl(uri,
      webOnlyWindowName: webOpenInNewTap ? '_blank' : '_self'
    );

    if (!launched) throw 'Could not launch $uri';
  }

  Future<void> openRouteInNewTab(String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) async
  {
    final newUrl = GoRouter.of(this).namedLocation(name, pathParameters: pathParameters, queryParameters: queryParameters);
    

    await openUrl('/#$newUrl', webOpenInNewTap: true);
  }


  Future<void> openSettingsPushNotifications() async
  {
    await AppSettings.openAppSettings(type: AppSettingsType.notification);
  }

  /// Open the App store on iOS and Play Store on Android.
  Future<void> openAppStore() async
  {
    final String appId = Platform.isIOS ? App.config.ios.appStoreAppId : (await PackageInfo.fromPlatform()).packageName;

    final Uri url = Uri.parse(
      Platform.isAndroid
        ? 'market://details?id=$appId'
        : 'https://apps.apple.com/app/id$appId',
    );
    
    if (await p_url_launcher.canLaunchUrl(url))
    {
      await p_url_launcher.launchUrl(url, 
        mode: p_url_launcher.LaunchMode.externalApplication
      );
      return;
    } 
    
    final Uri fallbackUrl = Uri.parse(
      Platform.isAndroid
        ? 'https://play.google.com/store/apps/details?id=$appId'
        : 'https://apps.apple.com/app/id$appId',
    );

    if (await p_url_launcher.canLaunchUrl(fallbackUrl))
    {
      await p_url_launcher.launchUrl(fallbackUrl, 
        mode: p_url_launcher.LaunchMode.externalApplication
      );
      return;
    }
    
    throw Exception('Could not open app store: $url');
  }
}