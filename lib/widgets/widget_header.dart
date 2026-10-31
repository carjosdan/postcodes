import 'package:flutter/material.dart';
import 'package:postcodes/styles/app_styles.dart';

class WidgetHeader extends StatelessWidget {
  const WidgetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppStyles.primary,
      foregroundColor: AppStyles.onPrimary,
      title: Text('POSTCODES'),
      actions: [
        // Espacio para posibles Iconos de la cabecera
      ],
    );
  }
}
