import 'package:analyzer_app/services/auth_service.dart';
import 'package:analyzer_app/widgets/custom_text_field.dart';
import 'package:analyzer_app/widgets/flushbar.dart';
import 'package:analyzer_app/widgets/primary_button.dart';
import 'package:analyzer_app/widgets/title_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();
    final _locale = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_locale!.change_email),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleList(title: _locale.new_password),
            CustomTextField(
              controller: _passwordController,
              hintText: _locale.new_password,
              isPassword: true,
              isEmail: false,
              icon: FontAwesomeIcons.key,
              autoFocus: false,
            ),
            TitleList(title: _locale.confirm_new_password),
            CustomTextField(
              controller: _confirmPasswordController,
              hintText: _locale.confirm_new_password,
              isPassword: true,
              isEmail: false,
              icon: FontAwesomeIcons.key,
              autoFocus: false,
            ),
            const SizedBox(height: 10),
            Center(
              child: PrimaryButton(
                action: () =>
                    onPressedChangeButton(context, _passwordController.text, _confirmPasswordController.text),
                text: _locale.change,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressedChangeButton(BuildContext context, String password, String confirmPassword) async {
    bool isPasswordMatched = AuthService().passwordValidation(context, password, confirmPassword);
    if (isPasswordMatched) {
      bool isCorrect = await AuthService().changePassword(context, password);
      if (isCorrect) {
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        showFlushbar(context, "password_changed", false);
      }
    }
  }
}
