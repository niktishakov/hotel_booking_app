import 'package:core/core.dart';

abstract class HotelRepository {
  Future<Result<List<HotelEntity>>> getHotels({int page, int pageSize, String query});
  Future<Result<HotelEntity>> getHotelDetails(String id);
}
