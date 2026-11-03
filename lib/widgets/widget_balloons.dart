import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/styles/app_styles.dart';

class WidgetBalloons extends StatelessWidget {
  const WidgetBalloons({super.key, required this.place});
  final DataPlace place;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: AppStyles.edgeInsetsSymetric124,
          decoration: AppStyles.boxDecorationGrey,
          child: Text(place.admin1.toString(), style: AppStyles.textSmallBold),
        ),

        AppStyles.sizedBoxHeight8,

        Container(
          padding: AppStyles.edgeInsetsSymetric124,
          decoration: AppStyles.boxDecorationGrey,
          child: Text(place.admin2.toString(), style: AppStyles.textSmallBold),
        ),
      ],
    );
  }
}
