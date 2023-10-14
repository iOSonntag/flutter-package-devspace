



import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iosite/_packages/flutter_spice_powder/common_data_types_powder/list.dart';
import 'package:iosite/_packages/flutter_spice_powder/common_data_types_powder/offset.dart';

// ignore: constant_identifier_names
const List<List<int>> DEFAULT_LAYOUT = [
  [ 0,  0,  0,  0,  0,  0,  0, 10, 10,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0],
  [ 0,  0,  0,  0,  0,  0, 11, 10, 10, 15, 15, 15,  0,  0,  0,  0,  0,  0,  0,  0],
  [ 0,  0,  0,  0,  6,  6,  6, 10, 10, 15, 15, 15, 17,  0,  0,  0,  0,  0,  0,  0],
  [ 0,  0,  0,  0,  6,  6,  6,  1,  1,  1,  1,  1,  1, 18,  0,  0,  0,  0,  0,  0],
  [ 0,  0,  0,  0,  6,  6,  6,  1,  1,  1,  1,  1,  1,  5,  5,  0,  0,  0,  0,  0],
  [ 0,  0,  0,  2,  2,  2,  2,  1,  1,  1,  1,  1,  1,  5,  5,  9,  0,  0,  0,  0],
  [ 0,  0,  0,  0, 16, 16,  3,  3,  3,  3,  4,  4,  4,  4,  7,  7,  7,  0,  0,  0],
  [ 0,  0,  0,  0, 16, 16,  3,  3,  3,  3,  4,  4,  4,  4,  7,  7,  7,  0,  0,  0],
  [ 0,  0,  0,  0,  0,  0, 13, 12, 12,  8,  4,  4,  4,  4,  7,  7,  7,  0,  0,  0],
  [ 0,  0,  0,  0,  0,  0,  0, 12, 12, 14,  4,  4,  4,  4,  0,  0,  0,  0,  0,  0],
  [ 0,  0,  0,  0,  0,  0,  0,  0,  0, 14,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0],
];



class ItemInfo {

  final bool isEmptySpace;
  final int itemKey;
  final int x;
  final int y;
  final int width;
  final int height;

  ItemInfo({
    required this.itemKey,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  }) : isEmptySpace = false;

  ItemInfo.emptySpace(this.x, this.y) : 
    isEmptySpace = true, 
    itemKey = 0, 
    width = 1, 
    height = 1;

  Offset get center => Offset(x + width / 2, y + height / 2);

  Alignment alignmentTo(ItemInfo itemInfo)
  {
    Offset centerThis = center;
    Offset centerOther = itemInfo.center;
    Offset offset = centerThis - centerOther;

    return offset.toAlignment();
  }

  @override
  String toString()
  {
    return 'ItemInfo(itemKey: $itemKey, x: $x, y: $y, width: $width, height: $height)';
  }

  String devInfo()
  {
    return '- key: $itemKey\n- pos: ($x, $y)\n- size: ($width, $height)';
  }

}

class OrderedItemInfo extends ItemInfo {

  /// Attention: This index starts at 0 like a normal list index.
  final int orderIndex;
  final int totalItemCount;

  bool get isFirstItem => orderIndex == 0;
  bool get isLastItem => orderIndex == totalItemCount - 1;

  OrderedItemInfo({
    required super.itemKey,
    required super.x,
    required super.y,
    required super.width,
    required super.height,
    required this.orderIndex,
    required this.totalItemCount,
  });

  @override
  String toString()
  {
    return 'OrderedItemInfo(itemKey: $itemKey, x: $x, y: $y, width: $width, height: $height, orderIndex: $orderIndex, totalItemCount: $totalItemCount)';
  }

}

class PhenomenalGridLayout {

