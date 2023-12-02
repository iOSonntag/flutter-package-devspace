


part of devspace;

extension ColorExtension on Color {

  // external static Color d(String hex);


  Color brighten(double amount)
  {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLighter = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLighter.toColor();
  }

  Color darken(double amount)
  {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDarker = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDarker.toColor();
  }

  Gradient toLightGradient()
  {
    // TODO: add theming option to adjust angle
    return LinearGradient(
      begin: const Alignment(-1.0, -1.0),
      end: const Alignment(-0.95, 1.0),
      colors: [
        brighten(0.07),
        brighten(0.05),
        this,
        darken(0.05),
        darken(0.07),
      ],
    );
  }
}
