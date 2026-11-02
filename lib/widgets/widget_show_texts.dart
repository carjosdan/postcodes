import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/widgets/widget_card.dart';
import 'package:postcodes/widgets/widget_post_codes.dart';

class WidgetShowTexts extends StatefulWidget {
  const WidgetShowTexts({super.key, required this.data});
  final DataPlace data;

  @override
  State<WidgetShowTexts> createState() => _WidgetShowTextsState();
}

class _WidgetShowTextsState extends State<WidgetShowTexts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 0.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 220, 224, 226),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.data.admin1.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.data.admin2.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(height: 16),
        const Divider(
          color: Colors.blueGrey, // Color de la línea
          thickness: .6, // Grosor de la línea
        ),
        WidgetPostCodes(data: widget.data),
        SizedBox(height: 16),
        WidgetCard(data: widget.data),
        SizedBox(height: 16),
      ],
    );
  }
}
