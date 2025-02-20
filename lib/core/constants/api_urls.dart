class ApiUrls {
  static const apiKey = "3b92d2fa2dca4a04b5c63251252002";
  static const baseUrl = "http://api.weatherapi.com/v1";

  /// get weather location
  static String getWeatherUrl(String location) {
    return "$baseUrl/current.json?key=$apiKey&q=$location";
  }

  /// get current location by latitude and longitude
  static String getWeatherByLatLong(String latitude, String longitude) {
    return "$baseUrl/current.json?key=$apiKey&q=$latitude,$longitude";
  }

  /// get forecast for a location
  static String getForecast(String location) {
    return "$baseUrl/forecast.json?key=$apiKey&q=$location&days=15";
  }

  /// Get forecast by latitude and longitude
  static String getForecastByLatLong(String latitude, String longitude) {
    return "$baseUrl/forecast.json?key=$apiKey&q=$latitude,$longitude&days=15";
  }

  /// Search or autocomplete for a location
  static String searchLocation(String query) {
    return "$baseUrl/search.json?key=$apiKey&q=$query";
  }

  /// Get Historical Weather data
  static String getHistoryWeather(String location, String date) {
    return "$baseUrl/history.json?key=$apiKey&q=$location&dt=$date";
  }

  /// Get Weather alert for a location
  static String getWeatherAlert(String location) {
    return "$baseUrl/alerts.json?key=$apiKey&q=$location";
  }

  /// Get Marine Weather data
  static String getMarineData(String location, String date) {
    return "$baseUrl/marine.json?key=$apiKey&q=$location&dt=$date";
  }

  /// Get astronomy data for a location
  static String getAstronomyData(String location, String date) {
    return "$baseUrl/astronomy.json?key=$apiKey&q=$location&dt=$date";
  }
}
