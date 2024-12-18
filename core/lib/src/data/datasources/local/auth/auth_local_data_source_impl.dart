import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'auth_local_data_source.dart';
import 'user_credentials.model.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl() {
    _storage = FlutterSecureStorage();
  }

  late FlutterSecureStorage _storage;
  static const String boxName = 'credentials';

  @override
  Future<void> saveCredentials(UserCredentials credentials) async {
    final box = await Hive.openBox<UserCredentials>(boxName);
    await box.put('user', credentials);
  }

  @override
  Future<UserCredentials?> getCredentials() async {
    final box = await Hive.openBox<UserCredentials>(boxName);
    return box.get('user');
  }

  @override
  Future<void> deleteCredentials() async {
    final box = await Hive.openBox<UserCredentials>(boxName);
    await box.delete('user');
  }

  @override
  Future<String?> getDeviceToken() {
    return _storage.read(key: 'deviceToken');
  }

  @override
  Future<void> saveDeviceToken(String value) {
    return _storage.write(
      key: 'deviceToken',
      value: value,
    );
  }

  @override
  Future<void> removeDeviceToken() {
    return _storage.delete(key: 'deviceToken');
  }

  @override
  Future<Map<String, String>> getAll() {
    return _storage.readAll();
  }

  @override
  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
      final box = await Hive.openBox<UserCredentials>(boxName);
      await box.delete('user');
    } catch (e) {
      rethrow;
    }
  }
}
