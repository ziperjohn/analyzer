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

    if (_reauthenticationProvider.isReauthenticated) {
      return changePassword ? const ChangePassword() : const ChangeEmail();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Authenticate"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleList(title: "Email"),
              CustomTextField(
                controller: _emailController,
                hintText: "Email",
                isPassword: false,
                isEmail: true,
                icon: FontAwesomeIcons.solidEnvelope,
                autoFocus: false,
              ),
              const TitleList(title: "Password"),
              CustomTextField(
                controller: _passwordController,
                hintText: "Password",
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
                  text: "Authenticate",
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Change email"),
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
            const TitleList(title: "New email"),
            CustomTextField(
              controller: _emailController,
              hintText: "New email",
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
                text: "Change",
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Change password"),
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
            const TitleList(title: "New password"),
            CustomTextField(
              controller: _passwordController,
              hintText: "New password",
              isPassword: true,
              isEmail: false,
              icon: FontAwesomeIcons.key,
              autoFocus: false,
            ),
            const TitleList(title: "Confirm new password"),
            CustomTextField(
              controller: _confirmPasswordController,
              hintText: "Confirm new password",
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
                text: "Change",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
