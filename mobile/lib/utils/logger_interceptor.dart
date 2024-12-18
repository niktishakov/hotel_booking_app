import 'package:core/core.dart';
import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  final AiLogger _logger = AiLogger('LoggerInterceptor');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.info('${options.method.toUpperCase()} ${"${options.baseUrl}${options.path}"}');

    _logger.info('Headers:');
    options.headers.forEach((k, dynamic v) => _logger.info('$k: $v'));

    if (options.queryParameters.isNotEmpty) {
      _logger.info('queryParameters:');
      options.queryParameters.forEach((k, dynamic v) => _logger.info('$k: $v'));
    }

    if (options.data != null) {
      _logger.info('Body: ${options.data}');
    }
    _logger.info('END ${options.method.toUpperCase()}');

    handler.next(options);
  }

  @override
  void onError(DioException dioError, ErrorInterceptorHandler handler) {
    final response = dioError.response;
    final requestOptions = dioError.requestOptions;

    _logger.info('HTTP Error');
    _logger.info('Error message: ${dioError.message}');
    _logger.info('Request: ${requestOptions.method} ${requestOptions.baseUrl}${requestOptions.path}');
    _logger.info('Body: ${response != null ? response.data : ''}');
    _logger.info('End HTTP Error');

    handler.next(dioError);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final requestOptions = response.requestOptions;

    _logger.info('HTTP Response');

    _logger.info('${response.statusCode} ${requestOptions.baseUrl}${requestOptions.path}');

    _logger.info('Headers:');
    response.headers.forEach((k, v) => _logger.info('$k: $v'));

    _logger.info('Response: ${response.data}');
    _logger.info('END HTTP Response');

    handler.next(response);
  }
}
