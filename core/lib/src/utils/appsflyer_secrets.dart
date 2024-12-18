class AppsflyerSecrets {
  AppsflyerSecrets({
    required this.devKey,
    required this.appId,
  });

  final String devKey;
  final String appId;

  static AppsflyerSecrets fromJson(Map<String, dynamic> json) {
    return AppsflyerSecrets(
      devKey: json['devKey'] as String,
      appId: json['appId'] as String,
    );
  }
}
