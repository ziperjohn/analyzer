import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmButtonLabel;
  final bool haveSecondButton;

  const CustomAlertDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.haveSecondButton,
      required this.confirmButtonLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _locale = AppLocalizations.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: _textTheme.headline4),
            const SizedBox(height: 5),
            const Divider(thickness: 1, color: lightGrayColor),
            const SizedBox(height: 5),
            Text(content, style: _textTheme.bodyText1),
            const SizedBox(height: 5),
            haveSecondButton
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        style: TextButton.styleFrom(primary: secondaryColor),
                        child: Text(_locale!.cancel),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text(confirmButtonLabel),
                      )
                    ],
                  )
                : Center(
                    child: TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(confirmButtonLabel),
                  ))
          ],
        ),
      ),
    );
  }
}
