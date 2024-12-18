/// Global HTTP configuration constants
class HttpConfig {
  const HttpConfig._();

  static const contentTypeHeader = 'Content-Type';
  static const contentTypeValue = 'application/json; charset=UTF-8';
  static const acceptHeader = 'Accept';
  static const acceptValue = 'application/json';

  static const successCode = 200;
  static const createdCode = 201;
  static const badRequestCode = 400;
  static const unauthorizedCode = 401;
  static const notFoundCode = 404;
  static const serverErrorCode = 500;

  // Common response fields
  static const okField = 'ok';
  static const errorField = 'error';
  static const messageField = 'message';

  /// Common headers for JSON requests
  static Map<String, String> get jsonHeaders => {
        contentTypeHeader: contentTypeValue,
        acceptHeader: acceptValue,
      };
}
