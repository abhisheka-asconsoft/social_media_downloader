import 'package:logger/logger.dart';

class Console {
  Console._();

  static final Console _instance = Console._();
  static Logger? _logger;

  static Console get log => _instance;

  static Logger? get logger => _logger;

  initialize() {
    _logger = Logger();
  }

  debug(String message) {
    _logger!.d(message);
  }

  error(String message) {
    _logger!.e(message);
  }

  verbose(String message) {
    _logger!.v(message);
  }

  info(String message) {
    _logger!.i(message);
  }

  warning(String message) {
    _logger!.w(message);
  }

  wtf(String message) {
    _logger!.wtf(message);
  }
}
