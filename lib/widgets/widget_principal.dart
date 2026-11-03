import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/styles/app_styles.dart';
import 'package:postcodes/widgets/widget_balloons.dart';
import 'package:postcodes/widgets/widget_card.dart';
import 'package:postcodes/widgets/widget_generation_time.dart';
import 'package:postcodes/widgets/widget_post_codes.dart';

class WidgetPrincipal extends StatelessWidget {
  const WidgetPrincipal({
    super.key,
    required this.place,
    required this.generationtimeMs,
  });

  final DataPlace place;
  final double generationtimeMs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetBalloons(place: place),

        AppStyles.sizedBoxHeight16,

        WidgetPostCodes(place: place),

        AppStyles.sizedBoxHeight8,

        WidgetCard(place: place),

        AppStyles.sizedBoxHeight32,

        WidgetGenerationTime(generationtimeMs: generationtimeMs),

        AppStyles.dividerBlack,
      ],
    );
  }
}
