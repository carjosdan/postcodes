import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:postcodes/features/constants/app_strings.dart';
import 'package:postcodes/styles/app_styles.dart';

class WidgetFailResultWeather extends StatelessWidget {
  const WidgetFailResultWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AppStyles.styleIconDangerRed(Symbols.dangerous),
          AppStyles.sizedBoxHeight4,
          Text(AppStrings.errorShowWeather, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
