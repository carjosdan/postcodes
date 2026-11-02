import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/styles/app_styles.dart';
import 'package:postcodes/widgets/widget_balloons.dart';
import 'package:postcodes/widgets/widget_card.dart';
import 'package:postcodes/widgets/widget_post_codes.dart';

class WidgetPrincipal extends StatefulWidget {
  const WidgetPrincipal({super.key, required this.data});
  final DataPlace data;

  @override
  State<WidgetPrincipal> createState() => _WidgetPrincipalState();
}

class _WidgetPrincipalState extends State<WidgetPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetBalloons(data: widget.data),

        AppStyles.sizedBoxHeight16,

        WidgetPostCodes(data: widget.data),

        AppStyles.sizedBoxHeight16,

        WidgetCard(data: widget.data),

        AppStyles.sizedBoxHeight16,

        AppStyles.dividerBlack,
      ],
    );
  }
}
