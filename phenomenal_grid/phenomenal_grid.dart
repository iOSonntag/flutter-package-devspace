


import 'package:flutter/material.dart';
import 'package:iosite/_packages/flutter_spice_powder/common_data_types_powder/list.dart';
import 'package:iosite/_packages/phenomenal_grid/phenomenal_grid_layout.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// A builder for the phenomenal grid.
/// 
/// Since the int value of 0 is reserved for empty spaces in the grid. This
/// builder will never be called with an itemKey of 0.
typedef PhenomenalGridItemBuilder = Widget Function(BuildContext context, ItemInfo itemInfo);

class PhenomenalGrid extends StatelessWidget {

  final PhenomenalGridLayout layout;
  final PhenomenalGridItemBuilder buildItem;

  PhenomenalGrid({
    super.key,
    PhenomenalGridLayout? layout,
    required this.buildItem,
  }) : layout = layout ?? PhenomenalGridLayout.defaultLayout();

  @override
  Widget build(BuildContext context)
  {
    return StaggeredGrid.count(
      crossAxisCount: layout.width,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: _buildChildren(context)
    );
  }
    
  List<Widget> _buildChildren(BuildContext context)
  {
    return layout.renderItems.mapToList((e, i)
    { 
      if (e.isEmptySpace)
      {
        return const StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: SizedBox(),
        );
      }

      return StaggeredGridTile.count(
        crossAxisCellCount: e.width,
        mainAxisCellCount: e.height,
        child: buildItem(context, e),
      );
    });
  }
}