

part of devspace;

// Note: this is buggy and cases issues on some android devices
// class LoadingOverlay extends StatelessWidget
// {
//   final bool show;
//   final Widget child;

//   const LoadingOverlay({
//     super.key,
//     required this.show,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context)
//   {
//     return DialogControlWidget(
//       show: show,
//       dialogBarrierDismissible: false,
//       dialogBuilder: (context)
//       {
//         return Center(
//           child: ArchLoadingIndicator(),
//         );
//       },
//       child: child,
//     );
//   }
// }