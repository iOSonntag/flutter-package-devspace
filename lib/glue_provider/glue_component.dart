

part of devspace;

abstract class GlueComponent extends ChangeNotifier {

  void updateUI()
  {
    notifyListeners();
  }

  bool _mounted = true;
  bool get mounted => _mounted;

  @override
  @mustCallSuper
  void dispose()
  {
    _mounted = false;

    super.dispose();
  }

  @override
  @mustCallSuper
  void notifyListeners()
  {
    if (_mounted)
    {
      super.notifyListeners();
    }
  }
}