import 'dart:typed_data';

import 'package:career_coach/data/data_source/api_url.dart';
import 'package:career_coach/data/exception/api_exception.dart';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService extends DioMixin {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  ApiService._internal() {
    options = BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'accept': '*/*'},
    );

    httpClientAdapter = IOHttpClientAdapter();

    interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        request: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final language = await LocalCache.getString(StringCache.language);
          final token = await LocalCache.getString(StringCache.accessToken);
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          if (language.isNotEmpty) {
            options.headers['Accept-Language'] = language;
          }
          options.headers['Content-Type'] = 'application/json';
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          final data = response.data;

          if (data == null) {
            return handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                response: response,
                type: DioExceptionType.badResponse,
                message: 'No data received from server',
                error: ApiException(
                  errorCode: 'NO_DATA',
                  message: 'No data received from server',
                  ok: false,
                  isUnauthorized: false,
                ),
              ),
            );
          }

          if (data is Uint8List || data is List<int> || data is String) {
            return handler.next(response);
          }

          if (data is! Map<String, dynamic>) {
            return handler.next(response);
          }

          final result = data['result'];

          if (result is! Map<String, dynamic>) {
            return handler.next(response);
          }

          if (result['ok'] == false) {
            return handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                response: response,
                type: DioExceptionType.badResponse,
                message: result['message'] ?? "Error occurred",
                error: ApiException(
                  errorCode: result['errorCode'] ?? 'UNKNOWN_ERROR',
                  message: result['message'] ?? 'An unknown error occurred',
                  ok: false,
                  isUnauthorized: result['errorCode'] == '401',
                ),
              ),
            );
          }

          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401 && !error.requestOptions.path.contains('/auth/refresh')) {
            try {
              final newToken = await _refreshToken();
              if (newToken == null) {
                return handler.reject(error);
              }
              await LocalCache.setString(StringCache.accessToken, newToken);
              final newRequest =
                  Options(
                        method: error.requestOptions.method,
                        headers: {...error.requestOptions.headers, 'Authorization': 'Bearer $newToken'},
                      )
                      .compose(
                        options,
                        error.requestOptions.path,
                        data: error.requestOptions.data,
                        queryParameters: error.requestOptions.queryParameters,
                      )
                      .copyWith(extra: error.requestOptions.extra);
              final response = await fetch(newRequest);
              return handler.resolve(response);
            } catch (e) {
              return handler.reject(
                DioException(
                  requestOptions: error.requestOptions,
                  error: ApiException(
                    errorCode: 'REFRESH_FAILED',
                    message: 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.',
                    ok: false,
                    isUnauthorized: true,
                  ),
                ),
              );
            }
          }
          return handler.next(error);
        },
      ),
      CurlLoggerDioInterceptor(printOnSuccess: true, convertFormData: true),
    ]);
  }

  static Future<String?> _refreshToken() async {
    final refreshToken = await LocalCache.getString(StringCache.refreshToken);

    if (refreshToken.isEmpty) return null;

    try {
      final dio = Dio(
        BaseOptions(baseUrl: ApiUrl.baseUrl, headers: {'Content-Type': 'application/json', 'Accept': '*/*'}),
      );
      final response = await dio.post('/auth/refresh', data: {'refreshToken': refreshToken});
      return response.data['data']['accessToken'];
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) async {
    try {
      final Response<T> res = await super.fetch(requestOptions);
      return res;
    } on DioException catch (e) {
      throw e.error ?? e;
    }
  }
}
