/// Base class for API errors
class ApiError implements Exception {
  const ApiError({
    required this.message,
    required this.exception,
  });

  final String message;
  final Exception exception;
}

/// Error thrown when a request times out
class TimeoutError extends ApiError {
  const TimeoutError({
    required super.message,
    required super.exception,
  });
}

/// Error thrown when authentication fails (401)
class AuthenticationError extends ApiError {
  const AuthenticationError({
    required super.message,
    required super.exception,
  });
}

/// Error thrown when authorization fails (403)
class AuthorizationError extends ApiError {
  const AuthorizationError({
    required super.message,
    required super.exception,
  });
}

/// Error thrown when a resource is not found (404)
class NotFoundError extends ApiError {
  const NotFoundError({
    required super.message,
    required super.exception,
  });
}

/// Error thrown when a server error occurs (500+)
class ServerError extends ApiError {
  const ServerError({
    required super.message,
    required super.exception,
  });
}
