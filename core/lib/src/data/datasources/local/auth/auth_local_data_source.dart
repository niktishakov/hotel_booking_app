import 'user_credentials.model.dart';

abstract interface class AuthLocalDataSource {
  Future<void> saveCredentials(UserCredentials credentials);
  Future<UserCredentials?> getCredentials();
  Future<void> deleteCredentials();

  Future<String?> getDeviceToken();
  Future<void> saveDeviceToken(String value);
  Future<void> removeDeviceToken();
  Future<Map<String, String>> getAll();
  Future<void> deleteAll();
}
