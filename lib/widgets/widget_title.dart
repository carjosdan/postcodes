import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/styles/app_styles.dart';

class WidgetTitle extends StatefulWidget {
  const WidgetTitle({super.key, required this.data});
  final DataPlace data;
  @override
  State<WidgetTitle> createState() => _WidgetTitleState();
}

class _WidgetTitleState extends State<WidgetTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.edgeInsetsOnlytopbottom16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '${widget.data.name}, ${widget.data.countryCode}',
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
