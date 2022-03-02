import 'package:analyzer_app/localization/error_localization.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:another_flushbar/flushbar.dart';
import "package:another_flushbar/flushbar_route.dart" as route;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<dynamic> showFlushbar(BuildContext context, String code, bool isError) {
  final locale = AppLocalizations.of(context);
  var _route = route.showFlushbar(
    context: context,
    flushbar: Flushbar(
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      messageText: Text(ErrorLocalization().parseErrorCodeToLocaleString(locale!, code),
          style: const TextStyle(color: whiteColor)),
      backgroundColor: primaryColor,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(10),
      duration: const Duration(seconds: 5),
      icon: Icon(
        isError ? FontAwesomeIcons.exclamation : FontAwesomeIcons.check,
        color: isError ? redColor : greenColor,
      ),
    ),
  );
  return Navigator.push(context, _route);
}
