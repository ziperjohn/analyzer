// ignore_for_file: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:analyzer/models/analyzer_model.dart';
import 'package:analyzer/providers/analyzer_provider.dart';
import 'package:analyzer/theme/colors.dart';
import 'package:analyzer/widgets/custom_alert_dialog.dart';
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
              context.read<AnalyzerProvider>().removeAnalyzer(analyzer.id);
            }
          },
          icon: const Icon(
            FontAwesomeIcons.trash,
            color: primaryColor,
          ),
        ),
        onTap: () => print(analyzer.id),
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
