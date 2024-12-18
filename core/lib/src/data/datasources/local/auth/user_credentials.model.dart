import 'package:hive/hive.dart';

part 'user_credentials.model.g.dart';

@HiveType(typeId: 1)
class UserCredentials extends HiveObject {
  @HiveField(0)
  late String token;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? password;
}
