import 'package:lucyinthesky_rates/api_client/api_client.dart';
import 'package:lucyinthesky_rates/model/rates/rates.dart';
import 'package:lucyinthesky_rates/utils/formats.dart';

class RateService {
  RateService(this.apiClient);

  final ApiClient apiClient;

  Future<Rates> getLatest({List<String> symbols = const []}) =>
      apiClient.getLatestList(symbols: symbols);

  Future<Rates> getByDate({
    required DateTime date,
    List<String> symbols = const [],
  }) {
    final queryDate = dateApiFormat.format(date);

    return apiClient.getDateList(date: queryDate, symbols: symbols);
  }

  Future<Rates> getYesterday({List<String> symbols = const []}) => getByDate(
        symbols: symbols,
        date: DateTime.now().subtract(const Duration(days: 1)),
      );
}
