import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourites_state.freezed.dart';
part 'favourites_state.g.dart';

@freezed
sealed class FavouritesStatus with _$FavouritesStatus {
  const factory FavouritesStatus.initial() = _Initial;
  const factory FavouritesStatus.success(String message) = _Success;
  const factory FavouritesStatus.error(String message) = _Error;

  factory FavouritesStatus.fromJson(Map<String, dynamic> json) => _$FavouritesStatusFromJson(json);
}

@freezed
class FavouritesState with _$FavouritesState {
  const factory FavouritesState({
    required List<HotelEntity> favourites,
    @Default(FavouritesStatus.initial()) FavouritesStatus status,
  }) = _FavouritesState;

  const FavouritesState._();

  factory FavouritesState.initial() => const FavouritesState(
        favourites: [],
      );

  bool contains(HotelEntity hotel) => favourites.contains(hotel);

  factory FavouritesState.fromJson(Map<String, dynamic> json) => _$FavouritesStateFromJson(json);
}
