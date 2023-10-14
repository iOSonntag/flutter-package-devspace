


import 'package:flutter/material.dart';
import 'package:iosite/_packages/flutter_spice_powder/widget_powder/widget.dart';


class OverlayWidget extends StatefulWidget {

  final bool show;
  final WidgetBuilder buildOverlay;
  final Widget? child;

  const OverlayWidget({
    super.key,
    this.show = true,
    required this.buildOverlay,
    this.child,
  });

  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {

  OverlayEntry? _overlayEntry;

  @override
  void initState()
  {
    _toggleOverlay(widget.show);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant OverlayWidget oldWidget)
  {
    if (oldWidget.show != widget.show)
    {
      _toggleOverlay(widget.show);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _toggleOverlay(bool show)
  {
    if (show)
    {
      _overlayEntry = OverlayEntry(
        maintainState: true,
        builder: widget.buildOverlay,
      );
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Overlay.of(context).insert(_overlayEntry!);
      });
    }
    else
    {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return widget.child ?? NoWidget();
  }

  @override
  void dispose()
  {
    _overlayEntry?.remove();
    _overlayEntry = null;
    super.dispose();
  }
}