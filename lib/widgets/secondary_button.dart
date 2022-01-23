import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Function action;
  final String text;
  final IconData? icon;

  const SecondaryButton(
      {Key? key, required this.action, required this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return OutlinedButton(
        onPressed: () => action(),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      );
    } else {
      return OutlinedButton.icon(
        onPressed: () => action(),
        icon: Icon(icon, size: 17),
        label: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      );
    }
  }
}
