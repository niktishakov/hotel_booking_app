import 'package:core/core.dart';

sealed class FavouritesEvent {
  const FavouritesEvent();
}

final class ToggleFavorite extends FavouritesEvent {
  const ToggleFavorite(this.hotel);
  final HotelEntity hotel;
}

final class AddHotel extends FavouritesEvent {
  const AddHotel(this.hotel);
  final HotelEntity hotel;
}

final class RemoveHotel extends FavouritesEvent {
  const RemoveHotel(this.hotel);
  final HotelEntity hotel;
}

final class Reset extends FavouritesEvent {
  const Reset();
}
