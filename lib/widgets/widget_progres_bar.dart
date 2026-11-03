import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:postcodes/styles/app_styles.dart';

class WidgetProgresBar extends StatelessWidget {
  const WidgetProgresBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Center(child: _ProgressActivity()),
    );
  }
}

class _ProgressActivity extends StatefulWidget {
  const _ProgressActivity();

  @override
  State<_ProgressActivity> createState() => _ProgressActivityState();
}

class _ProgressActivityState extends State<_ProgressActivity>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Icon(
        Symbols.progress_activity,
        size: 40,
        color: AppStyles.primary,
      ),
    );
  }
}
