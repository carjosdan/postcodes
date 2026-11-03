import 'package:flutter/material.dart';
import 'package:postcodes/styles/app_styles.dart';

class WelcomeTip extends StatelessWidget {
  const WelcomeTip({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppStyles.primary),
        AppStyles.sizedBoxWidth8,
        Expanded(child: Text(text, style: AppStyles.textSize16)),
      ],
    );
  }
}
