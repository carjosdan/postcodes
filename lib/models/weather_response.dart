import 'dart:convert';

import 'package:postcodes/models/weather.dart';

WeatherResponse weatherResponseFromJson(String str) {
  final decoded = json.decode(str);
  if (decoded is! Map<String, dynamic>) {
    throw const FormatException('Expected a JSON object in weather response.');
  }

  return WeatherResponse.fromJson(decoded);
}

String weatherResponseToJson(WeatherResponse data) =>
    json.encode(data.toJson());

class WeatherResponse {
  final List<Weather> results;

  WeatherResponse({required this.results});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final dynamic rawCurrent = json['current'];
    final dynamic rawResults = rawCurrent is Map ? rawCurrent : json['results'];
    final List<dynamic> resultsJson;

    if (rawResults is Map) {
      resultsJson = [rawResults];
    } else if (rawResults is Iterable) {
      resultsJson = List<dynamic>.from(rawResults);
    } else {
      resultsJson = const <dynamic>[];
    }

    return WeatherResponse(
      results: resultsJson
          .whereType<Map>()
          .map((item) => Weather.fromJson(Map<String, dynamic>.from(item)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'results': results.map((weather) => weather.toJson()).toList(),
  };
}
