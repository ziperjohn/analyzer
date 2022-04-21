import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onPressed;
  final bool hasIcon;

  const SettingsCard(
      {Key? key, required this.title, required this.subtitle, required this.onPressed, required this.hasIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () => onPressed(),
        trailing: hasIcon ? const Icon(FontAwesomeIcons.chevronRight, size: 17, color: primaryColor) : null,
      ),
    );
  }
}
