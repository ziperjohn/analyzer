import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/models/models.dart';
import 'package:analyzer_app/services/firestore_service.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:analyzer_app/list/list_card.dart';
import 'package:analyzer_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);
    final _analyzerListProvider = Provider.of<List<AnalyzerModel>>(context);

    return SafeArea(
      child: Scaffold(
        body: _analyzerListProvider.isEmpty ? const BodyWithoutData() : const BodyWithData(),
        floatingActionButton: AvatarGlow(
          endRadius: 45,
          glowColor: secondaryColor,
          repeatPauseDuration: const Duration(seconds: 5),
          child: FloatingActionButton(
            onPressed: () => onPressedAddButton(context, _locale!),
            child: const Icon(
              FontAwesomeIcons.plus,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onPressedAddButton(BuildContext context, AppLocalizations locale) async {
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

class BodyWithoutData extends StatelessWidget {
  const BodyWithoutData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: TitleList(title: _locale!.my_analyzers),
    );
  }
}

class BodyWithData extends StatelessWidget {
  const BodyWithData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _analyzerListProvider = Provider.of<List<AnalyzerModel>>(context);
    final _locale = AppLocalizations.of(context);
    return ListView.builder(
      itemCount: _analyzerListProvider.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: TitleList(title: _locale!.my_analyzers),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: ListCard(analyzerIndex: index),
              ),
            ],
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: ListCard(analyzerIndex: index),
        );
      },
    );
  }
}
