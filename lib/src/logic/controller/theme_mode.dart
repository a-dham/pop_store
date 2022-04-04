import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Themes {
  final GetStorage getStorage = GetStorage();
  final String key = 'DarkMode';
  saveThemeDataInBox(bool value) {
    getStorage.write(key, value);
  }

  bool getThemeDataFromBox() {
    return getStorage.read<bool>(key) ?? false;
  }

  ThemeMode get themeDataGet =>
      getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  getThemeMode() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeDataInBox(!getThemeDataFromBox());
  }
}
