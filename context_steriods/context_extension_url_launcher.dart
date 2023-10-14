


import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart' as p_url_launcher;

extension ExtensionContextUrlLauncher on BuildContext
{
  Future<void> launchUrl(String url) async
  {
    final Uri uri = Uri.parse(url);

    if (!await p_url_launcher.launchUrl(uri)) throw 'Could not launch $uri';
  }
}