import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/services/firestore_service.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:analyzer_app/list/analyzer_card.dart';
import 'package:analyzer_app/widgets/custom_text_field_dialog.dart';
import 'package:analyzer_app/widgets/title_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);
    final _analyzerListProvider = Provider.of<List<AnalyzerModel>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_locale!.list),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _analyzerListProvider.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: TitleList(title: _locale.my_analyzers),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: AnalyzerCard(analyzerIndex: index),
                ),
              ],
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: AnalyzerCard(analyzerIndex: index),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => onPressedAddButton(context, _locale),
        child: const Icon(
          FontAwesomeIcons.plus,
          color: whiteColor,
        ),
      ),
    );
  }

  onPressedAddButton(BuildContext context, AppLocalizations locale) async {
    final name = await showAddAnalyzer(context, locale);
    if (name == null || name.isEmpty) return;
    FirestoreService().addAnalyzer(name);
  }

  Future<String?> showAddAnalyzer(BuildContext context, AppLocalizations locale) => showDialog<String>(
        context: context,
        builder: (BuildContext context) => CustomTextFieldDialog(
          title: locale.create_analyzer,
          confirmButtonLabel: locale.create,
          hintText: locale.name,
        ),
      );
}
