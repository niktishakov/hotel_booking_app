import 'package:core/core.dart';

typedef GetHotelDetailsInvoke = Future<Result<HotelEntity>> Function(String id);
typedef GetHotelsInvoke = Future<Result<List<HotelEntity>>> Function({int page, int pageSize, String query});

/// Fetches details for a specific hotel from the server
class GetHotelDetailsUsecase {
  GetHotelDetailsUsecase(this._hotelRepo);
  final HotelRepository _hotelRepo;

  GetHotelDetailsInvoke get invoke => _hotelRepo.getHotelDetails;
}

/// Fetches a list of all hotels from the server
class GetHotelsUsecase {
  GetHotelsUsecase(this._hotelRepo);
  final HotelRepository _hotelRepo;

  Future<Result<List<HotelEntity>>> Function({int page, int pageSize, String query}) get invoke => _hotelRepo.getHotels;
}
