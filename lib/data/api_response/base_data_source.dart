import 'package:career_coach/data/api_response/api_exception.dart';
import 'package:career_coach/data/api_response/api_response.dart';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseDataSource {
  final Dio _dio;

  BaseDataSource._(this._dio);

  static Future<BaseDataSource> init() async {
    final language = await LocalCache.getString(StringCache.language);
    final token = await LocalCache.getString(StringCache.accessToken);
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://career-be.notarget.id.vn/api/v1',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'accept': '*/*', 'Accept-Language': language, 'Content-Type': 'application/json'},
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

    return BaseDataSource._(dio);
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    required T Function(dynamic json) fromJsonT,
    bool useToken = true,
  }) async {
    try {
      final headers = await _buildHeaders(useToken);
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      return _handleResponse(response, fromJsonT);
    } on DioException catch (e) {
      if (e.response != null) {
        final errorResponse = ApiResponse<T>.fromJson(e.response!.data, fromJsonT);
        throw ApiException(
          errorCode: errorResponse.result.errorCode,
          message: errorResponse.result.message,
          isOk: errorResponse.result.isOk,
        );
      } else {
        throw ApiException(
          errorCode: 'UNKNOWN_ERROR',
          message: e.message ?? 'An unknown error occurred',
          isOk: false,
        );
      }
    } catch (e) {
      throw ApiException(
        errorCode: 'UNKNOWN_ERROR',
        message: e.toString(),
        isOk: false,
      );
    }
  }

  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    required T Function(dynamic json) fromJsonT,
    bool useToken = true,
  }) async {
    try {
      final headers = await _buildHeaders(useToken);
      final response = await _dio.post(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      return _handleResponse<T>(response, fromJsonT);
    } on DioException catch (e) {
      if (e.response != null) {
        final errorResponse = ApiResponse<T>.fromJson(e.response!.data, fromJsonT);
        throw ApiException(
          errorCode: errorResponse.result.errorCode,
          message: errorResponse.result.message,
          isOk: errorResponse.result.isOk,
        );
      } else {
        throw ApiException(
          errorCode: 'UNKNOWN_ERROR',
          message: e.message ?? 'An unknown error occurred',
          isOk: false,
        );
      }
    } catch (e) {
      throw ApiException(
        errorCode: 'UNKNOWN_ERROR',
        message: e.toString(),
        isOk: false,
      );
    }
  }

  Future<T> put<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    required T Function(dynamic json) fromJsonT,
    bool useToken = true,
  }) async {
    try {
      final headers = await _buildHeaders(useToken);
      final response = await _dio.put(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      return _handleResponse<T>(response, fromJsonT);
    } on DioException catch (e) {
      if (e.response != null) {
        final errorResponse = ApiResponse<T>.fromJson(e.response!.data, fromJsonT);
        throw ApiException(
          errorCode: errorResponse.result.errorCode,
          message: errorResponse.result.message,
          isOk: errorResponse.result.isOk,
        );
      } else {
        throw ApiException(
          errorCode: 'UNKNOWN_ERROR',
          message: e.message ?? 'An unknown error occurred',
          isOk: false,
        );
      }
    } catch (e) {
      throw ApiException(
        errorCode: 'UNKNOWN_ERROR',
        message: e.toString(),
        isOk: false,
      );
    }
  }

  Future<T> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    required T Function(dynamic json) fromJsonT,
    bool useToken = true,
  }) async {
    try {
      final headers = await _buildHeaders(useToken);
      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      return _handleResponse<T>(response, fromJsonT);
    } on DioException catch (e) {
      if (e.response != null) {
        final errorResponse = ApiResponse<T>.fromJson(e.response!.data, fromJsonT);
        throw ApiException(
          errorCode: errorResponse.result.errorCode,
          message: errorResponse.result.message,
          isOk: errorResponse.result.isOk,
        );
      } else {
        throw ApiException(
          errorCode: 'UNKNOWN_ERROR',
          message: e.message ?? 'An unknown error occurred',
          isOk: false,
        );
      }
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

  Future<Map<String, String>> _buildHeaders(bool useToken) async {
    final language = await LocalCache.getString(StringCache.language);
    final headers = <String, String>{'accept': '*/*', 'Accept-Language': language, 'Content-Type': 'application/json'};

    if (useToken) {
      final token = await LocalCache.getString(StringCache.accessToken);
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }
}
