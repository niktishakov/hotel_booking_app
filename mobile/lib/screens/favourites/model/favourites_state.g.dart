// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitialImpl _$$InitialImplFromJson(Map<String, dynamic> json) =>
    _$InitialImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InitialImplToJson(_$InitialImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$SuccessImpl _$$SuccessImplFromJson(Map<String, dynamic> json) =>
    _$SuccessImpl(
      json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SuccessImplToJson(_$SuccessImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };

_$ErrorImpl _$$ErrorImplFromJson(Map<String, dynamic> json) => _$ErrorImpl(
      json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorImplToJson(_$ErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };

_$FavouritesStateImpl _$$FavouritesStateImplFromJson(
        Map<String, dynamic> json) =>
    _$FavouritesStateImpl(
      favourites: (json['favourites'] as List<dynamic>)
          .map((e) => HotelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] == null
          ? const FavouritesStatus.initial()
          : FavouritesStatus.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FavouritesStateImplToJson(
        _$FavouritesStateImpl instance) =>
    <String, dynamic>{
      'favourites': instance.favourites,
      'status': instance.status,
    };
