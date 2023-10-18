



part of devspace;

abstract class DevValues {

  DevValues._();

  static const Color colorMark1 = Color.fromARGB(255, 255, 0, 255);
  static const Color colorMark2 = Color.fromARGB(255, 0, 255, 255);
  static const Color colorBad = Color.fromARGB(255, 255, 0, 0);
  

}


/// The current status of a grid item. Do not use this to create animations for
/// the appearance of the grid items. This is already handled by the framework
/// itself.
/// 
/// This is only for letting you know in which animation state the grid item is.
/// 
/// You can use this for example to create animations for the content of the 
/// grid items.
// ignore: camel_case_types
enum kPhenomenalGridItemStatus
{
  invisible,
  animatingIn,
  idle,
  animatingOut,
}

/// A builder for the phenomenal grid.
/// 
/// Since the int value of 0 is reserved for empty spaces in the grid. This
/// builder will never be called with an itemKey of 0.
typedef AnimatedPhenomenalGridItemBuilder = Widget Function(BuildContext context, ItemInfo itemInfo, kPhenomenalGridItemStatus status);


class AnimatedItemRenderInfo extends OrderedItemInfo {

  final AnimatedPhenomenalGridItemBuilder buildItem;

  AnimatedItemRenderInfo({
    required super.itemKey,
    required super.x,
    required super.y,
    required super.width,
    required super.height,
    required super.orderIndex,
    required super.totalItemCount,
    required this.buildItem
  });

  @override
  String toString()
  {
    return 'AnimatedItemRenderInfo(itemKey: $itemKey, x: $x, y: $y, width: $width, height: $height, orderIndex: $orderIndex, totalItemCount: $totalItemCount)';
  }

}

extension OrderItemInfoAnimatedExtension on OrderedItemInfo {

  AnimatedItemRenderInfo toAnimatedItemRenderInfo(AnimatedPhenomenalGridItemBuilder buildItem)
  {
    return AnimatedItemRenderInfo(
      itemKey: itemKey, 
      x: x, 
      y: y, 
      width: width, 
      height: height, 
      orderIndex: orderIndex, 
      totalItemCount: totalItemCount, 
      buildItem: buildItem
    );
  }

}

class _RenderInfo {

  final AnimationInfo animationInfo;
  final AnimatedItemRenderInfo itemInfo;
  final RelatedItemInfos relatedItemInfos;

  _RenderInfo({
    required this.animationInfo,
    required this.itemInfo,
    required this.relatedItemInfos,
  });

}

class PhenomenalGridDevOptions {

  final bool animationSlowMode;
  final bool showItemKeys;
  final bool showItemBorders;
  final bool showItemCenters;
  final bool showAnimationTiming;
  final bool showRelatedItemInfos;

  const PhenomenalGridDevOptions({
    this.animationSlowMode = true,
    this.showItemKeys = true,
    this.showItemBorders = true,
    this.showItemCenters = true,
    this.showAnimationTiming = true,
    this.showRelatedItemInfos = true,
  });

  static const PhenomenalGridDevOptions enableEverything = PhenomenalGridDevOptions(
    animationSlowMode: true,
    showItemKeys: true,
    showItemBorders: true,
    showItemCenters: true,
    showAnimationTiming: true,
    showRelatedItemInfos: true,
  );
}

class AnimatedPhenomenalGridItem {

  final AnimatedPhenomenalGridItemBuilder buildItem;

  AnimatedPhenomenalGridItem({
    AnimatedPhenomenalGridItemBuilder? buildItem,
    Widget? item,
  }) : 
    buildItem = buildItem ?? ((context, itemInfo, status) => item!),
    assert(buildItem != null || item != null),
    assert(buildItem == null || item == null);


}

class AnimatedPhenomenalGrid extends StatelessWidget {

  final PhenomenalGridLayout layout;
  final PhenomenalGridAnimationDelegate animationDelegate;
  final PhenomenalGridDevOptions? devOptions;
  final bool disableAnimations;
  final AnimatedPhenomenalGridItemBuilder buildItem;
  final Map<int, _RenderInfo> _renderInfo = {};

