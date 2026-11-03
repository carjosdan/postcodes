import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:postcodes/models/weather_response.dart';
import 'package:postcodes/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherService weatherService = WeatherService();

  WeatherResponse _weatherResponse = WeatherResponse(results: const []);
  String? _error;
  int _requestId = 0;

  WeatherResponse get weatherResponse => _weatherResponse;
  String? get error => _error;

  Future<WeatherResponse> getWeather(String value) async {
    final requestId = ++_requestId;
    final city = value.trim();

    if (city.isEmpty) {
      _weatherResponse = WeatherResponse(results: const []);
      _error = null;
      notifyListeners();
      return _weatherResponse;
    }

    _error = null;
    notifyListeners();

    final result = await weatherService.getWeather(city, '');

    if (requestId == _requestId) {
      _weatherResponse = result;
      debugPrint(jsonEncode(result.toJson()));
      notifyListeners();
    }

    return result;
  }

  void clearWeather() {
    ++_requestId;
    _weatherResponse = WeatherResponse(results: const []);
    _error = null;
    notifyListeners();
  }
}
