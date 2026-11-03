import 'package:flutter/material.dart';
import 'package:postcodes/styles/app_styles.dart';

class WidgetNoResutls extends StatelessWidget {
  const WidgetNoResutls({super.key});

  @override
  Widget build(BuildContext context) {
    final message =
        'No se encontró ningún lugar. Prueba con otro nombre o código postal.';
    return Padding(
      padding: AppStyles.edgeInsets8,
      child: Card(
        elevation: 4,
        color: AppStyles.warning,
        child: Padding(
          padding: AppStyles.edgeInsets8,
          child: Center(
            child: Column(
              children: [
                AppStyles.styleIconWarning(Icons.warning),
                AppStyles.sizedBoxHeight4,
                Text(message, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
