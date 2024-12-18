// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OverviewStateImpl _$$OverviewStateImplFromJson(Map<String, dynamic> json) =>
    _$OverviewStateImpl(
      hotels: (json['hotels'] as List<dynamic>)
          .map((e) => HotelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String,
      isLoading: json['isLoading'] as bool,
      isLoadingMore: json['isLoadingMore'] as bool,
      currentPage: (json['currentPage'] as num).toInt(),
      hasReachedEnd: json['hasReachedEnd'] as bool,
      searchQuery: json['searchQuery'] as String,
    );

Map<String, dynamic> _$$OverviewStateImplToJson(_$OverviewStateImpl instance) =>
    <String, dynamic>{
      'hotels': instance.hotels,
      'error': instance.error,
      'isLoading': instance.isLoading,
      'isLoadingMore': instance.isLoadingMore,
      'currentPage': instance.currentPage,
      'hasReachedEnd': instance.hasReachedEnd,
      'searchQuery': instance.searchQuery,
    };
