import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lucyinthesky_rates/model/rates/rates.dart';
import 'package:lucyinthesky_rates/res/strings.dart';
import 'package:lucyinthesky_rates/service/rate_service.dart';
import 'package:lucyinthesky_rates/service/user_config.dart';
import 'package:lucyinthesky_rates/views/settings_page.dart';
import 'package:lucyinthesky_rates/views/widgets/currency_list_item.dart';
import 'package:lucyinthesky_rates/views/widgets/error_content.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final defaultCurrencies = ["USD", "EUR", "RUB"];

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
      final userConfig = context.read<UserConfig>();
      final rateService = context.read<RateService>();
      var items = await userConfig.getUserCurrency();
      if (items == null) {
        items = defaultCurrencies;
        userConfig.saveUserCurrency(defaultCurrencies);
      }
      final todayData = await rateService.getLatest(symbols: items);
      final yesterdayData = await rateService.getYesterday(symbols: items);
      setState(() {
        userCurrencies = items ?? [];
        listCurrencies = todayData;
        yesterdayCurrencies = yesterdayData;
      });
    } on DioException catch (e) {
      setState(() {
        userCurrencies = [];
        listCurrencies = null;
        yesterdayCurrencies = null;
        error = e.error.toString();
      });
    }
  }

  goToSettings() => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      ).then((_) => getUserCurrencies());
}
