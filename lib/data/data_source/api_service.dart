import 'package:career_coach/data/data_source/api_url.dart';
import 'package:career_coach/data/exception/api_exception.dart';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService extends DioMixin{
  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  ApiService._internal() {
    options = BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      validateStatus: (status) => status! < 600,
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
        onResponse: (response, handler) {
          final data = response.data;

          final result = data['result'];

          if (result['isOk'] == false) {
            return handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                response: response,
                type: DioExceptionType.badResponse,
                message: result['message'] ?? 'Có lỗi xảy ra',
                error: ApiException(
                  errorCode: result['errorCode'] ?? 'UNKNOWN_ERROR',
                  message: result['message'] ?? 'Có lỗi xảy ra',
                  isOk: result?['isOk'] ?? false,
                  isUnauthorized: result['errorCode'] == '401',
                ),
              ),
            );
          }
          else {
            return handler.next(response);
          }
        },

        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401 &&
              !error.requestOptions.path.contains('/auth/refresh')) {
            try {
              final newToken = await _refreshToken();
              if (newToken != null) {
                await LocalCache.setString(StringCache.accessToken, newToken);

                final clonedRequest = error.requestOptions;
                clonedRequest.headers['Authorization'] = 'Bearer $newToken';

                final response = await fetch(clonedRequest);
                return handler.resolve(response);
              } else {
                await LocalCache.clear();
                return handler.reject(error);
              }
            } catch (e) {
              if (e is DioException) {
                await LocalCache.clear();
                return handler.reject(
                  DioException(
                    requestOptions: error.requestOptions,
                    error: ApiException(
                      errorCode:
                      e.response?.data['result']['errorCode'] ??
                          'UNKNOWN_ERROR',
                      message:
                      e.response?.data['result']['message'] ??
                          'An unknown error occurred',
                      isOk: false,
                      isUnauthorized: true,
                    ),
                  ),
                );
              }
            }
          }
          return handler.next(error);
        },
      ),
      CurlLoggerDioInterceptor(
        printOnSuccess: true,
        convertFormData: true,
      ),
    ]);

  }

  static Future<String?> _refreshToken() async {
    final refreshToken = await LocalCache.getString(StringCache.refreshToken);

    if (refreshToken.isEmpty) return null;

    try {
      final dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl));
      final response = await dio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );
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