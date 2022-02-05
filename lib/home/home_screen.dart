import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/services/firestore_service.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:analyzer_app/home/analyzer_card.dart';
import 'package:analyzer_app/widgets/custom_text_field_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final analyzerList = Provider.of<List<Analyzer>>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
              onPressed: () async {
                final name = await showAddAnalyzer(context);
                if (name == null || name.isEmpty) return;
                FirestoreService().addAnalyzer(name);
              },
              icon: const Icon(
                FontAwesomeIcons.plus,
                color: primaryColor,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My analyzers",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: analyzerList.length,
                itemBuilder: (context, index) {
                  return AnalyzerCard(analyzerIndex: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> showAddAnalyzer(BuildContext context) => showDialog<String>(
        context: context,
        builder: (BuildContext context) => CustomTextFieldDialog(
          title: "Create Analyzer",
          confirmButtonLabel: "Create",
          hintText: "Name",
        ),
      );
}
