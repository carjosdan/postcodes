import 'package:flutter/material.dart';
import 'package:postcodes/styles/app_styles.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:postcodes/features/constants/app_strings.dart';
import 'package:postcodes/features/widget_welcome_metric.dart';

class WidgetWelcome extends StatelessWidget {
  const WidgetWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppStyles.edgeInsets16,
      elevation: 16,
      color: AppStyles.grey,
      shape: AppStyles.roundedBorder,
      child: Padding(
        padding: AppStyles.edgeInsets8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppStyles.sizedBoxHeight16,
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: AppStyles.primary),
                AppStyles.sizedBoxWidth16,
                Expanded(
                  child: Text(
                    AppStrings.welcomeTitle,
                    style: AppStyles.bigSecondaryTitle,
                  ),
                ),
              ],
            ),
            AppStyles.sizedBoxHeight16,
            Text(AppStrings.welcomeDescription, style: AppStyles.textSize16),
            AppStyles.sizedBoxHeight16,
            WelcomeTip(
              icon: Icons.search,
              text: AppStrings.postalCodeSearchTip,
            ),
            AppStyles.sizedBoxHeight8,
            WelcomeTip(
              icon: Icons.edit_note,
              text: AppStrings.minimumSearchLengthTip,
            ),
            AppStyles.sizedBoxHeight8,
            WelcomeTip(
              icon: Icons.info_outline,
              text: AppStrings.placeDetailsTip,
            ),
            AppStyles.sizedBoxHeight16,
            Text(
              AppStrings.placeIconsDescription,
              style: AppStyles.textMediumBold,
            ),
            AppStyles.sizedBoxHeight8,
            WelcomeTip(icon: Icons.groups, text: AppStrings.populationLabel),
            AppStyles.sizedBoxHeight8,
            WelcomeTip(icon: Symbols.altitude, text: AppStrings.altitudeLabel),
            AppStyles.sizedBoxHeight8,
            WelcomeTip(icon: Icons.place, text: AppStrings.locationLabel),
            AppStyles.sizedBoxHeight8,
            WelcomeTip(icon: Icons.schedule, text: AppStrings.timeZoneLabel),
            AppStyles.sizedBoxHeight8,
            WelcomeTip(
              icon: Icons.device_thermostat,
              text: AppStrings.temperatureDegrees,
            ),
            WelcomeTip(icon: Icons.cloud, text: AppStrings.weatherCondition),
            WelcomeTip(icon: Icons.air, text: AppStrings.windSpeed),
            AppStyles.sizedBoxHeight26,
          ],
        ),
      ),
    );
  }
}
