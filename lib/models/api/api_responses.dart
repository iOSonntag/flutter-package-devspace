part of devspace;



class ApiResponse {

  final bool success;

  const ApiResponse({
    required this.success,
  });

  bool get isSuccess => success;
  bool get isError => !success;




  static ApiResponse fromHttpResponse(int statusCode, Map<String, dynamic>? jsonPayload)
  {
    if (statusCode >= 200 && statusCode < 300)
    {
      if (jsonPayload == null)
      {
        return const ApiResponse(success: true);
      }

      if (jsonPayload['data'] != null)
      {
        return ApiResData(data: jsonPayload['data']);
      }

      Dev.logWarning('ApiResponse', 'Additional payload data is not supported yet. Ignoring.', jsonPayload);

      return const ApiResponse(success: true);
    }

    if (jsonPayload == null)
    {
      return const ApiErrorRes(
        // TODO: enumerizze keys
        errorCode: 'RESPONSE_INVALID',
        errorMessage: 'Response is invalid. The request was not successful, but no response payload was provided.',
      );
    }

    if (jsonPayload['error'] == null)
    {
      return const ApiErrorRes(
        // TODO: enumerizze keys
        errorCode: 'RESPONSE_INVALID',
        errorMessage: 'Response is invalid. The request was not successful, but no error payload was provided.',
      );
    }

    if (jsonPayload['zod'] != null)
    {
      return ApiZodErrorRes(
        zodVersion: jsonPayload['zod']['version'],
        zodIssues: (jsonPayload['zod']['issues'] as List<dynamic>).cast<ZodIssue>(),
        errorCode: jsonPayload['error']['code'],
        errorMessage: jsonPayload['error']['message'],
        errorDetails: jsonPayload['error']['details'],
      );
    }
    
    return ApiErrorRes(
      errorCode: jsonPayload['error']['code'],
      errorMessage: jsonPayload['error']['message'],
      errorDetails: jsonPayload['error']['details'],
    );
  }

}

class ApiResData<T> extends ApiResponse {

  final T data;

  const ApiResData({
    required this.data,
  }) : 
    super(success: true);

}

class ApiErrorRes extends ApiResponse {

  final String errorCode;
  final String? errorMessage;
  final dynamic errorDetails;

  const ApiErrorRes({
    required this.errorCode,
    this.errorMessage,
    this.errorDetails,
  }) : 
    super(success: false);

}

typedef ZodIssue = Map<String, dynamic>;

class ApiZodErrorRes extends ApiErrorRes {

  final String zodVersion;
  final List<ZodIssue> zodIssues;
  final List<String> _zodIssuePathes = [];
  List<String> get zodIssuePathes => _zodIssuePathes;
  final Map<String, String> _zodErrorMessages = {};
  Map<String, String> get zodErrorMessages => _zodErrorMessages;
  

  ApiZodErrorRes({
    required this.zodVersion,
    required this.zodIssues,
    required super.errorCode,
    super.errorMessage,
    super.errorDetails,
  })
  {
    final versionParts = zodVersion.split('.');

    if (versionParts.isEmpty || versionParts.first != '3')
    {
      throw Exception('Invalid Zod version: $zodVersion. Supported versions: 3.x.x');
    }

    for (final issue in zodIssues)
    {
      final message = issue['message'] as String?;

      if (message == null)
      {
        throw Exception('Zod issue message is missing');
      }

      final path = issue['path'];

      if (path == null)
      {
        throw Exception('Zod issue path is missing');
      }

      if (path is List)
      {
        for (final p in path)
        {
          if (p is String)
          {
            _addErrorMessageForPath(p, message);
            continue;
          }
          throw Exception('Zod issue path is not a string');
        }
        return;
      }

      if (path is String)
      {
        _addErrorMessageForPath(path, message);
        return;
      }

      throw Exception('Zod issue path is not a string');
    }

    if (_zodIssuePathes.isEmpty)
    {
      throw Exception('Zod issues are empty');
    }
  }

  void _addErrorMessageForPath(String path, String message)
  {
    _zodIssuePathes.add(path);
    _zodErrorMessages[path] = message;
  }


}

