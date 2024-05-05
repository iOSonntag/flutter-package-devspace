part of devspace;



class ApiResponse {

  final Map<String, dynamic>? data;

  const ApiResponse({
    this.data,
  });

  bool get hasData => data != null;




  static ApiResponse fromHttpResponse(int statusCode, Map<String, dynamic>? jsonPayload)
  {
    if (statusCode >= 200 && statusCode < 300)
    {
      if (jsonPayload == null)
      {
        return const ApiResponse();
      }

      if (jsonPayload['data'] != null)
      {
        return ApiResponse(data: jsonPayload['data']);
      }

      Dev.logWarning('ApiResponse', 'Additional payload data is not supported yet. Ignoring.', jsonPayload);

      return const ApiResponse();
    }

    if (jsonPayload == null || jsonPayload['error'] == null)
    {
      throw ApiResponseInvalidException();
    }

    if (jsonPayload['zod'] != null)
    {
      throw ApiZodException(
        zodVersion: jsonPayload['zod']['version'],
        zodIssues: (jsonPayload['zod']['issues'] as List<dynamic>).cast<ZodIssue>(),
      );
    }
    
    switch (jsonPayload['error']['code'])
    {
      case 'RESOURCE_NOT_FOUND': throw ApiResourceNotFoundException();
      case 'RESOURCE_ALREADY_EXISTS': throw ApiResourceAlreadyExistsException();
      case 'NOT_IMPLEMENTED': throw ApiNotImplementedException();
      case 'BAD_REQUEST': throw ApiBadRequestException();
      case 'FORBIDDEN': throw ApiForbiddenException();
      case 'INTERNAL_SERVER_ERROR': throw ApiInternalServerErrorException();
      default:
        throw LibraryIssueError('Unknown error code: ${jsonPayload['error']['code']}');
    }
  }
}

class ApiResponseInvalidException implements Exception, UserFriendlyException {
  @override
  String toString() => 'ApiResponseInvalidException: Response is invalid. The request was not successful, but no response payload was provided.';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage() => 'Response is invalid. The request was not successful, but no response payload was provided.';
}

class ApiResourceNotFoundException implements Exception, UserFriendlyException {
  
  @override
  String toString() => 'ApiResourceNotFoundException: The requested resource was not found.';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage() => 'The requested resource was not found.';
}

class ApiResourceAlreadyExistsException implements Exception, UserFriendlyException {
  
  @override
  String toString() => 'ApiResourceAlreadyExistsException: The requested resource already exists and cannot be created.';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage() => 'The requested resource already exists and cannot be created.';
}

class ApiNotImplementedException implements Exception, UserFriendlyException {
  
  @override
  String toString() => 'ApiNotImplementedException: The requested operation is not implemented (yet).';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage() => 'The requested operation is not implemented (yet).';
}

class ApiBadRequestException implements Exception, UserFriendlyException {
  
  @override
  String toString() => 'ApiBadRequestException: The request is invalid.';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage() => 'The request is invalid.';
}

class ApiForbiddenException implements Exception, UserFriendlyException {
  
  @override
  String toString() => 'ApiForbiddenException: The request is forbidden. Make sure you have the necessary permissions.';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage() => 'The request is forbidden. Make sure you have the necessary permissions.';
}

class ApiInternalServerErrorException implements Exception, UserFriendlyException {
  
  @override
  String toString() => 'ApiInternalServerErrorException: The server encountered an internal error.';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage() => 'The server encountered an internal error.';
}





typedef ZodIssue = Map<String, dynamic>;

class ApiZodException implements Exception, UserFriendlyException {

  final String zodVersion;
  final List<ZodIssue> zodIssues;
  final List<String> _zodIssuePathes = [];
  List<String> get zodIssuePathes => _zodIssuePathes;
  final Map<String, String> _zodErrorMessages = {};
  Map<String, String> get zodErrorMessages => _zodErrorMessages;
  

  ApiZodException({
    required this.zodVersion,
    required this.zodIssues,
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
        continue;
      }

      if (path is String)
      {
        _addErrorMessageForPath(path, message);
        continue;
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


  @override
  String toString() => 'ApiZodException: Invalid data. Zod issues: $zodIssues';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage() => 'The input provided is incorrect.';

}

