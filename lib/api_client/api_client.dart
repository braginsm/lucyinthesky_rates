import 'package:dio/dio.dart';
import 'package:lucyinthesky_rates/model/rates/rates.dart';

class ApiClient {
  ApiClient(this.dio);
  final Dio dio;

  Future<Rates> getLatestList({
    List<String> symbols = const [],
  }) async {
    final response = await dio.get(
      '/latest.json',
      queryParameters: {'symbols': symbols.join(',')},
    );

    return Rates.fromJson(response.data);
  }

  Future<Rates> getDateList({
    required String date,
    List<String> symbols = const [],
  }) async {
    final response = await dio.get(
      '/historical/$date.json',
      queryParameters: {'symbols': symbols.join(',')},
    );

    return Rates.fromJson(response.data);
  }

  Future<Map<String, String>> getCurrencies() async {
    final response = await dio.get('/currencies.json');

    return Map<String, String>.from(response.data);
  }
}
