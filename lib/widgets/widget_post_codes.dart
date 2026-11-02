import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';

class WidgetPostCodes extends StatefulWidget {
  const WidgetPostCodes({super.key, required this.data});
  final DataPlace data;

  @override
  State<WidgetPostCodes> createState() => _WidgetPostCodesState();
}

class _WidgetPostCodesState extends State<WidgetPostCodes> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final postcodes = widget.data.postcodes;
    final hasManyPostcodes = postcodes.length > 3;
    final displayedPostcodes = (_isExpanded || !hasManyPostcodes)
        ? postcodes.join(", ")
        : '${postcodes.take(3).join(", ")}... (ver más)';

    final Text titlePostCodes = Text(
      'Códigos Postales',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
    return
    // --- CODIGO POSTAL EXPANDIBLE ---
    hasManyPostcodes
        ? GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded; // Alterna el estado de expansión
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titlePostCodes,
                SizedBox(height: 6),
                Text(
                  displayedPostcodes,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titlePostCodes,
              SizedBox(height: 6),
              Text(
                postcodes.join(", "),
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ); // Texto normal

    // ------------------------------;
  }
}
