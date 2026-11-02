import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/widgets/widget_principal.dart';
import 'package:postcodes/widgets/widget_title.dart';

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
          title: WidgetTitle(data: place), // NOMBRE Y CÓDIGO DEL LUGAR
          subtitle: WidgetPrincipal(data: place),
          //trailing: Padding(),
        );
      }).toList(),
    );
  }
}
