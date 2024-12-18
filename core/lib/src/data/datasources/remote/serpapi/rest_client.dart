import 'package:dio/dio.dart';

class RestClient {
  RestClient(this._httpClient);
  late final Dio _httpClient;

  Future<Response<T>> get<T>(
    String relativePath, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _httpClient.get(
      relativePath,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<T> getAsMap<T>({
    required String endpoint,
    required T Function(Map<String, dynamic> json) mapper,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    final response = await get(
      endpoint,
      queryParameters: queryParams,
      options: options,
    );

    return mapper(response.data as Map<String, dynamic>);
  }

  Future<List<T>> getAsList<T>({
    required String endpoint,
    required T Function(Map<String, dynamic> json) mapper,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    final response = await get(
      endpoint,
      queryParameters: queryParams,
      options: options,
    );

    return (response.data as List).map((dynamic json) => mapper(json as Map<String, dynamic>)).toList();
  }

  Future<Response<T>> post<T>(
    String relativePath, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _httpClient.post(
      relativePath,
      queryParameters: queryParameters,
      data: data,
      options: options,
    );
  }

  Future<T> postAsMap<T>({
    required String endpoint,
    required T Function(Map<String, dynamic> json) mapper,
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    final response = await post(
      endpoint,
      queryParameters: queryParams,
      data: data,
      options: options,
    );

    return mapper(response.data as Map<String, dynamic>);
  }

  Future<List<T>> postAsList<T>({
    required String endpoint,
    required dynamic data,
    required T Function(Map<String, dynamic> json) mapper,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    final response = await post(
      endpoint,
      queryParameters: queryParams,
      data: data,
      options: options,
    );

    return (response.data as List).map((dynamic json) => mapper(json as Map<String, dynamic>)).toList();
  }

  Future<Response<T>> put<T>(
    String relativePath, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _httpClient.put(
      relativePath,
      queryParameters: queryParameters,
      data: data,
      options: options,
    );
  }

  Future<T> putAsMap<T>({
    required String endpoint,
    required T Function(Map<String, dynamic> json) mapper,
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    final response = await put(
      endpoint,
      queryParameters: queryParams,
      data: data,
      options: options,
    );

    return mapper(response.data as Map<String, dynamic>);
  }

  Future<Response<T>> delete<T>(
    String relativePath, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _httpClient.delete(
      relativePath,
      queryParameters: queryParameters,
      data: data,
      options: options,
    );
  }

  Future<Response<T>> patch<T>(
    String relativePath, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _httpClient.patch(
      relativePath,
      queryParameters: queryParameters,
      data: data,
      options: options,
    );
  }

  Future<Response<T>> request<T>(
    String relativePath, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _httpClient.request(
      relativePath,
      queryParameters: queryParameters,
      data: data,
      options: options,
    );
  }
}

class NoInternetException extends DioException {
  NoInternetException({
    required super.requestOptions,
    String? message,
  }) : super(
          message: message ?? 'No internet connection available',
          type: DioExceptionType.connectionError,
        );
}

extension StatusCodeX on Response {
  bool get successful {
    final sc = statusCode;
    if (sc == null) return false;
    return sc >= 200 && sc < 300;
  }
}
