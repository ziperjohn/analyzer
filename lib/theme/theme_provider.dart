import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode newTheme) {
    _themeMode = newTheme;
    notifyListeners();
  }

  String getThemeToString() {
    String theme;
    switch (_themeMode) {
      case ThemeMode.dark:
        theme = "Dark";
        break;
      case ThemeMode.light:
        theme = "Light";
        break;
      case ThemeMode.system:
        theme = "System";
        break;
      default:
        theme = "Error";
    }

    return theme;
  }
}
