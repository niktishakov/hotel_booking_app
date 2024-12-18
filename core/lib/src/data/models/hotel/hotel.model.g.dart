// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HotelModelImpl _$$HotelModelImplFromJson(Map<String, dynamic> json) =>
    _$HotelModelImpl(
      cid: json['cid'] as String,
      title: json['title'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      ratingCount: (json['ratingCount'] as num).toInt(),
      category: json['category'] as String,
      phoneNumber: json['phoneNumber'] as String,
      website: json['website'] as String,
    );

Map<String, dynamic> _$$HotelModelImplToJson(_$HotelModelImpl instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'title': instance.title,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
      'category': instance.category,
      'phoneNumber': instance.phoneNumber,
      'website': instance.website,
    };
