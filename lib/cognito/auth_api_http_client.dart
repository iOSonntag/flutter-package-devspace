

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
typedef GetDefaultHeaders = Future<Map<String, String>> Function();
typedef CreateResponseObject<T> = T Function(int statusCode, Map<String, dynamic>? jsonPayload);

class UserNotAuthorizedException implements Exception {
  final dynamic message;

  UserNotAuthorizedException({
    this.message = 'User is not authorized',
  });

}

class AuthApiHttpClient<TResponse> {

  final GetBaseUrl onGetBaseUrl;
  final GetAuthToken onGetAuthToken;
  final CreateResponseObject<TResponse> onCreateResponse;
  final GetDefaultHeaders? onGetDefaultHeaders;

  AuthApiHttpClient({
    required this.onGetBaseUrl,
    required this.onGetAuthToken,
    required this.onCreateResponse,
    this.onGetDefaultHeaders,
  });

  Future<TResponse> post({
    required String apiPath,
    required Map<String, dynamic> body,
    Map<String, String> additionaHeaders = const {},
    bool preventPayloadLogging = false,
    kAuthRequirement authRequirement = kAuthRequirement.required,
  }) async
  {
    return makeRequest(
      apiPath: apiPath,
      body: body,
      additionaHeaders: additionaHeaders,
      authRequirement: authRequirement,
      preventPayloadLogging: preventPayloadLogging,
      method: kHttpMethod.post,
    );
  }

  Future<TResponse> get({
    required String apiPath,
    Map<String, String> queryParameters = const {},
    Map<String, String> additionaHeaders = const {},
    bool preventPayloadLogging = false,
    kAuthRequirement authRequirement = kAuthRequirement.required,
  }) async
  {
    return makeRequest(
      apiPath: apiPath,
      body: null,
      queryParameters: queryParameters,
      additionaHeaders: additionaHeaders,
      authRequirement: authRequirement,
      preventPayloadLogging: preventPayloadLogging,
      method: kHttpMethod.get,
    );
  }

  Future<TResponse> put({
    required String apiPath,
    required Map<String, dynamic> body,
    Map<String, String> additionaHeaders = const {},
    bool preventPayloadLogging = false,
    kAuthRequirement authRequirement = kAuthRequirement.required,
  }) async
  {
    return makeRequest(
      apiPath: apiPath,
      body: body,
      additionaHeaders: additionaHeaders,
      authRequirement: authRequirement,
      preventPayloadLogging: preventPayloadLogging,
      method: kHttpMethod.put,
    );
  }

  Future<TResponse> delete({
    required String apiPath,
    required Map<String, dynamic> body,
    Map<String, String> additionaHeaders = const {},
    bool preventPayloadLogging = false,
    kAuthRequirement authRequirement = kAuthRequirement.required,
  }) async
  {
    return makeRequest(
      apiPath: apiPath,
      body: body,
      additionaHeaders: additionaHeaders,
      authRequirement: authRequirement,
      preventPayloadLogging: preventPayloadLogging,
      method: kHttpMethod.delete,
    );
  }





  Future<TResponse> makeRequest({
    required String apiPath,
    required Map<String, dynamic>? body,
    Map<String, String> queryParameters = const {},
    Map<String, String> additionaHeaders = const {},
    bool preventPayloadLogging = false,
    kAuthRequirement authRequirement = kAuthRequirement.required,
    required kHttpMethod method,
  }) async
  {
    if (preventPayloadLogging)
    {
      Dev.log(this, '$method to $apiPath');
    }
    else
    {
      Dev.log(this, '$method to $apiPath', body);
    }

    http.Response? response;
    Map<String, dynamic>? jsonResponse;

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

      String urlPostFix = '';

      if (queryParameters.isNotEmpty)
      {
        String queryString = Uri(queryParameters: queryParameters).query;
        urlPostFix = '?$queryString';
      }

      final uri = Uri.parse(finalUrl + urlPostFix);


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

      jsonResponse = response.body.isNotEmpty && response.headers['content-type']?.contains('application/json') == true
        ? json.decode(response.body)
        : null;

    }
    catch (e)
    {
      Dev.logException(this, e, 'Failed $method to $apiPath');

      if (e is UserNotAuthorizedException)
      {
        return onCreateResponse(401, null);
      }

      return onCreateResponse(500, null);
    }

    return onCreateResponse(response.statusCode, jsonResponse);
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

    if (onGetDefaultHeaders != null)
    {
      headers.addAll(await onGetDefaultHeaders!());
    }

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