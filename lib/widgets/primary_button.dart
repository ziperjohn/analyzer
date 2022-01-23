import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function action;
  final String text;
  final IconData? icon;

  const PrimaryButton({Key? key, required this.action, required this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const shape = StadiumBorder();

    if (icon == null) {
      return Material(
        color: Colors.transparent,
        shape: shape,
        elevation: 8,
        child: Container(
          decoration: const ShapeDecoration(
            shape: shape,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF493DD9),
                Color(0xFF9E20D8),
              ],
            ),
          ),
          child: ElevatedButton(
            onPressed: () => action(),
            child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 45),
                shape: shape,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                primary: Colors.transparent,
                shadowColor: Colors.transparent),
          ),
        ),
      );
    } else {
      return Material(
        color: Colors.transparent,
        shape: shape,
        elevation: 8,
        child: Container(
          decoration: const ShapeDecoration(
            shape: shape,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF493DD9),
                Color(0xFF9E20D8),
              ],
            ),
          ),
          child: ElevatedButton.icon(
            onPressed: () => action(),
            label: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
            icon: Icon(icon, size: 17),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 45),
                shape: shape,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                primary: Colors.transparent,
                shadowColor: Colors.transparent),
          ),
        ),
      );
    }
  }
}
