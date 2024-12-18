import 'package:core/core.dart';

class HotelRepositoryImpl extends BaseApi implements HotelRepository {
  HotelRepositoryImpl(this._hotelApi);
  final HotelApiDataSource _hotelApi;

  @override
  Future<Result<HotelEntity>> getHotelDetails(String id) async {
    return call(() async {
      final model = await _hotelApi.getHotelDetails(id);
      return model.toEntity();
    });
  }

  @override
  Future<Result<List<HotelEntity>>> getHotels({int page = 1, int pageSize = 20, String query = ''}) async {
    return call(() async {
      final model = await _hotelApi.getHotels(page: page, pageSize: pageSize, query: query);
      return model.map((e) => e.toEntity()).toList();
    });
  }
}
