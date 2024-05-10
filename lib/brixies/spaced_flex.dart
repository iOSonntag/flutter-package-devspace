
// ignore_for_file: non_constant_identifier_names

part of devspace;

enum MainAxisSpacing
{
  evenly,
  between,
  betweenAndEnd,
  betweenAndStart,
  around,
}

enum CrossAxisSpacing
{
  none,
  around,
}

class SpacedRow extends SpacedFlex {
  
  const SpacedRow({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.spacing,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, 
    super.children,
  }) : super(
    direction: Axis.horizontal,
  );

  const SpacedRow.XXS({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, 
    super.children,
  }) : super(
    direction: Axis.horizontal,
    spacing: -996.0,
  );

  const SpacedRow.XS({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, 
    super.children,
  }) : super(
    direction: Axis.horizontal,
    spacing: -995.0,
  );

  const SpacedRow.S({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, 
    super.children,
  }) : super(
    direction: Axis.horizontal,
    spacing: -994.0,
  );

  const SpacedRow.M({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, 
    super.children,
  }) : super(
    direction: Axis.horizontal,
    spacing: -993.0,
  );

  const SpacedRow.L({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, 
    super.children,
  }) : super(
    direction: Axis.horizontal,
    spacing: -992.0,
  );

  const SpacedRow.XL({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, 
    super.children,
  }) : super(
    direction: Axis.horizontal,
    spacing: -991.0,
  );

  const SpacedRow.XXL({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, 
    super.children,
  }) : super(
    direction: Axis.horizontal,
    spacing: -990.0,
  );

  @override
  double _spaceValue(BuildContext context)
  {
    switch (spacing)
    {
      case -996.0:
        return context.dimensions.spaceXXSValue;
      case -995.0:
        return context.dimensions.spaceXSValue;
      case -994.0:
        return context.dimensions.spaceSValue;
      case -993.0:
        return context.dimensions.spaceMValue;
      case -992.0:
        return context.dimensions.spaceLValue;
      case -991.0:
        return context.dimensions.spaceXLValue;
      case -990.0:
        return context.dimensions.spaceXXLValue;
      default:
        return spacing ?? context.dimensions.spaceMValue;
    }
  }


}

class SpacedColumn extends SpacedFlex {
  
  const SpacedColumn({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.spacing,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, 
    super.children,
  }) : super(
    direction: Axis.vertical,
  );

  const SpacedColumn.XXS({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, 
    super.children,
  }) : super(
    direction: Axis.vertical,
    spacing: -996.0,
  );

  const SpacedColumn.XS({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, 
    super.children,
  }) : super(
    direction: Axis.vertical,
    spacing: -995.0,
  );

  const SpacedColumn.S({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.children,
  }) : super(
    direction: Axis.vertical,
    spacing: -994.0,
  );

  const SpacedColumn.M({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.children,
  }) : super(
    direction: Axis.vertical,
    spacing: -993.0,
  );

  const SpacedColumn.L({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.children,
  }) : super(
    direction: Axis.vertical,
    spacing: -992.0,
  );

  const SpacedColumn.XL({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.children,
  }) : super(
    direction: Axis.vertical,
    spacing: -991.0,
  );

  const SpacedColumn.XXL({
    super.key,
    super.mainAxisSpacing = MainAxisSpacing.evenly,
    super.crossAxisSpacing = CrossAxisSpacing.around,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.children,
  }) : super(
    direction: Axis.vertical,
    spacing: -990.0,
  );

  @override
  double _spaceValue(BuildContext context)
  {
    switch (spacing)
    {
      case -996.0:
        return context.dimensions.spaceXXSValue;
      case -995.0:
        return context.dimensions.spaceXSValue;
      case -994.0:
        return context.dimensions.spaceSValue;
      case -993.0:
        return context.dimensions.spaceMValue;
      case -992.0:
        return context.dimensions.spaceLValue;
      case -991.0:
        return context.dimensions.spaceXLValue;
      case -990.0:
        return context.dimensions.spaceXXLValue;
      default:
        return spacing ?? context.dimensions.spaceMValue;
    }
  }
}