  AnimatedPhenomenalGrid({
    super.key,
    PhenomenalGridLayout? layout,
    PhenomenalGridAnimationDelegate? animationDelegate,
    this.devOptions,
    this.disableAnimations = false,
    required this.buildItem,
  }) : 
    layout = layout ?? PhenomenalGridLayout.defaultLayout(),
    animationDelegate = animationDelegate ?? PhenomenalGridAnimationDelegate.magnetic()
  {
    _calculateRenderInfo(); 
  }


  AnimatedPhenomenalGrid.list({
    super.key,
    PhenomenalGridLayout? layout,
    PhenomenalGridAnimationDelegate? animationDelegate,
    this.devOptions,
    this.disableAnimations = false,
    List<AnimatedPhenomenalGridItem> children = const [],
  }) : 
    layout = layout ?? PhenomenalGridLayout.defaultLayout(),
    animationDelegate = animationDelegate ?? PhenomenalGridAnimationDelegate.magnetic(),
    buildItem = ((context, itemInfo, status) => children.hasIndex(itemInfo.itemKey) ? children[itemInfo.itemKey].buildItem(context, itemInfo, status) : SizedBox.shrink())
  {
    _calculateRenderInfo(); 
  }




  void _calculateRenderInfo()
  {
    ItemInfo? firstItem;
    _RenderInfo? previousItem;
    _RenderInfo? previousNoneIndependentItem;
    _RenderInfo? previousIndependentItem;


    for (OrderedItemInfo fiItem in layout.orderedItems)
    {
      GridItemAnimationTiming animationTiming = animationDelegate.calculateAnimationTiming(fiItem);
      Duration animationDuration = animationTiming.duration;

      if (disableAnimations)
      {
        animationDuration = 1.asDuration;
      }
      else if (devOptions?.animationSlowMode == true)
      {
        animationDuration = animationDuration * 5;
      }

      _RenderInfo renderInfo = _RenderInfo(
        animationInfo: AnimationInfo(
          delay: disableAnimations.thenEither(1.asDuration, _calculateDelay(previousItem, previousNoneIndependentItem, previousIndependentItem, animationTiming)), 
          duration: animationDuration
        ), 
        itemInfo: fiItem.toAnimatedItemRenderInfo(buildItem), 
        relatedItemInfos: RelatedItemInfos(
          firstItem: firstItem,
          previousItem: previousNoneIndependentItem?.itemInfo,
        )
      );

      _renderInfo[fiItem.itemKey] = renderInfo;

      // setting first item after the first render info was created
      // so that the first render info does not contain itself
      firstItem ??= fiItem;
      previousItem = renderInfo;

      if (animationTiming.isIndependent)
      {
        previousIndependentItem = renderInfo;
      }
      else
      {
        previousNoneIndependentItem = renderInfo;
      }
    }
  }

  Duration _calculateDelay(_RenderInfo? previousItem, _RenderInfo? previousNoneIndependentItem, _RenderInfo? previousIndependentItem, GridItemAnimationTiming animationTiming)
  {
    Duration calculationBasis = Duration.zero;

    if (animationTiming.startCalculationBasis == kAnimationStartCalculationBasis.previousItemStart)
    {
      calculationBasis = previousNoneIndependentItem?.animationInfo.delay ?? Duration.zero;
    }
    else if (animationTiming.startCalculationBasis == kAnimationStartCalculationBasis.previousItemEnd)
    {
      calculationBasis = (previousNoneIndependentItem?.animationInfo.delay ?? Duration.zero) + (previousNoneIndependentItem?.animationInfo.duration ?? Duration.zero);
    }
    else if (animationTiming.startCalculationBasis == kAnimationStartCalculationBasis.previousItemIncludingIndependentStart)
    {
      calculationBasis = previousItem?.animationInfo.delay ?? Duration.zero;
    }
    else if (animationTiming.startCalculationBasis == kAnimationStartCalculationBasis.previousItemIncludingIndependentEnd)
    {
      calculationBasis = (previousItem?.animationInfo.delay ?? Duration.zero) + (previousItem?.animationInfo.duration ?? Duration.zero);
    }

    Duration animationDelay = animationTiming.delay;

      if (devOptions?.animationSlowMode == true)
      {
        animationDelay = animationDelay * 5;
      }

    return calculationBasis + animationDelay;
  }





  

