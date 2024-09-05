// ignore_for_file: non_constant_identifier_names

part of devspace;


class AppEvents {

  final void Function(BuildContext context)? onAppResumed;
  final void Function(BuildContext context)? onAndroidBackButtonPressed;
  final Future<Uint8List> Function(Uint8List heicFileBytes) onWorkaround_web_convertHeicToPng;
  final LogEvents? logEvents;

  const AppEvents({
    this.onAppResumed,
    this.onAndroidBackButtonPressed,
    required this.onWorkaround_web_convertHeicToPng,
    this.logEvents,
  });

}


class LogEvents {

  final void Function(String message, Object exception) onException;
  final void Function(String message, Object? error) onError;
  final void Function(String message) onAppIssue;
  final void Function(String message) onWarning;
  final void Function(String message) onLog;

  const LogEvents({
    required this.onException,
    required this.onError,
    required this.onAppIssue,
    required this.onWarning,
    required this.onLog,
  });

}