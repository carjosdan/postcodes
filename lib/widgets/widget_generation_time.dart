import 'package:flutter/material.dart';
import 'package:postcodes/features/constants/app_strings.dart';
import 'package:postcodes/styles/app_styles.dart';

class WidgetGenerationTime extends StatelessWidget {
  const WidgetGenerationTime({super.key, required this.generationtimeMs});
  final double generationtimeMs;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .end,
      children: [
        Text(AppStrings.searchTime),
        AppStyles.sizedBoxWidth8,
        Text('${generationtimeMs.toStringAsFixed(4)} ms'),
      ],
    );
  }
}
