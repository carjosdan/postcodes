import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/styles/app_styles.dart';
import 'package:postcodes/features/widget_card_metric.dart';
import 'package:postcodes/widgets/widget_weather.dart';
import 'package:postcodes/features/constants/app_strings.dart';

class WidgetCard extends StatelessWidget {
  const WidgetCard({super.key, required this.place});

  final DataPlace place;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppStyles.whiteRGB,
      elevation: 16,
      shape: AppStyles.roundedBorder,
      child: Padding(
        padding: AppStyles.edgeInsetsSymetric258,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppStyles.sizedBoxHeight16,

            // Primera fila de métricas (Población y Elevación)
            CardMetricItem(
              icon: Icons.groups,
              title: AppStrings.populationMetricLabel,
              value: place.formattedPopulation,
            ),
            CardMetricItem(
              icon: Symbols.altitude,
              title: AppStrings.elevationMetricLabel,
              value: place.formattedElevation,
            ),
            AppStyles.sizedBoxHeight8,

            // Segunda fila de métricas (Coordenadas y Zona Horaria)
            CardMetricItem(
              icon: Icons.place,
              title: AppStrings.coordinatesLabel,
              value:
                  '${AppStrings.latitudePrefix} ${place.latitude}\n${AppStrings.longitudePrefix} ${place.longitude}',
            ),
            CardMetricItem(
              icon: Icons.schedule,
              title: AppStrings.timeZoneMetricLabel,
              value: place.timezone ?? AppStrings.unavailableValue,
            ),

            WidgetWeather(place: place),

            AppStyles.sizedBoxHeight26,
          ],
        ),
      ),
    );
  }
}
