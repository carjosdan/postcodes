import 'package:flutter/material.dart';
import 'package:postcodes/styles/app_styles.dart';

class CardMetricItem extends StatelessWidget {
  const CardMetricItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: -4),
      minVerticalPadding: 0,
      leading: AppStyles.styleIconCard(icon),
      title: Text(title),
      trailing: Text(value),
    );
  }
}
