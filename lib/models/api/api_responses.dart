part of devspace;



class ApiResponse {

  final Map<String, dynamic>? data;

  const ApiResponse({
    this.data,
  });

  bool get hasData => data != null;




  static ApiResponse fromHttpResponse(int statusCode, Map<String, dynamic>? jsonPayload, String rawBody)
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
      throw ApiResponseInvalidException(
        statusCode: statusCode,
        jsonPayload: jsonPayload,
        body: rawBody,
      );
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
      throw ApiResponseInvalidException(
        statusCode: statusCode,
        jsonPayload: jsonPayload,
        body: rawBody,
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
      case 'AUTH_TOKEN_EXPIRED': throw ApiAuthException(code: kApiAuthExceptionCode.tokenExpired);
      case 'AUTH_INVALID': throw ApiAuthException(code: kApiAuthExceptionCode.invalid);
      case 'CLIENT_VERSION_INVALID': throw ApiClientVersionInvalidException();
      case 'CLIENT_VERSION_DEPRECATED': throw ApiClientVersionDeprecatedException();
      case 'CLIENT_STATE_OUTDATED': throw ApiClientStateOutdatedException();
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

  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_ApiResponseNoNetwork.tr();
}

class ApiResponseInvalidException implements Exception, UserFriendlyException {

  final String message;
  final int? statusCode;
  final Map<String, dynamic>? jsonPayload;
  final String body;
  ApiResponseInvalidException({
    this.statusCode,
    this.jsonPayload,
    required this.body,
    this.message = 'Response is invalid. The request was not successful, but no response payload was provided.'
  });

  @override
  String toString() => 'ApiResponseInvalidException: $message${statusCode == null ? '' : '\nStatus code: $statusCode'}${jsonPayload == null ? '' : '\nPayload: $jsonPayload'}\nBody: $body';

  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_ApiResponseInvalidException.tr();
}

class ApiResourceNotFoundException implements Exception, UserFriendlyException {
  
  final String message;
  ApiResourceNotFoundException([this.message = 'The requested resource was not found.']);

  @override
  String toString() => 'ApiResourceNotFoundException: $message';

  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_ApiResourceNotFoundException.tr();
}

class ApiResourceAlreadyExistsException implements Exception, UserFriendlyException {
  
  final String message;
  ApiResourceAlreadyExistsException([this.message = 'The requested resource already exists and cannot be created.']);

  @override
  String toString() => 'ApiResourceAlreadyExistsException: $message';

  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_ApiResourceAlreadyExistsException.tr();
}

class ApiNotImplementedException implements Exception, UserFriendlyException {
  
  final String message;
  ApiNotImplementedException([this.message = 'The requested operation is not implemented (yet).']);

  @override
  String toString() => 'ApiNotImplementedException: $message';

  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_ApiNotImplementedException.tr();
}

class ApiBadRequestException implements Exception, UserFriendlyException {
  
  final String message;
  ApiBadRequestException([this.message = 'The request is invalid.']);

  @override
  String toString() => 'ApiBadRequestException: $message';
  
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_ApiBadRequestException.tr();
}

class ApiForbiddenException implements Exception, UserFriendlyException {
  
  final String message;
  ApiForbiddenException([this.message = 'The request is forbidden. Make sure you have the necessary permissions.']);

  @override
  String toString() => 'ApiForbiddenException: $message';
  
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_ApiForbiddenException.tr();
}

class ApiInternalServerErrorException implements Exception, UserFriendlyException {
  
  final String message;
  ApiInternalServerErrorException([this.message = 'The server encountered an internal error.']);

  @override
  String toString() => 'ApiInternalServerErrorException: $message';
  
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_ApiInternalServerErrorException.tr();
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
  
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_ApiAuthException.tr();
}

class ApiClientVersionInvalidException implements Exception, UserFriendlyException {
  
  final String message;
  ApiClientVersionInvalidException([this.message = 'The client version is invalid.']);

  @override
  String toString() => 'ApiClientVersionInvalidException: $message';
  
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_ApiClientVersionInvalidException.tr();
}

class ApiClientVersionDeprecatedException implements Exception, UserFriendlyException {
  
  final String message;
  ApiClientVersionDeprecatedException([this.message = 'The client version is deprecated.']);

  @override
  String toString() => 'ApiClientVersionDeprecatedException: $message';
  
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_ApiClientVersionDeprecatedException.tr();
}

class ApiClientStateOutdatedException implements Exception, UserFriendlyException {
  
  final String message;
  ApiClientStateOutdatedException([this.message = 'The client state is outdated. Refresh and try again.']);

  @override
  String toString() => 'ApiClientStateOutdatedException: $message';
  
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_ApiClientStateOutdatedException.tr();
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
  
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_ApiCustomException.tr();
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
  
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_ApiZodException.tr();

}

