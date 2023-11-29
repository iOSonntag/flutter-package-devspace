part of devspace;



extension ExtensionOnBorderRadius on BorderRadius {


  BorderRadius insetBy(double value) => BorderRadius.only(
    topLeft: Radius.circular(topLeft.x - value),
    topRight: Radius.circular(topRight.x - value),
    bottomLeft: Radius.circular(bottomLeft.x - value),
    bottomRight: Radius.circular(bottomRight.x - value),
  );

}