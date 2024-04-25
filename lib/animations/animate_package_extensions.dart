part of devspace;

extension ExtensionAnimatePackageOnWidget on Widget {

  Animate glassShimmer({
    bool show = true,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 2000),
  })
  {
    return animate(
      target: show.thenEither(1.0, 0.0)
    ).shimmer(
      size: 0.3,
      colors: [
        Colors.white.withOpacity(0.0),
        Colors.white.withOpacity(0.2),
        Colors.white.withOpacity(0.0),
      ],
      stops: [
        0.0,
        0.99,
        1.0,
      ],
      angle: -45.toRadian(),
      delay: delay,
      duration: duration,
      curve: Curves.easeInOut,
      padding: 0.0,
    )
    .shimmer(
      size: 0.2,
      color: Colors.white.withOpacity(0.1),
      angle: -45.toRadian(),
      delay: duration * 0.2 + delay,
      duration: duration * 0.6,
      curve: Curves.easeInOut,
      stops: [
        0.0,
        0.99,
        1.0,
      ],
      padding: 0.0,
    )
    .shimmer(
      size: 0.1,
      color: Colors.white.withOpacity(0.1),
      angle: -45.toRadian(),
      delay: duration * 0.3 + delay,
      duration: duration * 0.4,
      curve: Curves.easeInOut,
      stops: [
        0.0,
        0.99,
        1.0,
      ],
      padding: 0.0,
    );
  }


}

