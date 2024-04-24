part of devspace;


abstract class GlueResponse
{
  bool get isSuccess;
  bool get isError => !isSuccess;
  String? get errorLocalized;

  static GlueResponse success() => GlueResponseSimple(isSuccess: true);
  static GlueResponseData<T> successWithData<T>(T data) => GlueResponseData(isSuccess: true, data: data);

  /// Make sure to provide a localized error message.
  static GlueResponse error(String errorLocalized) => GlueResponseSimple(isSuccess: false, errorLocalized: errorLocalized);

  static GlueResponse errorUnknown() => GlueResponseSimple(isSuccess: false, errorLocalized: LibStrings.lib_error_unknown.tr());
}

class GlueResponseSimple extends GlueResponse
{
  final bool _isSuccess;
  final String? _errorLocalized;

  GlueResponseSimple({
    required bool isSuccess,
    String? errorLocalized,
  })
  : _isSuccess = isSuccess,
    _errorLocalized = errorLocalized,
    assert(isSuccess || errorLocalized != null);

  @override
  bool get isSuccess => _isSuccess;

  @override
  String? get errorLocalized => _errorLocalized;
}


class GlueResponseData<T> extends GlueResponse
{
  final bool _isSuccess;
  final String? _errorLocalized;
  final T data;

  GlueResponseData({
    required bool isSuccess,
    required this.data,
    String? errorLocalized,
  })
  : _isSuccess = isSuccess,
    _errorLocalized = errorLocalized,
    assert(isSuccess || errorLocalized != null);

  @override
  bool get isSuccess => _isSuccess;

  @override
  String? get errorLocalized => _errorLocalized;
}