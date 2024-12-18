import 'dart:convert';

import 'package:flutter/services.dart';

/// Create the file secrets.json in the root directory of this app.
/// Replace the mocked values with the actual values.
/// Ask a colleague for the up-to-date ones.
///
/// {
///   "apiUrl": {
///     "prod": "secret-prod-url",
///     "dev": "secret-dev-url"
///   },
///   "sentryDsn": "secret-dsn",
///   "ampliudeApiKey": "secret-key",
/// }
class Secrets {
  Secrets._(this._config);

  static Future<Secrets> create() async {
    final configAsString = await rootBundle.loadString('secrets.json');
    final config = json.decode(configAsString) as Map<String, dynamic>;

    return Secrets._(
      Map<String, dynamic>.unmodifiable(config),
    );
  }

  final Map<String, dynamic> _config;

  String get serpApiBaseUrl => _config['serpApiBaseUrl'] as String;
  String get serpApiKey => _config['serpApiKey'] as String;
}
