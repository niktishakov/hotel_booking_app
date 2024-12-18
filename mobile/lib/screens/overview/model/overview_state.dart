import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'overview_state.freezed.dart';
part 'overview_state.g.dart';

@freezed
class OverviewState with _$OverviewState {
  const factory OverviewState({
    required List<HotelEntity> hotels,
    required String error,
    required bool isLoading,
    required bool isLoadingMore,
    required int currentPage,
    required bool hasReachedEnd,
    required String searchQuery,
  }) = _OverviewState;

  const OverviewState._();

  factory OverviewState.initial() {
    return const OverviewState(
      hotels: [],
      error: '',
      isLoading: false,
      isLoadingMore: false,
      currentPage: 1,
      hasReachedEnd: false,
      searchQuery: 'hotels in Bali',
    );
  }

  factory OverviewState.fromJson(Map<String, dynamic> json) => _$OverviewStateFromJson(json); //
}
