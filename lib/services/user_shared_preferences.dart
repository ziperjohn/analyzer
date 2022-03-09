import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

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
