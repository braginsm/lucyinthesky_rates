import 'package:lucyinthesky_rates/api_client/api_client.dart';

class CurrencyService {
  CurrencyService(this.apiClient);

  final ApiClient apiClient;

  Future<Map<String, String>> getAvailable() => apiClient.getCurrencies();
}
