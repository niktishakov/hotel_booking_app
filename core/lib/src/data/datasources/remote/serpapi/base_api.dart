import 'package:core/core.dart';
import 'package:dio/dio.dart';

import 'api_error.dart';

/// Base class for objects that communicate with remote data sources.
abstract class Api {
  const Api();
}

abstract class BaseApi extends Api {
  const BaseApi();

  Future<Result<T>> call<T>(Future<T> Function() fn) async {
    try {
      final result = await fn();
      return Result.success(result);
    } on NoInternetException catch (e) {
      AiLogger('Base API').error('Network Connection Failed', e);
      return Result.failure('No internet connection available');
    } on DioException catch (e) {
      final error = _handleDioException(e);
      AiLogger('Base API').error('API Error: ${error.message}', e);
      return Result.failure(error.message);
    } catch (e) {
      AiLogger('Base API').error('Unexpected Error', e);
      return Result.failure('Something went wrong');
    }
  }

  ApiError _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutError(message: 'Request timed out', exception: e);

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        switch (statusCode) {
          case 401:
            return AuthenticationError(message: 'Unauthorized access', exception: e);
          case 403:
            return AuthorizationError(message: 'Access forbidden', exception: e);
          case 404:
            return NotFoundError(message: 'Resource not found', exception: e);
          case _ when statusCode != null && statusCode >= 500:
            return ServerError(message: 'Server error occurred', exception: e);
          default:
            return ApiError(
              message: e.response?.data['message'] ?? 'Unknown API error',
              exception: e,
            );
        }

      default:
        return ApiError(message: 'Request failed', exception: e);
    }
  }
}
