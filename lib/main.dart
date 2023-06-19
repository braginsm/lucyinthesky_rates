import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get_it/get_it.dart';
import 'package:lucyinthesky_rates/api_client/api_client.dart';
import 'package:lucyinthesky_rates/service/user_config.dart';
import 'package:lucyinthesky_rates/views/main_page.dart';

Future<void> main() async {
  await configureApp();
  runApp(const MyApp());
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

Future<void> configureApp() async {
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
  final userConfig = UserConfig();

  GetIt.I.registerSingleton<ApiClient>(apiClient);
  GetIt.I.registerSingleton<UserConfig>(userConfig);
}
