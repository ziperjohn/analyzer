import 'package:analyzer_app/localization/l10n.dart';
import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = const Locale("en");

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  String getLocaleToString() {
    if (_locale.languageCode == "cs") {
      return "Čeština";
    } else {
      return "English";
    }
  }
}
