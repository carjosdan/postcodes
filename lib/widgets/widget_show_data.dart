import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';

class WidgetShowData extends StatefulWidget {
  const WidgetShowData.name({super.key, required this.data});

  final List<DataPlace> data;

  @override
  State<WidgetShowData> createState() => _WidgetShowDataState();
}

class _WidgetShowDataState extends State<WidgetShowData> {
  @override
  Widget build(BuildContext context) {
    final data = jsonEncode(
      widget.data.map((place) => place.toJson()).toList(),
    );

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [Text(data)],
    );
  }
}
