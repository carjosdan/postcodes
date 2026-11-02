import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/styles/app_styles.dart';

class WidgetBalloons extends StatefulWidget {
  const WidgetBalloons({super.key, required this.data});
  final DataPlace data;
  @override
  State<WidgetBalloons> createState() => _WidgetBalloonsState();
}

class _WidgetBalloonsState extends State<WidgetBalloons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: AppStyles.edgeInsetsSymetric124,
          decoration: AppStyles.boxDecorationGrey,
          child: Text(
            widget.data.admin1.toString(),
            style: AppStyles.textMediumBold,
          ),
        ),

        AppStyles.sizedBoxHeight8,

        Container(
          padding: AppStyles.edgeInsetsSymetric124,
          decoration: AppStyles.boxDecorationGrey,
          child: Text(
            widget.data.admin2.toString(),
            style: AppStyles.textMediumBold,
          ),
        ),
        AppStyles.sizedBoxHeight16,
      ],
    );
  }
}
