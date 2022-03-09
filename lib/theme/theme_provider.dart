import 'package:analyzer_app/services/user_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = UserSharedPreferences.getThemeMode();

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode newTheme) {
    _themeMode = newTheme;
    UserSharedPreferences.setThemeMode(newTheme);
    notifyListeners();
  }

  String getThemeToString(AppLocalizations locale) {
    switch (_themeMode) {
      case ThemeMode.dark:
        return locale.dark;
      case ThemeMode.light:
        return locale.light;
      case ThemeMode.system:
        return locale.system;
      default:
        return locale.error;
    }
  }
}
