import 'package:analyzer_app/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/wave/wave2.svg",
              alignment: Alignment.topCenter,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: _locale!.welcome_to,
                      style: _textTheme.headline2,
                      children: [
                        TextSpan(text: _locale.analyzer, style: _textTheme.headline1),
                        TextSpan(text: "\nSign Up", style: _textTheme.headline2)
                      ],
                    ),
                  ),
                  const BigSpacer(),
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
                  CustomTextField(
                    controller: _confirmPasswordController,
                    hintText: _locale.confirm_password,
                    isPassword: true,
                    isEmail: false,
                    icon: FontAwesomeIcons.key,
                    autoFocus: false,
                  ),
                  const BigSpacer(),
                  Center(
                    child: PrimaryButton(
                      action: () => onPressedSignUpButton(context, _locale, _emailController.text,
                          _passwordController.text, _confirmPasswordController.text),
                      text: _locale.sign_up,
                      icon: FontAwesomeIcons.userPlus,
                    ),
                  ),
                  const SmallSpacer(),
                  Center(
                    child: SecondaryButton(
                      action: () => Navigator.pop(context),
                      text: _locale.back,
                      icon: FontAwesomeIcons.chevronLeft,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onPressedSignUpButton(BuildContext context, AppLocalizations locale, String email,
      String password, String confirmPassword) async {
    bool isValid = AuthService().passwordValidation(context, password, confirmPassword);
    if (isValid) {
      AuthService().signUp(context, email, password);
    }
  }
}
