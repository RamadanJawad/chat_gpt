import 'package:chat_gpt/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: ColorApp.cardColor,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    dividerColor: Colors.black12,
  );
  final darkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: ColorApp.scaffoldBackgroundColor,
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
      ),
      inputDecorationTheme:
          const InputDecorationTheme(suffixIconColor: Colors.black),
      dividerColor: Colors.white54,
      appBarTheme: const AppBarTheme(
        color: ColorApp.cardColor,
      ));
  final _getStorage = GetStorage();

  final _darkThemeKey = "isDarkTheme";
  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSavedDarkMode());
  }
}