class SpacedFlex extends StatelessWidget {

  final MainAxisSpacing mainAxisSpacing;
  final CrossAxisSpacing crossAxisSpacing;
  final double? spacing;
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final ui.TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Clip clipBehavior;
  final List<Widget> children;

  const SpacedFlex({
    super.key,
    required this.direction,
    this.mainAxisSpacing = MainAxisSpacing.evenly,
    this.crossAxisSpacing = CrossAxisSpacing.around,
    this.spacing,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
    this.clipBehavior = Clip.none,
    this.children = const <Widget>[],
  });

  @override
  Widget build(BuildContext context)
  {
    double spaceValue = _spaceValue(context);

    return Flex(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      children: _buildChildren(context, spaceValue),
    );
  }

  List<Widget> _buildChildren(BuildContext context, double spaceValue)
  {
    final List<Widget> list = [];

    for (int i = 0; i < children.length; i++)
    {
      list.add(_buildChild(context, spaceValue, children[i], i == 0, i == children.length - 1));
    }

    return list;
  }

  Widget _buildChild(BuildContext context, double spaceValue, Widget child, bool isFirst, bool isLast)
  {
    double mainAxisPaddingStart = _getMainAxisPaddingStart(context, spaceValue, isFirst, isLast);
    double mainAxisPaddingEnd = _getMainAxisPaddingEnd(context, spaceValue, isFirst, isLast);
    double crossAxisPadding = crossAxisSpacing == CrossAxisSpacing.around ? spaceValue : 0;

    int? expanded;
    FlexFit? fit;

    if (child is Expanded)
    {
      expanded = child.flex;
      fit = child.fit;
      child = child.child;
    }
    else if (child is Flexible)
    {
      expanded = child.flex;
      fit = child.fit;
      child = child.child;
    }

    child = Padding(
      padding: EdgeInsets.only(
        top: direction == Axis.vertical ? mainAxisPaddingStart : crossAxisPadding,
        bottom: direction == Axis.vertical ? mainAxisPaddingEnd : crossAxisPadding,
        left: direction == Axis.horizontal ? mainAxisPaddingStart : crossAxisPadding,
        right: direction == Axis.horizontal ? mainAxisPaddingEnd : crossAxisPadding,
      ),
      child: child,
    );

    if (expanded != null)
    {
      child = Flexible(
        flex: expanded,
        fit: fit ?? FlexFit.tight,
        child: child,
      );
    }

    return child;
  }

  double _getMainAxisPaddingStart(BuildContext context, double spaceValue, bool isFirst, bool isLast)
  {
    switch (mainAxisSpacing)
    {
      case MainAxisSpacing.evenly:
        return isFirst ? spaceValue : spaceValue / 2;
      case MainAxisSpacing.between:
        return isFirst ? 0 : spaceValue / 2;
      case MainAxisSpacing.betweenAndEnd:
        return isFirst ? 0 : spaceValue / 2;
      case MainAxisSpacing.betweenAndStart:
        return isFirst ? spaceValue : spaceValue / 2;
      case MainAxisSpacing.around:
        return isFirst ? spaceValue : 0;
    }
  }

  double _getMainAxisPaddingEnd(BuildContext context, double spaceValue, bool isFirst, bool isLast)
  {
    switch (mainAxisSpacing)
    {
      case MainAxisSpacing.evenly:
        return isLast ? spaceValue : spaceValue / 2;
      case MainAxisSpacing.between:
        return isLast ? 0 : spaceValue / 2;
      case MainAxisSpacing.betweenAndEnd:
        return isLast ? spaceValue : spaceValue / 2;
      case MainAxisSpacing.betweenAndStart:
        return isLast ? 0 : spaceValue / 2;
      case MainAxisSpacing.around:
        return isLast ? spaceValue : 0;
    }
  }

  double _spaceValue(BuildContext context)
  {
    return spacing ?? context.dimensions.spaceMValue;
  }
}