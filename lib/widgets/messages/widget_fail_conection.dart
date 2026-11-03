import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:postcodes/styles/app_styles.dart';

class WidgetFailConection extends StatelessWidget {
  const WidgetFailConection({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.edgeInsets8,
      child: Card(
        elevation: 4,
        color: AppStyles.danger,
        child: Padding(
          padding: AppStyles.edgeInsets8,
          child: Center(
            child: Column(
              children: [
                AppStyles.styleIconDangerWhite(Symbols.dangerous),
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
