import 'package:get_it/get_it.dart';
import 'package:weather_app/core/network/api_service.dart';
import 'package:weather_app/data/home/repo/home_api_service.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<ApiService>(ApiService());
  sl.registerSingleton<HomeApiService>(HomeApiServiceImpl());
}
