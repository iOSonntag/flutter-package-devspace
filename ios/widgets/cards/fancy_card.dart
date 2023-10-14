


import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:iosite/_packages/ios/widgets/animations/animate_entry.dart';
import 'package:iosite/_packages/ios/widgets/cards/fancy_card_base.dart';
import 'package:hexcolor/hexcolor.dart';


class FancyCard extends StatelessWidget {

  const FancyCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context)
  {
    return FancyCardBase(
      child: Column(
        children: [

          Expanded(child: child)

        ],
      )
    );
  }
}