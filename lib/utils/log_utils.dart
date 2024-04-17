import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart' as foundation;

class LogUtils {
  static var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );

  static void logs(String log) {
    if (foundation.kDebugMode) {
      logger.d(log);
    }
  }
}
