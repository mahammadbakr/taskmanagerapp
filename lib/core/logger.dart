import 'package:logger/logger.dart';

class LoggerApp {
  static final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
    ),
  );
}
