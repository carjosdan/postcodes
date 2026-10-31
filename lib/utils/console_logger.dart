import 'package:flutter/foundation.dart';

void consoleLoggerDebug(String name) {
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  } else {
    debugPrint = (String? message, {int? wrapWidth}) {
      final lines = '$message'.split('\n').map((line) => '[$name] $line');
      debugPrintThrottled(lines.join('\n'), wrapWidth: wrapWidth);
    };
  }
}
