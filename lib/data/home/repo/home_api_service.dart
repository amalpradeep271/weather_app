import 'package:weather_app/core/constants/api_urls.dart';
import 'package:weather_app/core/network/api_service.dart';
import 'package:weather_app/data/home/model/alert_model.dart';
import 'package:weather_app/data/home/model/weather_model.dart';

abstract class HomeApiService {
  Future<WeatherModel> fetchWeatherForecast({
    String? location,
    String? latitude,
    String? longitude,
  });
  Future<AlertModel> fetchAlertMessage({String? location});
}

class HomeApiServiceImpl extends HomeApiService {
  @override
  Future<WeatherModel> fetchWeatherForecast({
    String? location,
    String? latitude,
    String? longitude,
  }) async {
    String url;
    if (latitude != null && longitude != null) {
      url = ApiUrls.getForecastByLatLong(latitude, longitude);
    } else if (location != null) {
      url = ApiUrls.getForecast(location);
    } else {
      throw Exception("Either location or latitude.longitude must be provided");
    }
    final response = await ApiService.get(url);
    return WeatherModel.fromJson(response);
  }

  @override
  Future<AlertModel> fetchAlertMessage({String? location}) async {
    String? url;
    if (location != null) {
      url = ApiUrls.getWeatherAlert(location);
    }
    final response = await ApiService.get(url!);
    return AlertModel.fromJson(response);
  }
}
