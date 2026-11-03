import 'package:postcodes/features/constants/app_strings.dart';

String codeWeatherToDescription(int codeWeather) {
  return switch (codeWeather) {
    0 => AppStrings.clearSky,
    1 || 2 || 3 => AppStrings.fewClouds,
    45 || 48 => AppStrings.fog,
    51 || 67 => AppStrings.rain,
    71 || 77 => AppStrings.snow,
    80 || 82 => AppStrings.showers,
    85 || 86 => AppStrings.snowShowers,
    95 || 99 => AppStrings.thunderstorm,
    _ => AppStrings.unknownWeather,
  };
}
