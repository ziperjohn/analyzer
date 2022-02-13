import 'package:analyzer_app/utils/user_shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = UserSharedPreferences.getThemeMode();

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode newTheme) {
    _themeMode = newTheme;
    UserSharedPreferences.setThemeMode(newTheme);
    notifyListeners();
  }

  String getThemeToString() {
    switch (_themeMode) {
      case ThemeMode.dark:
        return "Dark";
      case ThemeMode.light:
        return "Light";
      case ThemeMode.system:
        return "System";
      default:
        return "Error";
    }
  }
}
