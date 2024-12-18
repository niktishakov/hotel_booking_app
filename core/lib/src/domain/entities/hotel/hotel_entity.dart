import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel_entity.freezed.dart';
part 'hotel_entity.g.dart';

@freezed
class HotelEntity with _$HotelEntity {
  const factory HotelEntity({
    required String cid,
    required String title,
    required String address,
    required double latitude,
    required double longitude,
    required double rating,
    required int ratingCount,
    required String category,
    required String phoneNumber,
    required String website,
  }) = _HotelEntity;

  factory HotelEntity.fromJson(Map<String, dynamic> json) => _$HotelEntityFromJson(json);
}
