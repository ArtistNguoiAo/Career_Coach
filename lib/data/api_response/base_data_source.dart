import 'package:career_coach/data/api_response/api_exception.dart';
import 'package:career_coach/data/api_response/api_response.dart';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseDataSource {
  final Dio _dio;

  BaseDataSource._(this._dio);

  static Future<BaseDataSource> init() async {
    // final language = await LocalCache.getString(StringCache.language);
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://career-be.notarget.id.vn/api/v1',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'accept': '*/*',
          // 'Accept-Language': language,
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
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
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final language = await LocalCache.getString(StringCache.language);
          options.headers['Accept-Language'] = language;
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401 &&
              !error.requestOptions.path.contains('/auth/refresh')) {
            final newToken = await _refreshToken(dio);
            if (newToken != null) {
              await LocalCache.setString(StringCache.accessToken, newToken);

              final clonedRequest = error.requestOptions;
              clonedRequest.headers['Authorization'] = 'Bearer $newToken';

              final response = await dio.fetch(clonedRequest);
              return handler.resolve(response);
            } else {
              await LocalCache.clear();
              return handler.reject(error);
            }
          }
          return handler.next(error);
        },
      ),
    );

    return BaseDataSource._(dio);
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    required T Function(dynamic json) fromJsonT,
    bool useToken = true,
  }) {
    return _request<T>(
      method: 'GET',
      path: path,
      queryParameters: queryParameters,
      data: data,
      fromJsonT: fromJsonT,
      useToken: useToken,
    );
  }

  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    required T Function(dynamic json) fromJsonT,
    bool useToken = true,
  }) {
    return _request<T>(
      method: 'POST',
      path: path,
      queryParameters: queryParameters,
      data: data,
      fromJsonT: fromJsonT,
      useToken: useToken,
    );
  }

  Future<T> put<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    required T Function(dynamic json) fromJsonT,
    bool useToken = true,
  }) {
    return _request<T>(
      method: 'PUT',
      path: path,
      queryParameters: queryParameters,
      data: data,
      fromJsonT: fromJsonT,
      useToken: useToken,
    );
  }

  Future<T> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    required T Function(dynamic json) fromJsonT,
    bool useToken = true,
  }) {
    return _request<T>(
      method: 'DELETE',
      path: path,
      queryParameters: queryParameters,
      data: data,
      fromJsonT: fromJsonT,
      useToken: useToken,
    );
  }

  Future<T> _request<T>({
    required String method,
    required String path,
    Map<String, dynamic>? queryParameters,
    Object? data,
    required T Function(dynamic json) fromJsonT,
    bool useToken = true,
  }) async {
    final headers = await _buildHeaders(useToken);

    try {
      final response = await _dio.request(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(method: method, headers: headers),
      );

      return _handleResponse<T>(response, fromJsonT);
    } on DioException catch (e) {
      throw _handleError<T>(e, fromJsonT);
    } catch (e) {
      throw ApiException(
        errorCode: 'UNKNOWN_ERROR',
        message: e.toString(),
        isOk: false,
      );
    }
  }

  T _handleResponse<T>(Response response, T Function(dynamic data) fromJsonT) {
    final json = response.data;
    final apiResponse = ApiResponse<T>.fromJson(json, fromJsonT);

    if (!apiResponse.result.isOk) {
      throw ApiException(
        errorCode: apiResponse.result.errorCode,
        message: apiResponse.result.message,
        isOk: apiResponse.result.isOk,
      );
    }
    return apiResponse.data;
  }

  ApiException _handleError<T>(DioException e, T Function(dynamic) fromJsonT) {
    if (e.response != null) {
      try {
        final errorResponse = ApiResponse<T>.fromJson(e.response!.data, fromJsonT);
        return ApiException(
          errorCode: errorResponse.result.errorCode,
          message: errorResponse.result.message,
          isOk: errorResponse.result.isOk,
        );
      } catch (_) {
        return ApiException(
          errorCode: 'INVALID_RESPONSE',
          message: 'Cannot parse error response',
          isOk: false,
        );
      }
    } else {
      return ApiException(
        errorCode: 'UNKNOWN_ERROR',
        message: e.message ?? 'An unknown error occurred',
        isOk: false,
      );
    }
  }


  Future<Map<String, String>> _buildHeaders(bool useToken) async {
    final language = await LocalCache.getString(StringCache.language);
    final headers = <String, String>{
      'accept': '*/*',
      'Accept-Language': language,
      'Content-Type': 'application/json',
    };

    if (useToken) {
      final token = await LocalCache.getString(StringCache.accessToken);
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  static Future<String?> _refreshToken(Dio dio) async {
    final refreshToken = await LocalCache.getString(StringCache.refreshToken);

    try {
      final response = await dio.post('/auth/refresh', data: {
        'refreshToken': refreshToken,
      });

      final newToken = response.data['data']['accessToken'];
      return newToken;
    } catch (_) {
      return null;
    }
  }
}
