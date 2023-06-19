import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lucyinthesky_rates/api_client/api_client.dart';
import 'package:lucyinthesky_rates/res/strings.dart';
import 'package:lucyinthesky_rates/service/user_config.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final ApiClient apiClient = GetIt.I<ApiClient>();
  final UserConfig userConfig = GetIt.I<UserConfig>();
  var _currencies = <(String, String)>[];
  var _userCurrency = <String>[];

  @override
  void initState() {
    super.initState();
    getCurrencies();
  }

  Widget proxyDecorator(Widget child, int index, Animation<double> animation) =>
      AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final theme = Theme.of(context);
          final animValue = Curves.easeInOut.transform(animation.value);
          final elevation = lerpDouble(0, 6, animValue)!;
          return Material(
            elevation: elevation,
            color: theme.colorScheme.surface,
            shadowColor: theme.colorScheme.shadow,
            child: child,
          );
        },
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(Strings.settings),
        actions: [TextButton(onPressed: onSave, child: Text(Strings.save))],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: getCurrencies,
          child: _currencies.isEmpty
              ? const Center(child: CircularProgressIndicator.adaptive())
              : ReorderableListView.builder(
                  proxyDecorator: proxyDecorator,
                  onReorder: onReorder,
                  itemCount: _currencies.length,
                  itemBuilder: (_, index) {
                    final (key, description) = _currencies[index];

                    return ListTile(
                      key: Key(key),
                      title: Text(key),
                      subtitle: Text(description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Switch.adaptive(
                            value: _userCurrency.contains(key),
                            onChanged: (value) => onChangeItem(key, value),
                          ),
                          ReorderableDragStartListener(
                            index: index,
                            child: const Icon(Icons.drag_handle),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  Future<void> getCurrencies() async {
    final items = await apiClient.getCurrencies();
    final userCurrency = await userConfig.getUserCurrency() ?? [];
    final currentCurrencies = await userConfig.getCurrency() ?? [];
    final newCurrencies = items.entries.map((e) => (e.key, e.value)).toList()
      ..sort((a, b) => currentCurrencies
          .indexOf(a.$1)
          .compareTo(currentCurrencies.indexOf(b.$1)));
    setState(() {
      _currencies = newCurrencies;
      _userCurrency = userCurrency;
    });
  }

  onChangeItem(String key, bool value) async {
    setState(() {
      if (value && !_userCurrency.contains(key)) {
        _userCurrency.add(key);
      }
      if (!value && _userCurrency.contains(key)) {
        _userCurrency.remove(key);
      }
    });
  }

  onReorder(int oldIndex, int newIndex) async {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = _currencies.removeAt(oldIndex);
      _currencies.insert(newIndex, item);
    });
  }

  onSave() async {
    await userConfig.saveCurrency(_currencies.map((e) => e.$1).toList());
    await userConfig.saveUserCurrency(
      _userCurrency.where((element) => _userCurrency.contains(element)).toList()
        ..sort(
          (a, b) => _currencies
              .indexWhere((e) => e.$1 == a)
              .compareTo(_currencies.indexWhere((e) => e.$1 == b)),
        ),
    );
  }
}
