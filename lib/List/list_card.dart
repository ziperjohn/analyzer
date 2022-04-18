import 'package:analyzer_app/analyzer/analyzer_screen.dart';
import 'package:analyzer_app/models/models.dart';
import 'package:analyzer_app/services/firestore_service.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:analyzer_app/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListCard extends StatelessWidget {
  final int analyzerIndex;

  const ListCard({Key? key, required this.analyzerIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _analyzerList = Provider.of<List<AnalyzerModel>>(context);
    final _locale = AppLocalizations.of(context);

    return Card(
      child: ListTile(
        title: Text(_analyzerList[analyzerIndex].name),
        subtitle: _analyzerList[analyzerIndex].place == "" ? null : Text(_analyzerList[analyzerIndex].place),
        trailing: IconButton(
          onPressed: () => onPressedCard(context, _locale!, _analyzerList),
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

  Future<void> onPressedCard(
      BuildContext context, AppLocalizations locale, List<AnalyzerModel> analyzerList) async {
    final remove = await showRemoveAnalyzer(context, locale);
    if (remove == true) {
      FirestoreService().deleteAnalyzer(
        analyzerList[analyzerIndex].id,
        analyzerList[analyzerIndex].name,
        analyzerList[analyzerIndex].place,
        analyzerList[analyzerIndex].ipAddress,
        analyzerList[analyzerIndex].port,
        analyzerList[analyzerIndex].key,
      );
    }
  }

  Future<bool?> showRemoveAnalyzer(BuildContext context, AppLocalizations locale) => showDialog<bool>(
        context: context,
        builder: (BuildContext context) => CustomAlertDialog(
          title: locale.remove_analyzer,
          content: locale.remove_analyzer_question,
          haveSecondButton: true,
          confirmButtonLabel: locale.remove,
        ),
      );
}
