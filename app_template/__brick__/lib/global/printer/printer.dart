// ignore_for_file: avoid_print, constant_identifier_names, public_member_api_docs

import 'package:flutter/foundation.dart';

import 'app_printer.dart';

/// this function is responsible for printtering the text on the screen
void printer(
  Object? object, {
  bool isError = false,
  bool isSuccess = false,
}) {
  /// print the object
  if (kDebugMode) {
    if (isError) {
      AppPrinter.printError(object);
    } else if (isSuccess) {
      AppPrinter.printSuccess(object);
    } else {
      AppPrinter.printter(object);
    }
  }
}
