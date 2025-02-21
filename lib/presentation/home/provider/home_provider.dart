import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/common/utils/snackbar_message.dart';
import 'package:weather_app/data/home/model/weather_model.dart';
import 'package:weather_app/data/home/repo/home_api_service.dart';
import 'package:weather_app/service_locator.dart';

class HomeProvider extends ChangeNotifier {
  Future<WeatherModel>? _currentWeather;
  String _currentLocation = "";
  PermissionStatus? _locationPermission;
  bool _searchShow = false;

  Future<WeatherModel>? get currentWeather => _currentWeather;
  String get currentLocation => _currentLocation;
  PermissionStatus? get locationPermission => _locationPermission;
  bool get searchShow => _searchShow;

  Future<void> initialize(BuildContext context) async {
    if (context.mounted) {
      await _checkPermission(context);
    }
    if (context.mounted) {
      await _getCurrentLocation(context);
    }
  }

  /// Check location permission and fetch location
  Future<void> _checkPermission(context) async {
    _locationPermission = await Permission.location.request();
    if (_locationPermission!.isGranted) {
      if (context.mounted) {
        await _getCurrentLocation(context);
      }
    } else if (locationPermission!.isPermanentlyDenied) {
      if (context.mounted) {
        showCustomSnackBar(
          context,
          "Permission is permanently denied",
          action: SnackBarAction(
            label: "Settings",
            onPressed: () async {
              await openAppSettings();
            },
          ),
        );
      }
    } else if (locationPermission!.isDenied) {
      _locationPermission = await Permission.location.request();
    }
  }

  /// Fetch current location
  Future<void> _getCurrentLocation(BuildContext context) async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placeMark = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placeMark[0];

      String location = "${place.locality}";
      _currentLocation = location;

      _currentWeather = sl<HomeApiService>().fetchWeatherForecast(
        location: currentLocation,
      );
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        showCustomSnackBar(context, "Failed to get location: $e");
      }
    }
  }
}
