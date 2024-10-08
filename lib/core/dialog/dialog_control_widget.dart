

part of devspace;


// Note: this is buggy and cases issues on some android devices
// class _PopupController extends ChangeNotifier
// {
//   bool _close = false;
//   bool get close => _close;


//   void closePopup()
//   {
//     _close = true;
//     notifyListeners();
//   }
// }


// class DialogControlWidget extends StatefulWidget {

//   final bool show;
//   final bool dialogBarrierDismissible;
//   final kDialogAnimationStyle dialogAnimationStyle;
//   final WidgetBuilder dialogBuilder;
//   final Widget child;

//   const DialogControlWidget({
//     super.key,
//     required this.show,
//     this.dialogBarrierDismissible = false,
//     this.dialogAnimationStyle = kDialogAnimationStyle.regular,
//     /// The dialog is not allowed to close itself, it must be closed by the
//     /// [show] property being set to false.
//     required this.dialogBuilder,
//     required this.child,
//   });

//   @override
//   State<DialogControlWidget> createState() => _DialogControlWidgetState();
// }

// class _DialogControlWidgetState extends State<DialogControlWidget> {

//   _PopupController? _controller = _PopupController();

//   @override
//   void initState()
//   {
//     super.initState();

//     if (widget.show)
//     {
//       WidgetsBinding.instance.addPostFrameCallback((timeStamp)
//       {
//         _spawnPopup(context);
//       });
//     }
//   }

//   @override
//   void didUpdateWidget(covariant DialogControlWidget oldWidget)
//   {
//     super.didUpdateWidget(oldWidget);

//     if (oldWidget.show != widget.show)
//     {
//       if (widget.show == false)
//       {
//         _controller?.closePopup();
//         _controller?.dispose();
//         _controller = _PopupController();
//       }
//       else
//       {
//         WidgetsBinding.instance.addPostFrameCallback((timeStamp)
//         {
//           _spawnPopup(context);
//         });
//       }
//     }
//   }

//   void _spawnPopup(BuildContext context)
//   {
//     if (_controller == null)
//     {
//       throw LibraryIssueError('The popup controller is null inside the DialogControlWidget');
//     }

//     _PopupController controller = _controller!;

//     DialogCenter.showDialogBuilder(context,
//       barrierDismissible: widget.dialogBarrierDismissible,
//       animationStyle: widget.dialogAnimationStyle,
//       builder: (context)
//       {
//         return _PopupBuilder(
//           controller: controller,
//           builder: widget.dialogBuilder
//         );
//       }
//     );
//   }

//   @override
//   Widget build(BuildContext context)
//   {
//     return widget.child;
//   }

//   @override
//   void dispose()
//   {
//     _controller?.closePopup();
//     _controller = null;
//     super.dispose();
//   }
  
// }

// class _PopupBuilder extends StatefulWidget
// {
//   final WidgetBuilder builder;
//   final _PopupController controller;

//   const _PopupBuilder({
//     // ignore: unused_element
//     super.key,
//     required this.builder,
//     required this.controller,
//   });

//   @override
//   State<_PopupBuilder> createState() => _PopupBuilderState();
// }

// class _PopupBuilderState extends State<_PopupBuilder>
// {
//   @override
//   void initState()
//   {
//     super.initState();

//     widget.controller.addListener(_onControllerChange);
//   }

//   void _onControllerChange()
//   {

//     if (widget.controller.close)
//     {
//       if (mounted == false)
//       {
//         return;
//       }

//       WidgetsBinding.instance.addPostFrameCallback((timeStamp)
//       {
//         Navigator.of(context).removeRoute(ModalRoute.of(context)!);
//       }); 

//     }
//   }

//   @override
//   Widget build(BuildContext context)
//   {
//     return widget.builder(context);
//   }
// }