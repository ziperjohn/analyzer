import 'package:analyzer/theme/colors.dart';
import 'package:analyzer/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  final String name;
  const CustomCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: surfaceColor,
      child: ListTile(
        title: Text(name),
        trailing: IconButton(
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => const CustomAlertDialog(
              title: "Remove Analyzer",
              content: "Do you really want to remove the analyzer?",
              confirmButtonLabel: "Remove",
            ),
          ),
          icon: const Icon(
            FontAwesomeIcons.trash,
            color: primaryColor,
          ),
        ),
        onTap: () => {},
      ),
    );
  }
}
