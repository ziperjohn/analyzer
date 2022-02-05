import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onPressed;

  const SettingsCard({Key? key, required this.title, required this.subtitle, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () => onPressed(),
      ),
    );
  }
}
