import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/screens/analyzer_screen.dart';
import 'package:analyzer_app/services/firestore_service.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:analyzer_app/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  final Analyzer analyzer;

  const CustomCard({Key? key, required this.analyzer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: surfaceColor,
      child: ListTile(
        title: Text(analyzer.name),
        trailing: IconButton(
          onPressed: () async {
            final remove = await showRemoveAnalyzer(context);
            if (remove == true) {
              FirestoreService().deleteAnalyzer(analyzer.id, analyzer.name, analyzer.place);
            }
          },
          icon: const Icon(
            FontAwesomeIcons.trash,
            color: primaryColor,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => AnalyzerScreen(analyzer: analyzer),
            ),
          );
        },
      ),
    );
  }

  Future<bool?> showRemoveAnalyzer(BuildContext context) => showDialog<bool>(
        context: context,
        builder: (BuildContext context) => const CustomAlertDialog(
          title: "Remove Analyzer",
          content: "Do you really want to remove the analyzer?",
          confirmButtonLabel: "Remove",
        ),
      );
}
