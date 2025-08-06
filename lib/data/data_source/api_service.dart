import 'package:career_coach/data/data_source/api_url.dart';
import 'package:career_coach/data/exception/api_exception.dart';
import 'package:career_coach/data/local/local_cache.dart';
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
            options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
          }
          if (language.isNotEmpty) {
            options.headers.putIfAbsent('Accept-Language', () => language);
          }
          options.headers.putIfAbsent('Content-Type', () => 'application/json');

          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401 &&
              !error.requestOptions.path.contains('/auth/refresh')) {
            try {
              final newToken = await _refreshToken();
              if (newToken != null) {
                await LocalCache.setString(StringCache.accessToken, newToken);

                final clonedRequest = error.requestOptions;
                clonedRequest.headers.putIfAbsent('Authorization', () => 'Bearer $newToken');

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
}