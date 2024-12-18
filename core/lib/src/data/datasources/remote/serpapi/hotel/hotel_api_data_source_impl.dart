import 'package:core/core.dart';

class Hotel {
  static const String getHotels = '/places';
  static const String getHotelDetails = '';
}

class HotelApiDataSourceImpl implements HotelApiDataSource {
  HotelApiDataSourceImpl(this._apiClient);
  final RestClient _apiClient;

  Future<K> _get<T, K>({
    required String endpoint,
    Map<String, dynamic>? data,
    required T Function(Map<String, dynamic>) fromJson,
    K Function(T)? fromResponse,
  }) async {
    final result = await _apiClient.get(endpoint, queryParameters: data);
    final response = fromJson(result.data);
    return fromResponse?.call(response) ?? response as K;
  }

  @override
  Future<List<HotelModel>> getHotels({
    int page = 1,
    int pageSize = 20,
    String query = '',
  }) async {
    return _get(
      endpoint: Hotel.getHotels,
      data: {
        'q': query,
        'start': (page - 1) * pageSize,
        'num': pageSize.toString(),
      },
      fromJson: (data) => List<HotelModel>.from(data['places'].map((e) => HotelModel.fromJson(e))),
    );
  }

  @override
  Future<HotelModel> getHotelDetails(String id) {
    return _get(
      endpoint: Hotel.getHotelDetails,
      data: {'id': id},
      fromJson: HotelModel.fromJson,
    );
  }
}
