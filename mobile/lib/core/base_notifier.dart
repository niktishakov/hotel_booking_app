import 'package:flutter/material.dart';

abstract class BaseNotifier extends ChangeNotifier {
  bool _mounted = true;

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (_mounted) {
      super.notifyListeners();
    }
  }
}

abstract class SharedStateProxyNotifier extends BaseNotifier {
  void onSharedStateUpdate();
}

/// use this to observe the [AppLifecycleState] changes
mixin AppLifecycleStateObserver {
  void didChangeAppLifecycleState(AppLifecycleState state);
}
