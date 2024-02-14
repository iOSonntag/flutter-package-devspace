
part of devspace;


extension ExtensionOnWidget on Widget {

  Widget expand([int flex = 1]) => Expanded(
    flex: flex,
    child: this
  );

}