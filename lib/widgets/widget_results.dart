import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/widgets/widget_show_texts.dart';

class WidgetResults extends StatefulWidget {
  const WidgetResults.name({super.key, required this.data});
  final List<DataPlace> data;

  @override
  State<WidgetResults> createState() => _WidgetResultsState();
}

class _WidgetResultsState extends State<WidgetResults> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: widget.data.map((place) {
        return ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  place.name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 11, 10, 10),
                  ),
                ),
                Text(
                  ', ${place.countryCode}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 11, 10, 10),
                  ),
                ),
              ],
            ),
          ), // NOMBRE Y CÓDIGO DEL LUGAR
          subtitle: WidgetShowTexts(data: place),
          //trailing: Padding(),
        );
      }).toList(),
    );
  }
}
