import 'package:analyzer/theme/colors.dart';
import 'package:analyzer/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomTextFieldDialog extends StatelessWidget {
  final String title;
  final String confirmButtonLabel;
  final String hintText;
  CustomTextFieldDialog(
      {Key? key, required this.title, required this.confirmButtonLabel, required this.hintText})
      : super(key: key);

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Dialog(
      backgroundColor: surfaceColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: _textTheme.headline2),
            const SizedBox(height: 5),
            const Divider(thickness: 1, color: lightGrayColor),
            const SizedBox(height: 5),
            CustomTextField(
                controller: textController, hintText: hintText, isPassword: false, isEmail: false),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(primary: secondaryColor),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
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