  /// The layout of the grid.
  /// Each list represents a row, and each entry of that list represents 
  /// a column.
  /// The integers are used as an item key for the builder method that will
  /// build the phenomenal grid.
  /// 
  /// Integer 0 is reserved for empty space.
  /// 
  /// For example, the layout
  /// 
  /// ```dart
  /// const PhenomenalGridLayout(
  ///  layout: [
  ///   [0, 1, 1, 0],
  ///   [0, 2, 2, 3],
  ///   [4, 4, 4, 0],
  ///  ],
  ///  // where itemKey ranges from 1 to 4
  ///  builder: (context, itemKey) => Text('$itemKey'), 
  /// );
  /// ```
  /// 
  /// will lay out the widgets in the following arrangement:
  /// 
  /// ```dart
  ///   1 1
  ///   2 2 3
  /// 4 4 4
  /// ```
  /// 
  /// Please be aware that each item key must be a positive number 
  /// starting at 1.
  /// 
  /// Also note that only rectangular layouts are supported. Using
  /// the same item key in different rectangles will lead to 
  /// unexpected results.
  final List<List<int>> layout;



  /// The [ItemInfo]s of the items in the order they are rendered 
  /// including empty spaces.
  List<ItemInfo> _itemInfoRenderOrder = [];
  List<ItemInfo> get renderItems => _itemInfoRenderOrder.copy();

  /// The [ItemInfo]s of the items in the order they are counted
  /// upwards using the item key.
  /// 
  /// Note: Empty spaces are not included.
  List<OrderedItemInfo> _itemInfoOrdered = [];
  List<OrderedItemInfo> get orderedItems => _itemInfoOrdered.copy();

  PhenomenalGridLayout({
    required List<List<int>> layout,
    bool validateLayout = false,
  }) : layout = layout.copy(alsoCopyChildLists: true)
  {
    if (validateLayout)
    {
      _validateLayout();
    }

    _calculateItemInfo();

    log('PhenomenalGridLayout:');
    log('rows => $height');
    log('columns => $width');
    log('items => ${_itemInfoOrdered.length}');
    log('items (including spaces) => ${renderItems.length}');
  }

  PhenomenalGridLayout.defaultLayout() : this(
    layout: DEFAULT_LAYOUT,
  );

  void _validateLayout()
  {
    throw UnimplementedError('Will be available in future releases.');
  }

  void _calculateItemInfo()
  {
    _itemInfoRenderOrder = [];
    Set<int> indexes = {};

    for (int y = 0; y < layout.length; y++)
    {
      for (int x = 0; x < layout[y].length; x++)
      {
        int fiIndex = layout[y][x];

        if (fiIndex == 0)
        {
          _itemInfoRenderOrder.add(ItemInfo.emptySpace(x, y));
          continue;
        }

        if (!indexes.contains(fiIndex))
        {
          indexes.add(fiIndex);

          _itemInfoRenderOrder.add(ItemInfo(
            itemKey: fiIndex,
            x: x,
            y: y,
            width: _getWidthOf(x, y),
            height: _getHeightOf(x, y),
          ));
        }
      }
    }

    List<ItemInfo> itemInfoOrdered = _itemInfoRenderOrder.copy();
    itemInfoOrdered.removeWhere((element) => element.isEmptySpace);
    itemInfoOrdered.sort((a, b) => a.itemKey.compareTo(b.itemKey));

    _itemInfoOrdered = itemInfoOrdered.mapToList<OrderedItemInfo>((e, i) => OrderedItemInfo(
      itemKey: e.itemKey,
      x: e.x,
      y: e.y,
      width: e.width,
      height: e.height,
      orderIndex: i,
      totalItemCount: itemInfoOrdered.length,
    ));
  }


  int get height => layout.length;
  int get width => layout[0].length;

  int _getWidthOf(int x, int y)
  {
    int index = layout[y][x];
    int width = 1;

    for (int i = x + 1; i < layout[y].length; i++)
    {
      if (layout[y][i] != index)
      {
        return width;
      }

      width++;
    }

    return width;
  }

  int _getHeightOf(int x, int y)
  {
    int index = layout[y][x];
    int height = 1;

    for (int i = y + 1; i < layout.length; i++)
    {
      if (layout[i][x] != index)
      {
        return height;
      }
      
      height++;
    }

    return height;
  }
}