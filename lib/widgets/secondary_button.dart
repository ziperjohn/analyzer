import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Function action;
  final String text;
  final IconData? icon;

  const SecondaryButton({Key? key, required this.action, required this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const shape = StadiumBorder();
    if (icon == null) {
      return OutlinedButton(
        onPressed: () => action(),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(220, 45),
          shape: shape,
          side: const BorderSide(
            width: 1,
            color: primaryColor,
          ),
        ),
      );
    } else {
      return OutlinedButton.icon(
        onPressed: () => action(),
        icon: Icon(icon, size: 17),
        label: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(220, 45),
          shape: shape,
          side: const BorderSide(
            width: 1,
            color: primaryColor,
          ),
        ),
      );
    }
  }
}
