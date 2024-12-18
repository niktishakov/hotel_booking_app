import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'favourites_event.dart';
import 'favourites_state.dart';

class FavouritesBloc extends HydratedBloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(FavouritesState.initial()) {
    on<ToggleFavorite>(_onToggleFavorite);
    on<AddHotel>(_onAddHotel);
    on<RemoveHotel>(_onRemoveHotel);
    on<Reset>(_onReset);
  }

  static const _alreadyInFavourites = 'Hotel already in favourites';
  static const _notInFavourites = 'Hotel not in favourites';
  static const _addedToFavourites = 'Added to favorites';
  static const _removedFromFavourites = 'Removed from favorites';

  Future<void> _onToggleFavorite(ToggleFavorite event, Emitter<FavouritesState> emit) async {
    if (state.contains(event.hotel)) {
      await _onRemoveHotel(RemoveHotel(event.hotel), emit);
    } else {
      await _onAddHotel(AddHotel(event.hotel), emit);
    }
  }

  Future<void> _onAddHotel(AddHotel event, Emitter<FavouritesState> emit) async {
    if (state.contains(event.hotel)) {
      emit(state.copyWith(
        status: const FavouritesStatus.error(_alreadyInFavourites),
      ));
      return;
    }

    emit(state.copyWith(
      favourites: List.from(state.favourites)..add(event.hotel),
      status: const FavouritesStatus.success(_addedToFavourites),
    ));
  }

  Future<void> _onRemoveHotel(RemoveHotel event, Emitter<FavouritesState> emit) async {
    if (!state.contains(event.hotel)) {
      emit(state.copyWith(
        status: const FavouritesStatus.error(_notInFavourites),
      ));
      return;
    }

    emit(state.copyWith(
      favourites: List.from(state.favourites)..remove(event.hotel),
      status: const FavouritesStatus.success(_removedFromFavourites),
    ));
  }

  void _onReset(Reset event, Emitter<FavouritesState> emit) => emit(FavouritesState.initial());

  @override
  FavouritesState? fromJson(Map<String, dynamic> json) {
    return FavouritesState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(FavouritesState state) {
    return state.toJson();
  }
}
