import 'package:analyzer_app/services/services.dart';
import 'package:analyzer_app/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangeEmailScreen extends StatelessWidget {
  const ChangeEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _locale = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_locale!.change_email),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BigSpacer(),
            CustomTextField(
              controller: _emailController,
              hintText: _locale.new_email,
              isPassword: false,
              isEmail: true,
              icon: FontAwesomeIcons.solidEnvelope,
              autoFocus: false,
            ),
            const BigSpacer(),
            PrimaryButton(
              action: () => onPressedChangeButton(context, _emailController.text),
              text: _locale.change,
            ),
          ],
        ),
      ),
    );
  }

  void onPressedChangeButton(BuildContext context, String email) async {
    bool isCorrect = await AuthService().changeEmail(context, email);

    if (isCorrect) {
      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      showFlushbar(context, "email_changed", false);
    }
  }
}
