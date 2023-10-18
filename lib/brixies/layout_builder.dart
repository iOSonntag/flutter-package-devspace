

part of devspace;


class GetHeight extends StatelessWidget {

  final Widget Function(BuildContext context, double minHeight, double maxHeight) builder;

  const GetHeight({
    super.key,
    required this.builder
  });

  @override
  Widget build(BuildContext context)
  {
    return LayoutBuilder(
      builder: (context, constraint)
      {
        return builder(context, constraint.minHeight, constraint.maxHeight);
      }
    );
  }
}

class GetWidth extends StatelessWidget {

  final Widget Function(BuildContext context, double minWidth, double maxWidth) builder;

  const GetWidth({
    super.key,
    required this.builder
  });

  @override
  Widget build(BuildContext context)
  {
    return LayoutBuilder(
      builder: (context, constraint)
      {
        return builder(context, constraint.minWidth, constraint.maxWidth);
      }
    );
  }
}


