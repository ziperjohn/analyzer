import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static bool get showAxisX => _preferences.getBool("showAxisX") ?? true;
  static bool get showAxisY => _preferences.getBool("showAxisY") ?? true;
  static bool get showGrid => _preferences.getBool("showGrid") ?? false;
  static bool get showDots => _preferences.getBool("showDots") ?? false;
  static bool get showAreaUnderChart => _preferences.getBool("showAreaUnderChart") ?? true;

  static set showAxisX(bool value) => _preferences.setBool("showAxisX", value);
  static set showAxisY(bool value) => _preferences.setBool("showAxisY", value);
  static set showGrid(bool value) => _preferences.setBool("showGrid", value);
  static set showDots(bool value) => _preferences.setBool("showDots", value);
  static set showAreaUnderChart(bool value) => _preferences.setBool("showAreaUnderChart", value);

  static Future<void> setLanguageCode(Locale locale) async {
    await _preferences.setString("languageCode", locale.languageCode);
  }

  static Locale getLanguageCode() {
    return Locale(_preferences.getString("languageCode") ?? "en");
  }

  static Future<void> setThemeMode(ThemeMode themeMode) async {
    switch (themeMode) {
      case ThemeMode.dark:
        await _preferences.setString("themeMode", "Dark");
        break;
      case ThemeMode.light:
        await _preferences.setString("themeMode", "Light");
        break;
      case ThemeMode.system:
        await _preferences.setString("themeMode", "System");
        break;
      default:
        return;
    }
  }

  static ThemeMode getThemeMode() {
    switch (_preferences.getString("themeMode")) {
      case "Dark":
        return ThemeMode.dark;
      case "Light":
        return ThemeMode.light;
      case "System":
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }
}
