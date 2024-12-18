import 'package:core/core.dart';

abstract interface class HotelApiDataSource {
  Future<List<HotelModel>> getHotels({int page, int pageSize, String query});
  Future<HotelModel> getHotelDetails(String id);
}
