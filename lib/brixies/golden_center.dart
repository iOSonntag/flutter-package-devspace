

part of devspace;


class GoldenCenter extends StatelessWidget {

  final kDirection direction;
  final Widget child;

  const GoldenCenter({
    super.key,
    required this.direction,
    required this.child,
  });

  const GoldenCenter.top({
    super.key,
    required this.child,
  }) : direction = kDirection.top;

  const GoldenCenter.right({
    super.key,
    required this.child,
  }) : direction = kDirection.right;

  const GoldenCenter.bottom({
    super.key,
    required this.child,
  }) : direction = kDirection.bottom;

  const GoldenCenter.left({
    super.key,
    required this.child,
  }) : direction = kDirection.left;

  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Align(
        alignment: _buildAlignment(context),
        child: child, 
      ),
    );
  }

  Alignment _buildAlignment(BuildContext context)
  {
    return switch (direction)
    {
      kDirection.top => const Alignment(0.0, -0.618),
      kDirection.right => const Alignment(0.618, 0.0),
      kDirection.bottom => const Alignment(0.0, 0.618),
      kDirection.left => const Alignment(-0.618, 0.0),
    };
  }

}