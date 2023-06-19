import 'package:dio/dio.dart';
import 'package:lucyinthesky_rates/model/rates/rates.dart';
import 'package:lucyinthesky_rates/utils/formats.dart';

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
    required DateTime date,
    List<String> symbols = const [],
  }) async {
    final queryDate = dateApiFormat.format(date);
    final response = await dio.get(
      '/historical/$queryDate.json',
      queryParameters: {'symbols': symbols.join(',')},
    );

    return Rates.fromJson(response.data);
  }

  Future<Map<String, String>> getCurrencies() async {
    final response = await dio.get('/currencies.json');

    return Map<String, String>.from(response.data);
  }
}
