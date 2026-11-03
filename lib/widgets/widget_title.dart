import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/styles/app_styles.dart';

class WidgetTitle extends StatelessWidget {
  const WidgetTitle({super.key, required this.place});
  final DataPlace place;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.edgeInsetsOnlytopbottom16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '${place.name}, ${place.countryCode}',
              style: AppStyles.bigTitle,
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
