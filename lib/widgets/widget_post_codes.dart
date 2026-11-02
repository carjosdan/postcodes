import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/styles/app_styles.dart';

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
      style: AppStyles.sectTitle,
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
                AppStyles.sizedBoxHeight8,
                Text(
                  displayedPostcodes,
                  textAlign: TextAlign.center,
                  style: AppStyles.textMediumBoldBlue,
                ),
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titlePostCodes,
              AppStyles.sizedBoxHeight8,
              Text(postcodes.join(", "), style: AppStyles.textMediumBoldBlue),
            ],
          ); // Texto normal

    // ------------------------------;
  }
}
