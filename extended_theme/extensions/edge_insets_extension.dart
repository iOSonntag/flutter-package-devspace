



import 'package:flutter/widgets.dart';

extension ExtensionEdgeInsets on EdgeInsets {

  EdgeInsets get onlyHorizontal => EdgeInsets.only(
    left: left,
    right: right,
  );

  EdgeInsets get onlyVertical => EdgeInsets.only(
    top: top,
    bottom: bottom,
  );

}