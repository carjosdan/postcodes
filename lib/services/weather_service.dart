//import 'dart:io';

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:postcodes/models/weather_response.dart';

class WeatherService {
  final baseUrl = 'https://api.open-meteo.com/v1';
  final configVars = 'current=temperature_2m,weather_code,wind_speed_10m';

  Future<String> getBody(String path) async {
    final uri = Uri.parse('$baseUrl/forecast?$path');
    final http.Response response = await http.get(uri);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpException(
        'Request failed with status ${response.statusCode}: ${response.reasonPhrase}',
      );
    }

    return response.body;
  }

  Future<WeatherResponse> getWeather(String latitude, String longitude) async {
    final body = await getBody(
      'latitude=$latitude&longitude=$longitude&$configVars',
    );
    return weatherResponseFromJson(body);
  }
}
