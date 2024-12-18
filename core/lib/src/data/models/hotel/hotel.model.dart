import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// "position": 1,
//       "title": "Sleep Inn & Suites",
//       "address": "4601 Utica St, Metairie, LA 70006",
//       "latitude": 30.0010048,
//       "longitude": -90.18644839999999,
//       "rating": 3.8,
//       "ratingCount": 951,
//       "category": "Hotel",
//       "phoneNumber": "(504) 887-5337",
//       "website": "https://www.choicehotels.com/louisiana/metairie/sleep-inn-hotels/la121?mc=llgoxxpx",
//       "cid": "2683350502315008123"

part 'hotel.model.freezed.dart';
part 'hotel.model.g.dart';

@freezed
class HotelModel with _$HotelModel {
  const factory HotelModel({
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
  }) = _HotelModel;

  factory HotelModel.fromJson(Map<String, dynamic> json) => _$HotelModelFromJson(json);

  factory HotelModel.mock() {
    return HotelModel(
      cid: 'cid',
      title: 'title',
      address: 'address',
      latitude: 0,
      longitude: 0,
      rating: 0,
      ratingCount: 0,
      category: 'category',
      phoneNumber: 'phoneNumber',
      website: 'website',
    );
  }
}

extension HotelModelX on HotelModel {
  HotelEntity toEntity() => HotelEntity(
        cid: cid,
        title: title,
        address: address,
        latitude: latitude,
        longitude: longitude,
        rating: rating,
        ratingCount: ratingCount,
        category: category,
        phoneNumber: phoneNumber,
        website: website,
      );
  HotelModel fromEntity(HotelEntity model) => HotelModel(
        cid: model.cid,
        title: model.title,
        address: model.address,
        latitude: model.latitude,
        longitude: model.longitude,
        rating: model.rating,
        ratingCount: model.ratingCount,
        category: model.category,
        phoneNumber: model.phoneNumber,
        website: model.website,
      );
}
