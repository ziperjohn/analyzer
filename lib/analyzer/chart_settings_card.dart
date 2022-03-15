import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';

class ChartSettingsCard extends StatelessWidget {
  final String title;
  final bool value;
  final Function onChange;

  const ChartSettingsCard({Key? key, required this.title, required this.value, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Switch(
          activeColor: primaryColor,
          onChanged: (newValue) => onChange(newValue),
          value: value,
        ),
      ),
    );
  }
}
