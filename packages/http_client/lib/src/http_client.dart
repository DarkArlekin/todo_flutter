library http_client;

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:flavor_config/flavor_config.dart';

final Dio dio = Dio();

final CookieJar cookieJar = CookieJar();
const String httpErrorMessage = 'message';

// todo: delete MOCK
const _baseApiUrl = "_baseApiUrl";

class HttpClient {
  static final HttpClient _singleton = HttpClient._internal();

  factory HttpClient() {
    dio.interceptors.add(CookieManager(cookieJar));
    dio.options.contentType = Headers.jsonContentType;
    return _singleton;
  }

  HttpClient._internal();

  // final String? _baseApiUrl = FlavorConfig.instance?.values.baseApiUrl;
  final Map<String, String> _headers = {};

  void setHeaders(String header, String value) {
    _headers[header] = value;
  }

  void removeHeader(String header) {
    _headers.remove(header);
  }

  Future<Response> download(
    String url,
    path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool isBase = true,
  }) =>
      dio.download(
        isBase == false ? url : '$_baseApiUrl/$url',
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers ?? _headers,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

  Future<Response> post(
    String url, {
    body,
    Map<String, dynamic>? headers,
    String contentType = Headers.jsonContentType,
    Map<String, dynamic>? queryParameters,
  }) =>
      dio.post('$_baseApiUrl/$url',
          queryParameters: queryParameters,
          data: body,
          options: Options(
            contentType: contentType,
            headers: headers ?? _headers,
          ));

  Future<Response> path(String url,
          {Map<String, dynamic>? body,
          Map<String, dynamic>? headers,
          String contentType = Headers.jsonContentType}) =>
      dio.patch('$_baseApiUrl/$url',
          data: body,
          options: Options(
            contentType: contentType,
            headers: headers ?? _headers,
          ));

  Future<Response> put(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String contentType = Headers.jsonContentType,
    Map<String, dynamic>? queryParameters,
  }) =>
      dio.put('$_baseApiUrl/$url',
          queryParameters: queryParameters,
          data: body,
          options: Options(
            contentType: contentType,
            headers: headers ?? _headers,
          ));

  Future<Response> delete(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String contentType = Headers.jsonContentType,
  }) =>
      dio.delete('$_baseApiUrl/$url',
          data: body,
          options: Options(
            contentType: contentType,
            headers: headers ?? _headers,
          ));

  Future<Response> get(
    String url, {
    Map<String, dynamic>? headers,
    String contentType = Headers.jsonContentType,
    Map<String, dynamic>? queryParameters,
    bool isBase = true,
  }) =>
      dio.get(isBase == false ? url : '$_baseApiUrl/$url',
          queryParameters: queryParameters,
          options: Options(
            contentType: contentType,
            headers: headers ?? _headers,
          ));
}
