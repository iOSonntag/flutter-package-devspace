

part of devspace;

typedef GlueResponseCallback<T extends GlueResponse> = Future<T> Function();

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

  Future<GlueResponse> eraseExceptions<T extends GlueResponse>(GlueResponseCallback<T> callback) async
  {
    try
    {
      return await callback();
    }
    on Exception catch (e)
    {
      Dev.logException(this, e, 'eraseExceptions');
      return GlueResponse.errorUnknown();
    }
    on Error catch (e)
    {
      Dev.logError(this, e.toString(), 'eraseExceptions');
      return GlueResponse.errorUnknown();
    }
  }
}