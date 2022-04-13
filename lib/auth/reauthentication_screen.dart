import 'package:analyzer_app/auth/change_email_screen.dart';
import 'package:analyzer_app/auth/change_password_screen.dart';
import 'package:analyzer_app/widgets/custom_alert_dialog.dart';
import 'package:analyzer_app/widgets/big_spacer.dart';
import 'package:analyzer_app/widgets/small_spacer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/services/auth_service.dart';
import 'package:analyzer_app/widgets/custom_text_field.dart';
import 'package:analyzer_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReauthenticationScreen extends StatelessWidget {
  final bool changePassword;
  const ReauthenticationScreen({Key? key, required this.changePassword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _locale = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_locale!.authenticate),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: _emailController,
              hintText: _locale.email,
              isPassword: false,
              isEmail: true,
              icon: FontAwesomeIcons.solidEnvelope,
              autoFocus: false,
            ),
            const BigSpacer(),
            CustomTextField(
              controller: _passwordController,
              hintText: _locale.password,
              isPassword: true,
              isEmail: false,
              icon: FontAwesomeIcons.key,
              autoFocus: false,
            ),
            const BigSpacer(),
            Center(
              child: PrimaryButton(
                action: () =>
                    onPreesedAuthenticateButton(context, _emailController.text, _passwordController.text),
                text: _locale.authenticate,
                icon: FontAwesomeIcons.rightToBracket,
              ),
            ),
            const SmallSpacer(),
            Center(
              child: TextButton(
                onPressed: () => showAlertDialog(context, _locale),
                child: Text(_locale.reauthentication),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPreesedAuthenticateButton(BuildContext context, String email, String password) async {
    bool isReauthenticated = await AuthService().reauthenticationUser(context, email, password);

    if (isReauthenticated) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              changePassword ? const ChangePasswordScreen() : const ChangeEmailScreen(),
        ),
      );
    }
  }

  Future<bool?> showAlertDialog(BuildContext context, AppLocalizations locale) => showDialog<bool>(
        context: context,
        builder: (BuildContext context) => CustomAlertDialog(
          title: locale.reauthentication,
          content: locale.reauthentication_text,
          haveSecondButton: false,
          confirmButtonLabel: locale.ok,
        ),
      );
}
