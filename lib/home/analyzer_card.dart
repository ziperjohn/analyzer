import 'package:analyzer_app/analyzer/analyzer_screen.dart';
import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/services/firestore_service.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:analyzer_app/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AnalyzerCard extends StatelessWidget {
  final int analyzerIndex;

  const AnalyzerCard({Key? key, required this.analyzerIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final analyzerList = Provider.of<List<Analyzer>>(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: surfaceColor,
      child: ListTile(
        title: Text(analyzerList[analyzerIndex].name),
        subtitle: analyzerList[analyzerIndex].place == "" ? null : Text(analyzerList[analyzerIndex].place),
        trailing: IconButton(
          onPressed: () async {
            final remove = await showRemoveAnalyzer(context);
            if (remove == true) {
              FirestoreService().deleteAnalyzer(analyzerList[analyzerIndex].id,
                  analyzerList[analyzerIndex].name, analyzerList[analyzerIndex].place);
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
              builder: (BuildContext context) => AnalyzerScreen(analyzerIndex: analyzerIndex),
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
