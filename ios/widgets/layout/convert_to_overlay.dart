


import 'package:flutter/material.dart';
import 'package:iosite/_packages/flutter_spice_powder/common_data_types_powder/bool.dart';
import 'package:iosite/_packages/ios/widgets/overlay/anchored_overlay.dart';


class ConvertToOverlay extends StatefulWidget {

  final bool enabled;
  final Widget child;

  const ConvertToOverlay({
    super.key,
    this.enabled = true,
    required this.child,
  });

  @override
  State<ConvertToOverlay> createState() => _ConvertToOverlayState();
}

class _ConvertToOverlayState extends State<ConvertToOverlay> {

  final GlobalKey _childKey = GlobalKey();
  final GlobalKey _originalLayoutBoxKey = GlobalKey();
  final GlobalKey _overlayBoxKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  @override
  void initState()
  {
    _toggleOverlay(widget.enabled);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ConvertToOverlay oldWidget)
  {
    if (oldWidget.enabled != widget.enabled)
    {
      _toggleOverlay(widget.enabled);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _toggleOverlay(bool show)
  {
    // if (show)
    // {
    //   _overlayEntry = OverlayEntry(
    //     maintainState: true,
    //     builder: (context) => 
    //   );
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     Overlay.of(context).insert(_overlayEntry!);
    //   });
    // }
    // else
    // {
    //   _overlayEntry?.remove();
    //   _overlayEntry = null;
    // }
  }

  bool _isOriginalLayout()
  {
    // return _originalLayoutBoxKey.currentContext != null;
    return _originalLayoutBoxKey.currentContext != null;
      // && (_originalLayoutBoxKey.currentContext?.mounted ?? false)
      // && (_originalLayoutBoxKey.currentContext?.findRenderObject()?.attached ?? false);
  }

  bool _attachedToOverlay()
  {
    return _overlayBoxKey.currentContext != null;
      // && (_overlayBoxKey.currentContext?.mounted ?? false);
      // && (_overlayBoxKey.currentContext?.findRenderObject()?.attached ?? false);
  }

  @override
  Widget build(BuildContext context)
  {
    if (!widget.enabled)
    {
      if (_attachedToOverlay())
      {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          setState(() {});
        });
      }

    

      return Container(
        constraints: BoxConstraints.loose(Size.infinite),
        key: _originalLayoutBoxKey,
        child: KeyedSubtree(
          key: _childKey,
          child: widget.child,
        )
        // child: _isOriginalLayout().maybeThenChild(KeyedSubtree(
        //   key: _childKey,
        //   child: widget.child,
        // )) ?? Container(height: 1.0, width: 1.0),
      );
    }

    final OverlayState overlay = Overlay.of(context, debugRequiredFor: widget.child);
    CapturedThemes capturedThemes = InheritedTheme.capture(from: context, to: overlay.context);

    return AnchoredOverlay(
      showOverlay: widget.enabled,
      buildOverlay: (context, bounds)
      {
        return capturedThemes.wrap(
          Positioned(
            left: bounds.left,
            top: bounds.top,
            width: bounds.width,
            height: bounds.height,
            child: _isOriginalLayout().thenNotChild(KeyedSubtree(
              key: _overlayBoxKey,
              child: KeyedSubtree(
                key: _childKey,
                child: widget.child,
              ),
            )),
          )
        );
      },
      child: _isOriginalLayout().thenChild(KeyedSubtree(
        key: _childKey,
        child: widget.child,
      )),
    );
  }

  @override
  void dispose()
  {
    _overlayEntry?.remove();
    _overlayEntry = null;
    super.dispose();
  }
}