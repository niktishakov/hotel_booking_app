import 'package:core/core.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'overview_state.dart';

class OverviewCubit extends Cubit<OverviewState> {
  OverviewCubit({
    required GetHotelsUsecase getHotels,
  })  : _getHotels = getHotels,
        super(OverviewState.initial());

  final AiLogger _logger = AiLogger('OverviewCubit');

  final GetHotelsUsecase _getHotels;

  Future<void> getHotels({bool silent = false}) async {
    if (!silent) {
      emit(state.copyWith(isLoading: true, error: ''));
    }

    final result = await _getHotels.invoke(
      page: state.currentPage,
      pageSize: 20,
      query: state.searchQuery,
    );

    if (!result.success) {
      _logger.error('Failed to get hotels: ${result.error}');
      emit(state.copyWith(error: result.error));
    } else {
      final existingCids = state.hotels.map((hotel) => hotel.cid).toSet();
      final uniqueNewHotels = result.data.where((hotel) => !existingCids.contains(hotel.cid)).toList();

      emit(state.copyWith(
        hotels: state.currentPage == 1 ? result.data : [...state.hotels, ...uniqueNewHotels],
        hasReachedEnd: result.data.isEmpty,
      ));
    }

    emit(state.copyWith(isLoading: false));
  }

  Future<void> loadNextPage() async {
    if (state.isLoading || state.hasReachedEnd) return;

    emit(state.copyWith(
      currentPage: state.currentPage + 1,
      isLoadingMore: true,
    ));
    await getHotels(silent: true);
    emit(state.copyWith(isLoadingMore: false));
  }

  void reset() => emit(OverviewState.initial());

  Future<void> searchHotels({String query = 'hotels in bali'}) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (query.isEmpty) {
      emit(state.copyWith(
        currentPage: 1,
        searchQuery: '',
        hasReachedEnd: false,
      ));
      await getHotels();
      return;
    }

    emit(state.copyWith(
      isLoading: true,
      currentPage: 1,
      searchQuery: query,
      error: '',
    ));

    final result = await _getHotels.invoke(
      page: 1,
      pageSize: 20,
      query: query,
    );

    if (!result.success) {
      _logger.error('Failed to search hotels: ${result.error}');
      emit(state.copyWith(
        error: result.error,
        isLoading: false,
      ));
    } else {
      emit(state.copyWith(
        hotels: result.data,
        hasReachedEnd: result.data.isEmpty,
        isLoading: false,
      ));
    }
  }
}
