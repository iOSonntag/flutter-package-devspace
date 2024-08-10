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

    if (jsonPayload['error']['code'] == null)
    {
      throw ApiResponseInvalidException();
    }
    
    switch (jsonPayload['error']['code'])
    {
      case 'RESOURCE_NOT_FOUND': throw ApiResourceNotFoundException();
      case 'RESOURCE_ALREADY_EXISTS': throw ApiResourceAlreadyExistsException();
      case 'NOT_IMPLEMENTED': throw ApiNotImplementedException();
      case 'BAD_REQUEST': throw ApiBadRequestException();
      case 'FORBIDDEN': throw ApiForbiddenException();
      case 'INTERNAL_SERVER_ERROR': throw ApiInternalServerErrorException();
      case 'AUTH_TOKEN_EXPIRED': throw ApiAuthException(code: kApiAuthExceptionCode.tokenExpired);
      case 'AUTH_INVALID': throw ApiAuthException(code: kApiAuthExceptionCode.invalid);
      case 'CLIENT_VERSION_INVALID': throw ApiClientVersionInvalidException();
      case 'CLIENT_VERSION_DEPRECATED': throw ApiClientVersionDeprecatedException();
      default:
        throw ApiCustomException(
          code: jsonPayload['error']['code'],
          details: jsonPayload['error']['details']
        );
    }
  }
}

class ApiResponseNoNetwork implements Exception, UserFriendlyException {

  final String message;
  ApiResponseNoNetwork([this.message = 'No network available. Please check your internet connection.']);

  @override
  String toString() => 'ApiResponseNoNetwork: $message';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : 'No network available. Please check your internet connection.';
}

class ApiResponseInvalidException implements Exception, UserFriendlyException {

  final String message;
  ApiResponseInvalidException([this.message = 'Response is invalid. The request was not successful, but no response payload was provided.']);

  @override
  String toString() => 'ApiResponseInvalidException: $message';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : 'Response is invalid. The request was not successful, but no response payload was provided.';
}

class ApiResourceNotFoundException implements Exception, UserFriendlyException {
  
  final String message;
  ApiResourceNotFoundException([this.message = 'The requested resource was not found.']);

  @override
  String toString() => 'ApiResourceNotFoundException: $message';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : 'The requested resource was not found.';
}

class ApiResourceAlreadyExistsException implements Exception, UserFriendlyException {
  
  final String message;
  ApiResourceAlreadyExistsException([this.message = 'The requested resource already exists and cannot be created.']);

  @override
  String toString() => 'ApiResourceAlreadyExistsException: $message';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : 'The requested resource already exists and cannot be created.';
}

class ApiNotImplementedException implements Exception, UserFriendlyException {
  
  final String message;
  ApiNotImplementedException([this.message = 'The requested operation is not implemented (yet).']);

  @override
  String toString() => 'ApiNotImplementedException: $message';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : 'The requested operation is not implemented (yet).';
}

class ApiBadRequestException implements Exception, UserFriendlyException {
  
  final String message;
  ApiBadRequestException([this.message = 'The request is invalid.']);

  @override
  String toString() => 'ApiBadRequestException: $message';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : 'The request is invalid.';
}

class ApiForbiddenException implements Exception, UserFriendlyException {
  
  final String message;
  ApiForbiddenException([this.message = 'The request is forbidden. Make sure you have the necessary permissions.']);

  @override
  String toString() => 'ApiForbiddenException: $message';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : 'The request is forbidden. Make sure you have the necessary permissions.';
}

class ApiInternalServerErrorException implements Exception, UserFriendlyException {
  
  final String message;
  ApiInternalServerErrorException([this.message = 'The server encountered an internal error.']);

  @override
  String toString() => 'ApiInternalServerErrorException: $message';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : 'The server encountered an internal error.';
}

// ignore: camel_case_types
enum kApiAuthExceptionCode
{
  tokenExpired,
  invalid,
}

class ApiAuthException implements Exception, UserFriendlyException {
  
  final String message;
  final kApiAuthExceptionCode code;

  ApiAuthException({
    this.message = 'The authentification is invalid or the authentification token expired.',
    required this.code,
  });

  @override
  String toString() => 'ApiAuthException: $message ($code)';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : 'The authentification is invalid or the authentification token expired.';
}

class ApiClientVersionInvalidException implements Exception, UserFriendlyException {
  
  final String message;
  ApiClientVersionInvalidException([this.message = 'The client version is invalid.']);

  @override
  String toString() => 'ApiClientVersionInvalidException: $message';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : 'The client version is invalid.';
}

class ApiClientVersionDeprecatedException implements Exception, UserFriendlyException {
  
  final String message;
  ApiClientVersionDeprecatedException([this.message = 'The client version is deprecated.']);

  @override
  String toString() => 'ApiClientVersionDeprecatedException: $message';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : 'The client version is deprecated. Please update your application.';
}


class ApiCustomException implements Exception, UserFriendlyException {
  
  final String message;
  final String code;
  final Map<String, dynamic>? details;

  ApiCustomException({
    this.message = 'A custom api response exception.',
    required this.code,
    required this.details,
  });

  @override
  String toString() => 'ApiCustomException: $message ($code) - details: $details';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : 'An unexpected error occured.';
}




typedef ZodIssue = Map<String, dynamic>;

class ApiZodException implements Exception, UserFriendlyException {

  final String message;

  final String zodVersion;
  final List<ZodIssue> zodIssues;
  final List<String> _zodIssuePathes = [];
  List<String> get zodIssuePathes => _zodIssuePathes;
  final Map<String, String> _zodErrorMessages = {};
  Map<String, String> get zodErrorMessages => _zodErrorMessages;
  

  ApiZodException({
    this.message = 'Invalid data. Zod issues.',
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
  String toString() => 'ApiZodException: $message. Zod issues: $zodIssues';
  // TODO: use localized strings
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : 'The input provided is incorrect.';

}

