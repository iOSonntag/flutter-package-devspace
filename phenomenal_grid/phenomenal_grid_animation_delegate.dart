


import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iosite/_packages/phenomenal_grid/animated_phenomenal_grid.dart';
import 'package:iosite/_packages/phenomenal_grid/phenomenal_grid_layout.dart';
import 'package:iosite/_packages/flutter_spice_powder/common_data_types_powder/double.dart';
import 'package:iosite/_packages/flutter_spice_powder/common_data_types_powder/int.dart';
import 'package:iosite/_packages/ios/widgets/animations/animate_entry.dart';


// ignore: camel_case_types
enum kAnimationStartCalculationBasis
{
  previousItemStart,
  previousItemEnd,
  previousItemIncludingIndependentStart,
  previousItemIncludingIndependentEnd,
  independent,
}


class GridItemAnimationTiming {

  final Duration delay;
  final Duration duration;
  final kAnimationStartCalculationBasis startCalculationBasis;

  GridItemAnimationTiming({
    required this.delay,
    this.duration = const Duration(milliseconds: 2000),
    this.startCalculationBasis = kAnimationStartCalculationBasis.previousItemEnd,
  });

  bool get isIndependent => startCalculationBasis == kAnimationStartCalculationBasis.independent;

  @override
  String toString()
  {
    return 'GridItemAnimationTiming(delay: $delay, duration: $duration, startCalculationBasis: $startCalculationBasis)';
  }
}

class AnimationInfo {

  final Duration delay;
  final Duration duration;

  AnimationInfo({
    required this.delay,
    required this.duration,
  });

  @override
  String toString()
  {
    return 'AnimationInfo(delay: $delay, duration: $duration)';
  }

  String devInfo()
  {
    return 
      '- delay: ${delay.inMilliseconds }ms\n'
      '- duration: ${duration.inMilliseconds} ms';
  }

}

class RelatedItemInfos {

  final ItemInfo? firstItem;
  final ItemInfo? previousItem;

  RelatedItemInfos({
    this.firstItem,
    this.previousItem,
  });

  @override
  String toString()
  {
    return 'RelatedItemInfos(firstItem: $firstItem, previousItem: $previousItem)';
  }
}

typedef ObtainAnimationTiming = GridItemAnimationTiming Function(OrderedItemInfo itemInfo);
typedef AnimationBuilder = Widget Function(BuildContext context, AnimatedItemRenderInfo itemInfo, AnimationInfo animationInfo, RelatedItemInfos relatedItemInfos);

class PhenomenalGridAnimationDelegate {

  /// Get the animation timings for the item.
  /// 
  /// This callback will be called in sorted ordinal order of the 
  /// item keys. This means it is not called in the order of the 
  /// grid layout.
  /// 
  /// e.g.:
  /// 1 2 3
  final ObtainAnimationTiming calculateAnimationTiming;

  /// The animation builder. This will be called for each item
  /// in the grid.
  /// 
  /// The first parameter is the context.
  /// The second parameter is the item widget.
  /// The third parameter is the item key.
  /// The fourth parameter is the delay.
  /// The fifth parameter is the duration.
  /// The sixth parameter is the alignment of the first item in the grid.
  /// The seventh parameter is the alignment of the previous item in the grid.
  /// 
  /// The first item in the grid will have a null previous item alignment and
  /// a null first item alignment.
  /// 
  final AnimationBuilder animationBuilder;

  PhenomenalGridAnimationDelegate({
    required this.calculateAnimationTiming,
    required this.animationBuilder,
  });

  factory PhenomenalGridAnimationDelegate.magnetic({
    ObtainAnimationTiming? constructAnimationDelay,
  })
  {


    return PhenomenalGridAnimationDelegate(
      calculateAnimationTiming: constructAnimationDelay ?? defaultAnimationDelay,
      animationBuilder: (context, itemInfo, animationInfo, relatedItemInfos)
      {
        if (itemInfo.isFirstItem)
        {
          return AnimateEntry.appear(
            delay: animationInfo.delay,
            duration: animationInfo.duration,
            builder: (context, status) => itemInfo.buildItem(
              context,
              itemInfo,
              kPhenomenalGridItemStatus.idle,
            ),
          );
        }

        return AnimateEntry.dock(
          delay: animationInfo.delay,
          duration: animationInfo.duration,
          from: -(itemInfo.alignmentTo(relatedItemInfos.firstItem!)),
          builder: (context, status) => itemInfo.buildItem(
            context,
            itemInfo,
            kPhenomenalGridItemStatus.idle,
          ),
        );
      },
    );
  }

  static GridItemAnimationTiming defaultAnimationDelay(OrderedItemInfo itemInfo)
  {
    if (itemInfo.orderIndex == 0)
    {
      return GridItemAnimationTiming(
        delay: 500.milliseconds,
      );
    }

    if (itemInfo.orderIndex == 1)
    {
      return GridItemAnimationTiming(
        delay: 100.milliseconds,
        startCalculationBasis: kAnimationStartCalculationBasis.previousItemEnd
      );
    }

    bool isIndependent = 0.2.chance;

    return GridItemAnimationTiming(
      delay: isIndependent ? 3000.milliseconds : 1000.randomize(startValue: 10).asDuration,
      startCalculationBasis: isIndependent ? kAnimationStartCalculationBasis.independent : kAnimationStartCalculationBasis.previousItemIncludingIndependentStart
    );
  }
    
}