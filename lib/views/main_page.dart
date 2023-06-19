import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lucyinthesky_rates/api_client/api_client.dart';
import 'package:lucyinthesky_rates/model/rates/rates.dart';
import 'package:lucyinthesky_rates/res/strings.dart';
import 'package:lucyinthesky_rates/service/user_config.dart';
import 'package:lucyinthesky_rates/views/settings_page.dart';
import 'package:lucyinthesky_rates/views/widgets/currency_list_item.dart';
import 'package:lucyinthesky_rates/views/widgets/error_content.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final defaultCurrencies = ["USD", "EUR", "RUB"];
  final ApiClient apiClient = GetIt.I<ApiClient>();
  final UserConfig userConfig = GetIt.I<UserConfig>();

  Rates? listCurrencies;
  Rates? yesterdayCurrencies;
  List<String> userCurrencies = [];
  String? error;

  @override
  void initState() {
    super.initState();
    getUserCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(Strings.currencyRates),
        actions: [
          if (error == null)
            IconButton(
                onPressed: goToSettings, icon: const Icon(Icons.settings))
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: getUserCurrencies,
          child: listCurrencies == null || yesterdayCurrencies == null
              ? Center(
                  child: error == null
                      ? const CircularProgressIndicator.adaptive()
                      : ErrorContent(
                          description: error ?? '',
                          onReload: getUserCurrencies,
                        ),
                )
              : ListView.separated(
                  itemBuilder: (_, index) {
                    final item = userCurrencies[index];
                    final today = listCurrencies!.rates.entries
                        .firstWhere((e) => e.key == item);
                    final yesterday = yesterdayCurrencies!.rates.entries
                        .firstWhere((e) => e.key == item);

                    return CurrencyListItem(
                      title: today.key,
                      base: listCurrencies!.base,
                      today: today.value,
                      yesterday: yesterday.value,
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: userCurrencies.length,
                ),
        ),
      ),
    );
  }

  Future<void> getUserCurrencies() async {
    setState(() {
      error = null;
    });
    try {
      var items = await userConfig.getUserCurrency();
      if (items == null) {
        items = defaultCurrencies;
        userConfig.saveUserCurrency(defaultCurrencies);
      }
      final todayData = await apiClient.getLatestList(symbols: items);
      final yesterdayData = await apiClient.getDateList(
        symbols: items,
        date: DateTime.now().subtract(const Duration(days: 1)),
      );
      setState(() {
        userCurrencies = items ?? [];
        listCurrencies = todayData;
        yesterdayCurrencies = yesterdayData;
      });
    } catch (e) {
      setState(() {
        userCurrencies = [];
        listCurrencies = null;
        yesterdayCurrencies = null;
        error = e.toString();
      });
    }
  }

  goToSettings() => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      ).then((_) => getUserCurrencies());
}