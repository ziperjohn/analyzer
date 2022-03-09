import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlushbarLocalization {
  String parseErrorCodeToLocaleString(AppLocalizations locale, String code) {
    String formatedCode = code.replaceAll("-", "_");

    switch (formatedCode) {
      case "wrong_password":
        return locale.wrong_password;
      case "invalid_email":
        return locale.invalid_email;
      case "weak_password":
        return locale.weak_password;
      case "email_already_in_use":
        return locale.email_already_in_use;
      case "user_not_found":
        return locale.user_not_found;
      case "passwords_dont_match":
        return locale.passwords_dont_match;
      case "recovery_email_sent":
        return locale.recovery_email_sent;
      case "wrong_ip_error":
        return locale.wrong_ip_error;
      case "wrong_port_or_unavailable_server":
        return locale.wrong_port_or_unavailable_server;
      case "password_changed":
        return locale.password_changed;
      case "email_changed":
        return locale.email_changed;
      default:
        return locale.error;
    }
  }

  String findSubstringInErrorMessage(String error) {
    if (error.contains("Failed host lookup")) {
      return "wrong_ip_error";
    } else if (error.contains("Connection refused")) {
      return "wrong_port_or_unavailable_server";
    } else {
      return error;
    }
  }
}
