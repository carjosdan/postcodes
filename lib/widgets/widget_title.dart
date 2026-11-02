import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';

class WidgetTitle extends StatefulWidget {
  const WidgetTitle({super.key, required this.data});
  final DataPlace data;
  @override
  State<WidgetTitle> createState() => _WidgetTitleState();
}

class _WidgetTitleState extends State<WidgetTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.data.name,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 11, 10, 10),
          ),
        ),
        Text(
          ', ${widget.data.countryCode}',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 11, 10, 10),
          ),
        ),
      ],
    );
  }
}
