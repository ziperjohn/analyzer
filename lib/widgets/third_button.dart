import 'package:flutter/material.dart';

class ThirdButton extends StatelessWidget {
  final Function action;
  final String text;
  final IconData? icon;

  const ThirdButton({Key? key, required this.action, required this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return Center(
        child: TextButton(
          onPressed: () => action(),
          child: Text(text),
        ),
      );
    } else {
      return Center(
        child: TextButton.icon(
          onPressed: () => action(),
          label: Text(text),
          icon: Icon(icon),
        ),
      );
    }
  }
}
