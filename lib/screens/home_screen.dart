import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:analyzer_app/widgets/custom_text_field_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
              onPressed: () async {
                final name = await showAddAnalyzer(context);
                if (name == null || name.isEmpty) return;
                // TODO call firestore function add
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My analyzers",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 20),
            CardList()
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

class CardList extends StatelessWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final analyzerList = Provider.of<List<Analyzer>>(context);

    analyzerList.forEach((analyzer) {
      print(analyzer.name);
    });

    return Text('ss');
  }
}
