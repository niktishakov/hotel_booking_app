import 'package:hotel_booking_app/core/base_notifier.dart';

enum OverlayType { transparent, white }

class MaterialAppOverlayNotifier extends BaseNotifier {
  MaterialAppOverlayNotifier()
      : _shouldDisplayOverlay = false,
        _type = OverlayType.white;

  bool _shouldDisplayOverlay;

  bool get shouldDisplayOverlay => _shouldDisplayOverlay;

  bool get isNotDisplayingOverlay => !_shouldDisplayOverlay;

  OverlayType _type;

  OverlayType get overlayType => _type;

  void showOverlay({OverlayType type = OverlayType.white}) {
    _type = type;
    _shouldDisplayOverlay = true;
    notifyListeners();
  }

  void hideOverlay() {
    _shouldDisplayOverlay = false;
    notifyListeners();
  }
}
