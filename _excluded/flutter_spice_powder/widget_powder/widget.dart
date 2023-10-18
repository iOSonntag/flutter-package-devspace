




import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget EmptyWidget()
{
  return const SizedBox.shrink();
}

extension WidgetExtension on Widget {

  // ignore: non_constant_identifier_names
  Widget NoWidget() => const SizedBox.shrink();

}


extension StateStatefulWidgetExtension<T extends StatefulWidget> on State<T> {

  // ignore: non_constant_identifier_names
  Widget NoWidget() => const SizedBox.shrink();

}