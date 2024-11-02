// ignore_for_file: avoid_print

import 'dart:developer';

/// this class is responsible for printing the text on the screen with color
class AppPrinter {
  /// green ANSI color code
  static const green = '\x1B[32m';

  /// red ANSI color code
  static const red = '\x1B[31m';

  /// yellow ANSI color code
  static const yellow = '\x1B[33m';

  /// reset ANSI color code
  static const reset = '\x1B[0m';

  /// prints the string with a color specified by the user
  static void printError(Object? text) {
    log('$red $text $reset');
  }

  /// this is for printing without a new line
  static void printter(Object? text) {
    log('$yellow $text $reset');
  }

  /// this is for printing without a new line
  static void printSuccess(Object? text) {
    log('$green$text$reset');
  }
}
