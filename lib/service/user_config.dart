import 'package:shared_preferences/shared_preferences.dart';

class UserConfig {
  final _sharedPreference = SharedPreferences.getInstance();
  final _userCurrency = 'user_currency';
  final _currency = 'currency';

  Future<bool> saveCurrency(List<String> list) async {
    final preferences = await _sharedPreference;

    return preferences.setStringList(_currency, list);
  }

  Future<bool> saveUserCurrency(List<String> list) async {
    final preferences = await _sharedPreference;

    return preferences.setStringList(_userCurrency, list);
  }

  Future<List<String>?> getCurrency() async {
    final preferences = await _sharedPreference;

    return preferences.getStringList(_currency);
  }

  Future<List<String>?> getUserCurrency() async {
    final preferences = await _sharedPreference;

    return preferences.getStringList(_userCurrency);
  }
}
