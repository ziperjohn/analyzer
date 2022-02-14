import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/auth/reauthentication_provider.dart';
import 'package:analyzer_app/services/auth_service.dart';
import 'package:analyzer_app/widgets/custom_text_field.dart';
import 'package:analyzer_app/widgets/primary_button.dart';
import 'package:analyzer_app/widgets/title_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ReauthenticationScreen extends StatelessWidget {
  final bool changePassword;
  const ReauthenticationScreen({Key? key, required this.changePassword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _reauthenticationProvider = Provider.of<ReauthenticationProvider>(context);
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _locale = AppLocalizations.of(context);

    if (_reauthenticationProvider.isReauthenticated) {
      return changePassword ? const ChangePassword() : const ChangeEmail();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(_locale!.authenticate),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleList(title: _locale.email),
              CustomTextField(
                controller: _emailController,
                hintText: _locale.email,
                isPassword: false,
                isEmail: true,
                icon: FontAwesomeIcons.solidEnvelope,
                autoFocus: false,
              ),
              TitleList(title: _locale.password),
              CustomTextField(
                controller: _passwordController,
                hintText: _locale.password,
                isPassword: true,
                isEmail: false,
                icon: FontAwesomeIcons.key,
                autoFocus: false,
              ),
              const SizedBox(height: 10),
              Center(
                child: PrimaryButton(
                  action: () async {
                    bool isReauthenticated = await AuthService()
                        .reauthenticationUser(context, _emailController.text, _passwordController.text);

                    _reauthenticationProvider.setIsReauthenticated(isReauthenticated);
                  },
                  text: _locale.authenticate,
                  icon: FontAwesomeIcons.signInAlt,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _reauthenticationProvider = Provider.of<ReauthenticationProvider>(context);
    final _locale = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_locale!.change_email),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _reauthenticationProvider.setIsReauthenticated(false);
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleList(title: _locale.new_email),
            CustomTextField(
              controller: _emailController,
              hintText: _locale.new_email,
              isPassword: false,
              isEmail: true,
              icon: FontAwesomeIcons.solidEnvelope,
              autoFocus: false,
            ),
            const SizedBox(height: 10),
            Center(
              child: PrimaryButton(
                action: () async {
                  await AuthService().changeEmail(context, _emailController.text);
                  _reauthenticationProvider.setIsReauthenticated(false);
                  Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                },
                text: _locale.change,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _reauthenticationProvider = Provider.of<ReauthenticationProvider>(context);
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();
    final _locale = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_locale!.change_email),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _reauthenticationProvider.setIsReauthenticated(false);
            Navigator.pop(context);
          },
        ),
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
                action: () async {
                  bool isValid = AuthService()
                      .passwordValidation(context, _passwordController.text, _confirmPasswordController.text);
                  if (isValid) {
                    await AuthService().changePassword(context, _passwordController.text);
                    _reauthenticationProvider.setIsReauthenticated(false);
                    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                  }
                },
                text: _locale.change,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
