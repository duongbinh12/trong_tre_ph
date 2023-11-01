import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ComponentUtils {

  static void setStatusBarBrightness(Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: brightness,
        statusBarIconBrightness:
        brightness == Brightness.light ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness:
        brightness == Brightness.light ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: brightness == Brightness.light
            ? Colors.black.withOpacity(0.4)
            : Colors.white.withOpacity(0.1),
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent));
  }
}
