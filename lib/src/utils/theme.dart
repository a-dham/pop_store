import 'package:flutter/material.dart';
import 'package:pop_store/src/utils/constant.dart';

class ThemeApp {
  static final ThemeData light = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: kmaincolor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
  );

  static final ThemeData dark = ThemeData(
    backgroundColor: Colors.black,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey,
  );
}
