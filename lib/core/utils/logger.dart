import 'package:flutter/foundation.dart';

/// Very small, dependency-free logger used across repositories/services.
///
/// Keep this file lightweight so it works on all platforms (Web included).
class Logger {
  static void debug(String message) {
    debugPrint('[DEBUG] $message');
  }

  static void info(String message) {
    debugPrint('[INFO] $message');
  }

  static void warn(String message, {Object? error, StackTrace? stackTrace}) {
    debugPrint('[WARN] $message');
    if (error != null) debugPrint('       error: $error');
    if (stackTrace != null) debugPrint('       stack: $stackTrace');
  }

  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    debugPrint('[ERROR] $message');
    if (error != null) debugPrint('        error: $error');
    if (stackTrace != null) debugPrint('        stack: $stackTrace');
  }
}
