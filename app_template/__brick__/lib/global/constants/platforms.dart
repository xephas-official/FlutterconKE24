import 'package:flutter/foundation.dart';

/// check if the current platform is Windows
final bool isAppOnWindows = (defaultTargetPlatform == TargetPlatform.windows);

/// check if the current platform is Windows
final bool isAppOnAndroid = (defaultTargetPlatform == TargetPlatform.android);

/// check if the current platform is Windows
final bool isAppOniOs = (defaultTargetPlatform == TargetPlatform.iOS);

/// current platform
final String currentPlatform = defaultTargetPlatform.toString();

/// check if the current platform is Windows or Web
const bool isAppOnWeb = kIsWeb;

/// app is not on web
const bool isAppNotOnWeb = !isAppOnWeb;

/// check if the current platform is Windows or Web
final bool isAppOnWebOrWindows = isAppOnWindows || isAppOnWeb;

/// is not on web or windows
final bool isNotOnWebOrWindows = !isAppOnWebOrWindows;

///This variable declares that if we are on phone
///, no mouse region, else we gat a mouse region
final isPhone = isAppOnAndroid || isAppOniOs;

/// whether app is in debug mode
const bool isAppInDebugMode = kDebugMode;
