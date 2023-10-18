


import 'dart:ui';

import 'package:gauge_indicator/gauge_indicator.dart';

class GaugeMeterBar {

  final GaugeProgressBar progressBar;

  const GaugeMeterBar({
    required this.progressBar,
  });


  const GaugeMeterBar.greenYellowRed() : progressBar = const GaugeProgressBar.basic(
    gradient: GaugeAxisGradient(
      colorStops: [0.0, 0.33, 0.66, 1.0],
      colors: [
        Color(0xFF05e895), 
        Color(0xFFbbe805), 
        Color(0xFFe87e05),
        Color(0xFFe82b05),

      ]),
    placement: GaugeProgressPlacement.inside,
  );

}