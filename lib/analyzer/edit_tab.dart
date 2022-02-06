import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/services/firestore_service.dart';
import 'package:analyzer_app/widgets/custom_text_field.dart';
import 'package:analyzer_app/widgets/primary_button.dart';
import 'package:analyzer_app/widgets/title_list.dart';
import 'package:flutter/material.dart';

class EditTab extends StatelessWidget {
  final Analyzer analyzer;
  const EditTab({Key? key, required this.analyzer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController(text: analyzer.name);
    final TextEditingController _placeController = TextEditingController(text: analyzer.place);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleList(title: "Name"),
            CustomTextField(
              controller: _nameController,
              hintText: "Name",
              isPassword: false,
              isEmail: false,
              autoFocus: false,
            ),
            const TitleList(title: "Place"),
            CustomTextField(
              controller: _placeController,
              hintText: "Place",
              isPassword: false,
              isEmail: false,
              autoFocus: false,
            ),
            const SizedBox(height: 10),
            Center(
              child: PrimaryButton(
                  action: () => FirestoreService()
                      .updateAnalyzer(analyzer.id, _nameController.text, _placeController.text),
                  text: "Save"),
            )
          ],
        ),
      ),
    );
  }
}
