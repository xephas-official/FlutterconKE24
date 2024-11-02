// ignore_for_file: avoid_print

import 'app_printer.dart';

/// this function is responsible for printtering the text on the screen
/// it is named crinter as a short form for console printer
void crinter(
  Object? object, {
  bool isError = false,
  bool isSuccess = false,
}) {
 
  /// print the object
  if (isError) {
      AppPrinter.printError(object);
    } else if (isSuccess) {
      AppPrinter.printSuccess(object);
    } else {
      AppPrinter.printter(object);
    }
}
