import 'package:analyzer_app/models/models.dart';
import 'package:analyzer_app/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/services/services.dart';
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
    final TextEditingController _keyController = TextEditingController(text: analyzer.key);
    final _locale = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const BigSpacer(),
            CustomTextField(
              controller: _portController,
              hintText: _locale.port,
              isPassword: false,
              isEmail: false,
              autoFocus: false,
            ),
            const BigSpacer(),
            CustomTextField(
                controller: _keyController,
                hintText: _locale.key,
                isPassword: true,
                isEmail: false,
                autoFocus: false),
            const BigSpacer(),
            PrimaryButton(
                action: () => FirestoreService().updateAnalyzer(
                    context,
                    analyzer.id,
                    _nameController.text,
                    _placeController.text,
                    _ipAddressController.text,
                    _portController.text,
                    _keyController.text),
                text: _locale.save)
          ],
        ),
      ),
    );
  }
}
