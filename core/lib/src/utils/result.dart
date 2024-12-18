sealed class Result<T> {
  const Result();
  factory Result.success(T data) => Success<T>(data);
  factory Result.failure(String error) => Failure(error);

  bool get success => this is Success<T>;
  T get data => throw Exception('This is not Success<T>');
  String get error => throw Exception('This is not Failure<T>');
}

class Success<T> extends Result<T> {
  const Success(this._data);
  final T _data;

  @override
  T get data => _data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<T> &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}

class Failure<T> extends Result<T> {
  const Failure(this._error);
  final String _error;

  @override
  String get error => _error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => error.hashCode;
}
