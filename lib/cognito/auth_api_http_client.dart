

part of devspace;

// ignore: camel_case_types
enum kAuthRequirement
{
  none,
  required,
  optional,
}

// ignore: camel_case_types
enum kAuthErrorResolving
{
  cancelWithRethrow,
  retry,
}

// ignore: camel_case_types
enum kAuthError
{
  invalid,
  expired,
  signedOut,
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
typedef CreateResponseObject<T> = T Function(int statusCode, Map<String, dynamic>? jsonPayload, String rawBody);
typedef AuthError = Future<kAuthErrorResolving> Function(kAuthError error, kAuthRequirement authRequirement);

class AuthApiHttpClient<TResponse> {

  final GetBaseUrl onGetBaseUrl;
  final GetAuthToken onGetAuthToken;
  final CreateResponseObject<TResponse> onCreateResponse;
  final GetDefaultHeaders? onGetDefaultHeaders;
  final AuthError onAuthError;

  AuthApiHttpClient({
    required this.onGetBaseUrl,
    required this.onGetAuthToken,
    required this.onCreateResponse,
    required this.onAuthError,
    this.onGetDefaultHeaders,
  });

  Future<TResponse> post({
    required String apiPath,
    required Map<String, dynamic> body,
    Map<String, String> additionaHeaders = const {},
    bool preventPayloadLogging = false,
    bool apiPathIsFullUrl = false,
    kAuthRequirement authRequirement = kAuthRequirement.required,
  }) async
  {
    return makeRequest(
      apiPath: apiPath,
      body: body,
      additionaHeaders: additionaHeaders,
      authRequirement: authRequirement,
      preventPayloadLogging: preventPayloadLogging,
      apiPathIsFullUrl: apiPathIsFullUrl,
      method: kHttpMethod.post,
    );
  }

  Future<TResponse> get({
    required String apiPath,
    Map<String, String> queryParameters = const {},
    Map<String, String> additionaHeaders = const {},
    bool preventPayloadLogging = false,
    bool apiPathIsFullUrl = false,
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
      apiPathIsFullUrl: apiPathIsFullUrl,
      method: kHttpMethod.get,
    );
  }

  Future<TResponse> put({
    required String apiPath,
    required Map<String, dynamic> body,
    Map<String, String> additionaHeaders = const {},
    bool preventPayloadLogging = false,
    bool apiPathIsFullUrl = false,
    kAuthRequirement authRequirement = kAuthRequirement.required,
  }) async
  {
    return makeRequest(
      apiPath: apiPath,
      body: body,
      additionaHeaders: additionaHeaders,
      authRequirement: authRequirement,
      preventPayloadLogging: preventPayloadLogging,
      apiPathIsFullUrl: apiPathIsFullUrl,
      method: kHttpMethod.put,
    );
  }

  Future<TResponse> delete({
    required String apiPath,
    Map<String, String> additionaHeaders = const {},
    bool preventPayloadLogging = false,
    bool apiPathIsFullUrl = false,
    kAuthRequirement authRequirement = kAuthRequirement.required,
  }) async
  {
    return makeRequest(
      apiPath: apiPath,
      body: null,
      additionaHeaders: additionaHeaders,
      authRequirement: authRequirement,
      preventPayloadLogging: preventPayloadLogging,
      apiPathIsFullUrl: apiPathIsFullUrl,
      method: kHttpMethod.delete,
    );
  }





  Future<TResponse> makeRequest({
    required String apiPath,
    required Map<String, dynamic>? body,
    Map<String, String> queryParameters = const {},
    Map<String, String> additionaHeaders = const {},
    bool preventPayloadLogging = false,
    required bool apiPathIsFullUrl,
    kAuthRequirement authRequirement = kAuthRequirement.required,
    required kHttpMethod method,
  }) async
  {
    

    http.Response? response;
    Map<String, dynamic>? jsonResponse;

    try
    {
      String finalUrl = apiPath;

      if (!apiPathIsFullUrl)
      {
        final baseUrl = await onGetBaseUrl();

        if (apiPath.startsWith('/'))
        {
          apiPath = apiPath.substring(1);
        }

        finalUrl = path.join(baseUrl, apiPath);
      }

      if (preventPayloadLogging)
      {
        Dev.log(this, '${EnumTool.enumToStringValue(method).toUpperCase()}: $finalUrl');
      }
      else
      {
        Dev.log(this, '${EnumTool.enumToStringValue(method).toUpperCase()}: $finalUrl', body);
      }

      Map<String, String> headers = await createHeaders(
        additionalHeaders: additionaHeaders, 
        authRequirement: authRequirement
      );


      String? jsonBody = body != null ? json.encode(body) : null;



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
          );
          break;
      }

      jsonResponse = response.body.isNotEmpty && response.headers['content-type']?.contains('application/json') == true
        ? json.decode(response.body)
        : null;

      return onCreateResponse(response.statusCode, jsonResponse, response.body);
    }
    catch (e)
    {

      if (e is ApiAuthException || e is SignedOutException)
      {
        kAuthError authError = e is SignedOutException ? kAuthError.signedOut : (e as ApiAuthException).code == kApiAuthExceptionCode.tokenExpired ? kAuthError.expired : kAuthError.invalid;

        final authErrorResolving = await onAuthError(authError, authRequirement);

        if (authErrorResolving == kAuthErrorResolving.cancelWithRethrow)
        {
          rethrow;
        }
        else if (authErrorResolving == kAuthErrorResolving.retry)
        {
          await 1000.delay();

          return makeRequest(
            apiPath: apiPath,
            body: body,
            queryParameters: queryParameters,
            additionaHeaders: additionaHeaders,
            preventPayloadLogging: preventPayloadLogging,
            apiPathIsFullUrl: apiPathIsFullUrl,
            authRequirement: authRequirement,
            method: method,
          );
        }
      }

      if (e is NetworkException)
      {
        throw ApiResponseNoNetwork();
      }

      if (e is ClientException && e.message.startsWith('Failed host lookup'))
      {
        throw ApiResponseNoNetwork();
      }

      Dev.logException(this, e, 'Failed $method to $apiPath');
      rethrow;
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
          throw ApiAuthException(code: kApiAuthExceptionCode.invalid);
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