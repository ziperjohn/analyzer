import 'package:another_flushbar/flushbar.dart';
import "package:another_flushbar/flushbar_route.dart" as route;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<dynamic> showFlushbar(BuildContext context, String message) {
  var _route = route.showFlushbar(
    context: context,
    flushbar: Flushbar(
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      messageText: Text(message),
      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(10),
      duration: const Duration(seconds: 5),
      icon: const Icon(
        FontAwesomeIcons.exclamationTriangle,
        color: Colors.redAccent,
      ),
    ),
  );
  return Navigator.push(context, _route);
}
