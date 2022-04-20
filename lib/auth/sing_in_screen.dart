import 'package:analyzer_app/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/services/services.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/wave/wave1.svg",
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
                        TextSpan(text: "\nSign In", style: _textTheme.headline2)
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
                  PrimaryButton(
                    action: () =>
                        AuthService().signIn(context, _emailController.text, _passwordController.text),
                    text: _locale.sing_in,
                    icon: FontAwesomeIcons.signInAlt,
                  ),
                  const SmallSpacer(),
                  ThirdButton(
                    action: () => Navigator.pushNamed(context, "/forgotPassword"),
                    text: _locale.forgot_password,
                  ),
                  const Divider(
                    thickness: 1,
                    color: lightGrayColor,
                  ),
                  Center(
                    child: Text(_locale.dont_have_account, style: _textTheme.caption),
                  ),
                  const SmallSpacer(),
                  SecondaryButton(
                    action: () => Navigator.pushNamed(context, '/singUp'),
                    text: _locale.sign_up,
                    icon: FontAwesomeIcons.userPlus,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
