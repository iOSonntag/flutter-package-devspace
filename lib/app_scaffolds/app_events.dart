part of devspace;


class AppEvents {

  final void Function(BuildContext context)? onAppResumed;

  const AppEvents({
    this.onAppResumed,
  });

}