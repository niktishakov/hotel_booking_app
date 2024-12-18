import 'app_router.dart';

class RouterService {
  static RouterService? _instance;
  static RouterService get instance {
    assert(_instance != null, 'Remember to initialise RouterService by calling its init method');
    return _instance!;
  }

  late final AppRouter _router;
  AppRouter get router => _router;

  RouterService._() {
    _router = AppRouter();
  }

  static Future<void> init() async {
    assert(_instance == null);
    _instance = RouterService._();
  }
}
