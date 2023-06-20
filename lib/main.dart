import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:lucyinthesky_rates/api_client/api_client.dart';
import 'package:lucyinthesky_rates/service/currency_service.dart';
import 'package:lucyinthesky_rates/service/rate_service.dart';
import 'package:lucyinthesky_rates/service/user_config.dart';
import 'package:lucyinthesky_rates/views/main_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final providers = await configureApp();
  runApp(MultiProvider(
    providers: providers,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lucyinthesky Rates',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

Future<List<Provider>> configureApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  final dio = Dio(BaseOptions(
    baseUrl: 'https://openexchangerates.org/api',
    connectTimeout: const Duration(seconds: 20),
    sendTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
  ))
    ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.queryParameters['app_id'] = FlutterConfig.get('APP_ID');
      handler.next(options);
    }));
  final apiClient = ApiClient(dio);

  return [
    Provider<UserConfig>(create: (_) => UserConfig()),
    Provider<RateService>(create: (_) => RateService(apiClient)),
    Provider<CurrencyService>(create: (_) => CurrencyService(apiClient)),
  ];
}
