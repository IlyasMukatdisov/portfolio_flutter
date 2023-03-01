import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static void setUiOverlay(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: isDarkMode == true ? Colors.black : Colors.white,
          statusBarIconBrightness:
              isDarkMode == true ? Brightness.light : Brightness.dark),
    );
  }
}
