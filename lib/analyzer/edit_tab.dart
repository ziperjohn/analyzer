import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/services/firestore_service.dart';
import 'package:analyzer_app/widgets/custom_text_field.dart';
import 'package:analyzer_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class EditTab extends StatelessWidget {
  final Analyzer analyzer;
  const EditTab({Key? key, required this.analyzer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController placeController = TextEditingController();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextField(controller: nameController, hintText: "Name", isPassword: false, isEmail: false),
            CustomTextField(
                controller: placeController, hintText: "Place", isPassword: false, isEmail: false),
            PrimaryButton(
                action: () =>
                    FirestoreService().updateAnalyzer(analyzer.id, nameController.text, placeController.text),
                text: "Save")
          ],
        ),
      ),
    );
  }
}
