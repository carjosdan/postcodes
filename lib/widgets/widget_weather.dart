import 'package:flutter/material.dart';
import 'package:postcodes/features/widget_card_metric.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/models/weather_response.dart';
import 'package:postcodes/styles/app_styles.dart';
import 'package:postcodes/utils/weather_helpers.dart';
import 'package:postcodes/services/weather_service.dart';
import 'package:postcodes/features/constants/app_strings.dart';
import 'package:postcodes/widgets/messages/widget_fail_result_weather.dart';

class WidgetWeather extends StatefulWidget {
  const WidgetWeather({super.key, required this.place});
  final DataPlace place;

  @override
  State<WidgetWeather> createState() => _WidgetWeatherState();
}

class _WidgetWeatherState extends State<WidgetWeather> {
  late final Future<WeatherResponse> _weatherFuture;
  final _weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    // Almacenamos el Future en el estado para evitar llamadas HTTP duplicadas al redibujar
    _weatherFuture = _weatherService.getWeather(
      widget.place.latitude.toString(),
      widget.place.longitude.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherResponse>(
      future: _weatherFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: WidgetFailResultWeather());
        }

        final weather = snapshot.data?.results;
        if (weather == null || weather.isEmpty) {
          return const Center(child: Text(AppStrings.noWeatherData));
        }

        final current = weather.first;

        return Padding(
          padding: AppStyles.edgeInsetsSymetric258,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppStyles.sizedBoxHeight8,
              CardMetricItem(
                icon: Icons.thermostat,
                title: AppStrings.temperatureLabel,
                value:
                    '${current.temperature2M.toStringAsFixed(1)} ${AppStrings.temperatureUnit}',
              ),
              CardMetricItem(
                icon: Icons.cloud,
                title: AppStrings.weatherConditionLabel,
                value: codeWeatherToDescription(current.weatherCode),
              ),
              CardMetricItem(
                icon: Icons.air,
                title: AppStrings.windSpeedLabel,
                value:
                    '${current.windSpeed10M.toStringAsFixed(1)} ${AppStrings.windSpeedUnit}',
              ),
            ],
          ),
        );
      },
    );
  }
}
