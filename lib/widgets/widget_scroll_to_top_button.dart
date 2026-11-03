import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:postcodes/styles/app_styles.dart';

class WidgetScrollToTopButton extends StatelessWidget {
  const WidgetScrollToTopButton({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppStyles.onPrimary,
      foregroundColor: AppStyles.primary,
      shape: const CircleBorder(),
      tooltip: 'button up',
      onPressed: () {
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      },
      child: const Icon(Symbols.stat_1),
    );
  }
}
