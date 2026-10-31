import 'package:flutter/material.dart';
import 'package:postcodes/screens/search_result_screen.dart';
import 'package:postcodes/utils/console_logger.dart';

void main() {
  consoleLoggerDebug('postcodes');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: SearchResultScreen()));
  }
}
