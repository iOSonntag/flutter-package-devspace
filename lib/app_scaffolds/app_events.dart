// ignore_for_file: non_constant_identifier_names

part of devspace;


class AppEvents {

  final void Function(BuildContext context)? onAppResumed;
  final void Function(BuildContext context)? onAndroidBackButtonPressed;
  final Future<Uint8List> Function(Uint8List heicFileBytes) onWorkaround_web_convertHeicToPng;

  const AppEvents({
    this.onAppResumed,
    this.onAndroidBackButtonPressed,
    required this.onWorkaround_web_convertHeicToPng,
  });

}