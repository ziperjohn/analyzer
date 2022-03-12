import 'package:analyzer_app/widgets/big_spacer.dart';
import 'package:analyzer_app/widgets/small_spacer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/services/auth_service.dart';
import 'package:analyzer_app/widgets/custom_text_field.dart';
import 'package:analyzer_app/widgets/primary_button.dart';
import 'package:analyzer_app/widgets/secondary_button.dart';
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
                      //TODO refactore
                      action: () {
                        bool isValid = AuthService().passwordValidation(
                            context, _passwordController.text, _confirmPasswordController.text);
                        if (isValid) {
                          AuthService().signUp(context, _emailController.text, _passwordController.text);
                        }
                      },
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
}
