import 'package:analyzer_app/theme/colors.dart';
import 'package:analyzer_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTextFieldDialog extends StatelessWidget {
  final String title;
  final String confirmButtonLabel;
  final String hintText;

  const CustomTextFieldDialog(
      {Key? key, required this.title, required this.confirmButtonLabel, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
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
            const CustomDivider(),
            const SizedBox(height: 5),
            CustomTextField(
              controller: _textController,
              hintText: hintText,
              isPassword: false,
              isEmail: false,
              autoFocus: true,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(primary: secondaryColor),
                  child: Text(_locale!.cancel),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(_textController.text),
                  child: Text(confirmButtonLabel),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
