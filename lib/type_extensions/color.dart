


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
}
