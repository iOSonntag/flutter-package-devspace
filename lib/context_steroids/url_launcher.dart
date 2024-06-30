


part of devspace;

extension ExtensionContextUrlLauncher on BuildContext
{
  Future<void> launchUrl(String url, {
    bool webOpenInNewTap = true
  }) async
  {
    final Uri uri = Uri.parse(url);

    final launched = await p_url_launcher.launchUrl(uri,
      webOnlyWindowName: webOpenInNewTap ? '_blank' : '_self'
    );

    if (!launched) throw 'Could not launch $uri';
  }
}