  @override
  Widget build(BuildContext context)
  {
    return PhenomenalGrid(
      layout: layout,
      buildItem: _buildItem
    );
  }

  Widget _buildItem(BuildContext context, ItemInfo itemInfo)
  {
    _RenderInfo? renderInfo = _renderInfo[itemInfo.itemKey];

    if (renderInfo == null)
    {
      throw Exception('Render info for item key ${itemInfo.itemKey} not found.');
    }

    AnimatedItemRenderInfo itemRenderInfo = _injectDevInfoBuilderIfNeeded(renderInfo.itemInfo);

    Widget current = animationDelegate.animationBuilder(context, itemRenderInfo, renderInfo.animationInfo, renderInfo.relatedItemInfos);

    if (devOptions?.animationSlowMode == true)
    {
      current = _StaticDevOptions(
        renderInfo: renderInfo,
        devOptions: devOptions!,
        child: current
      );
    }

    return current;
  }

  AnimatedItemRenderInfo _injectDevInfoBuilderIfNeeded(AnimatedItemRenderInfo originalRenderInfo)
  {
    if (devOptions == null)
    {
      return originalRenderInfo;
    }

    AnimatedPhenomenalGridItemBuilder builder = originalRenderInfo.buildItem;

    return originalRenderInfo.toAnimatedItemRenderInfo((context, itemInfo, status)
    {
      return Stack(
        children: [

          Positioned.fill(child: builder(context, itemInfo, status)),

          if (devOptions!.showItemKeys) Positioned(
            right: 0.0,
            bottom: 0.0,
            child: Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              color: DevValues.colorMark2,
              child: Text(itemInfo.devInfo(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  height: 0.9
                )
              ),
            )
          ),

          if (devOptions!.showItemBorders) Positioned.fill(child: Container(decoration: BoxDecoration(border: Border.all(color: DevValues.colorMark1, width: 1.0)))),

          if (devOptions!.showItemCenters) Positioned.fill(child: Center(child: Container(width: 10.0, height: 10.0, decoration: const BoxDecoration(color: DevValues.colorMark1)))),
        ]
      );
    });
  }
    
}


class _StaticDevOptions extends StatelessWidget {

  final PhenomenalGridDevOptions devOptions;
  final _RenderInfo renderInfo;
  final Widget child;

  const _StaticDevOptions({
    required this.devOptions,
    required this.renderInfo,
    required this.child,
  });

  @override
  Widget build(BuildContext context)
  {
    return Stack(
        children: [

          Positioned.fill(child: child),

          if (devOptions.showItemKeys) _buildAnimationInfo(context),

        ]
    );
  }

  Widget _buildAnimationInfo(BuildContext context)
  {
    String info = '';

    if (devOptions.showAnimationTiming)
    {
      info = info.addLine(renderInfo.animationInfo.devInfo());
    }

    if (devOptions.showRelatedItemInfos)
    {
      ItemInfo? firstItem = renderInfo.relatedItemInfos.firstItem;

      
      if (firstItem != null)
      {
        Alignment? toFirst = renderInfo.itemInfo.alignmentTo(firstItem);
        info = info.addLine('- first (${firstItem.itemKey}): (${toFirst.quadrant}: ${toFirst.x}, ${toFirst.y})');
      }
    }



    return Positioned(
      top: 0.0,
      left: 0.0,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(5.0),
        color: DevValues.colorMark1,
        child: Text(info,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            height: 0.9
          )
        ),
      ),
    );
  }

}