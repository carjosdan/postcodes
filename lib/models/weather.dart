// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

class Weather {
  final String time;
  final int interval;
  final double temperature2M;
  final int weatherCode;
  final double windSpeed10M;

  Weather({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.weatherCode,
    required this.windSpeed10M,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    time: json["time"],
    interval: json["interval"],
    temperature2M: json["temperature_2m"]?.toDouble(),
    weatherCode: json["weather_code"],
    windSpeed10M: json["wind_speed_10m"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2M,
    "weather_code": weatherCode,
    "wind_speed_10m": windSpeed10M,
  };
}

class WeatherUnits {
  final String time;
  final String interval;
  final String temperature2M;
  final String weatherCode;
  final String windSpeed10M;

  WeatherUnits({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.weatherCode,
    required this.windSpeed10M,
  });

  factory WeatherUnits.fromJson(Map<String, dynamic> json) => WeatherUnits(
    time: json["time"],
    interval: json["interval"],
    temperature2M: json["temperature_2m"],
    weatherCode: json["weather_code"],
    windSpeed10M: json["wind_speed_10m"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2M,
    "weather_code": weatherCode,
    "wind_speed_10m": windSpeed10M,
  };
}
