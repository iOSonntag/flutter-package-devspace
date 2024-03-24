

part of devspace;

// ignore: camel_case_types
enum kAuthRequirement
{
  none,
  required,
  optional,
}

// ignore: camel_case_types
enum kHttpMethod
{
  get,
  post,
  put,
  delete,
}

class HttpStatusCodeInterpreter {

  final int statusCode;

  HttpStatusCodeInterpreter({
    required this.statusCode,
  });

  bool get isSuccess => statusCode >= 200 && statusCode < 300;
  bool get isUnauthorized => statusCode == 401;


}

class AuthApiResponse extends HttpStatusCodeInterpreter {

  final Map<String, dynamic>? body;

  AuthApiResponse({
    required int statusCode,
    required this.body,
  }) : super(statusCode: statusCode);

  bool get hasBody => body != null;

}


typedef GetAuthToken = Future<String?> Function();
typedef GetBaseUrl = Future<String> Function();

class UserNotAuthorizedException implements Exception {
  final dynamic message;

  UserNotAuthorizedException({
    this.message = 'User is not authorized',
  });

}

class AuthApiHttpClient {

  final GetBaseUrl onGetBaseUrl;
  final GetAuthToken onGetAuthToken;

  AuthApiHttpClient({
    required this.onGetBaseUrl,
    required this.onGetAuthToken,
  });

  Future<AuthApiResponse> post({
    required String apiPath,
    required Map<String, dynamic> body,
    Map<String, String> additionaHeaders = const {},
    kAuthRequirement authRequirement = kAuthRequirement.required,
  }) async
  {
    return makeRequest(
      apiPath: apiPath,
      body: body,
      additionaHeaders: additionaHeaders,
      authRequirement: authRequirement,
      method: kHttpMethod.post,
    );
  }

  Future<AuthApiResponse> get({
    required String apiPath,
    Map<String, String> additionaHeaders = const {},
    kAuthRequirement authRequirement = kAuthRequirement.required,
  }) async
  {
    return makeRequest(
      apiPath: apiPath,
      body: null,
      additionaHeaders: additionaHeaders,
      authRequirement: authRequirement,
      method: kHttpMethod.get,
    );
  }

  Future<AuthApiResponse> put({
    required String apiPath,
    required Map<String, dynamic> body,
    Map<String, String> additionaHeaders = const {},
    kAuthRequirement authRequirement = kAuthRequirement.required,
  }) async
  {
    return makeRequest(
      apiPath: apiPath,
      body: body,
      additionaHeaders: additionaHeaders,
      authRequirement: authRequirement,
      method: kHttpMethod.put,
    );
  }

  Future<AuthApiResponse> delete({
    required String apiPath,
    required Map<String, dynamic> body,
    Map<String, String> additionaHeaders = const {},
    kAuthRequirement authRequirement = kAuthRequirement.required,
  }) async
  {
    return makeRequest(
      apiPath: apiPath,
      body: body,
      additionaHeaders: additionaHeaders,
      authRequirement: authRequirement,
      method: kHttpMethod.delete,
    );
  }





  Future<AuthApiResponse> makeRequest({
    required String apiPath,
    required Map<String, dynamic>? body,
    Map<String, String> additionaHeaders = const {},
    kAuthRequirement authRequirement = kAuthRequirement.required,
    required kHttpMethod method,
  }) async
  {
    Dev.log(this, '$method to $apiPath', body);

    try
    {
      Map<String, String> headers = await createHeaders(
        additionalHeaders: additionaHeaders, 
        authRequirement: authRequirement
      );

      final baseUrl = await onGetBaseUrl();

      String? jsonBody = body != null ? json.encode(body) : null;

      if (apiPath.startsWith('/'))
      {
        apiPath = apiPath.substring(1);
      }

      final finalUrl = path.join(baseUrl, apiPath);
      final uri = Uri.parse(finalUrl);

      http.Response? response;

      switch (method)
      {
        case kHttpMethod.get:
          response = await http.get(
            uri,
            headers: headers,
          );
          break;
        case kHttpMethod.post:
          response = await http.post(
            uri,
            headers: headers,
            body: jsonBody,
          );
          break;
        case kHttpMethod.put:
          response = await http.put(
            uri,
            headers: headers,
            body: jsonBody,
          );
          break;
        case kHttpMethod.delete:
          response = await http.delete(
            uri,
            headers: headers,
            body: jsonBody,
          );
          break;
      }

      if (response.statusCode >= 200 && response.statusCode < 300)
      {
        final jsonResponse = response.body.isNotEmpty && response.headers['content-type']?.contains('application/json') == true
          ? json.decode(response.body)
          : null;
        
        return AuthApiResponse(
          statusCode: response.statusCode,
          body: jsonResponse,
        );
      }
      else
      {
        Dev.logError(this, 'Request failed with status: ${response.statusCode}.', response);
        
        return AuthApiResponse(
          statusCode: response.statusCode,
          body: null,
        );
      }
    }
    catch (e)
    {
      Dev.logException(this, e, 'Failed $method to $apiPath');

      if (e is UserNotAuthorizedException)
      {
        return AuthApiResponse(
          statusCode: 401,
          body: null,
        );
      }
      
      return AuthApiResponse(
        statusCode: 500,
        body: null,
      );
    }
  }









  Future<Map<String, String>> createHeaders({
    required Map<String, String> additionalHeaders,
    required kAuthRequirement authRequirement,
  }) async
  {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    headers.addAll(additionalHeaders);

    if (authRequirement != kAuthRequirement.none)
    {
      final token = await onGetAuthToken();

      if (token == null)
      {
        if (authRequirement == kAuthRequirement.required)
        {
          throw UserNotAuthorizedException();
        }
      }
      else
      {
        headers['Authorization'] = 'Bearer $token';
      }
    }


    return headers;
  }

}