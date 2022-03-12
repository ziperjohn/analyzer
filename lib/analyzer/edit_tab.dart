import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/widgets/big_spacer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/services/firestore_service.dart';
import 'package:analyzer_app/widgets/custom_text_field.dart';
import 'package:analyzer_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class EditTab extends StatelessWidget {
  final AnalyzerModel analyzer;
  const EditTab({Key? key, required this.analyzer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController(text: analyzer.name);
    final TextEditingController _placeController = TextEditingController(text: analyzer.place);
    final TextEditingController _ipAddressController = TextEditingController(text: analyzer.ipAddress);
    final TextEditingController _portController = TextEditingController(text: analyzer.port);
    final _locale = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TitleList(title: _locale!.name),
            CustomTextField(
              controller: _nameController,
              hintText: _locale!.name,
              isPassword: false,
              isEmail: false,
              autoFocus: false,
            ),
            const BigSpacer(),
            CustomTextField(
              controller: _placeController,
              hintText: _locale.place,
              isPassword: false,
              isEmail: false,
              autoFocus: false,
            ),
            const BigSpacer(),
            CustomTextField(
              controller: _ipAddressController,
              hintText: _locale.ipAddress,
              isPassword: false,
              isEmail: false,
              autoFocus: false,
            ),
            // TitleList(title: _locale.port),
            const BigSpacer(),
            CustomTextField(
              controller: _portController,
              hintText: _locale.port,
              isPassword: false,
              isEmail: false,
              autoFocus: false,
            ),
            const BigSpacer(),
            Center(
              child: PrimaryButton(
                  action: () => FirestoreService().updateAnalyzer(analyzer.id, _nameController.text,
                      _placeController.text, _ipAddressController.text, _portController.text),
                  text: _locale.save),
            )
          ],
        ),
      ),
    );
  }
}
