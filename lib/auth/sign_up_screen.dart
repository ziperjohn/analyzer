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
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();
    TextTheme _textTheme = Theme.of(context).textTheme;

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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Welcome to ",
                      style: _textTheme.headline2,
                      children: [
                        TextSpan(text: "Analyzer", style: _textTheme.headline1),
                        TextSpan(text: "\nSign Up", style: _textTheme.headline2)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Email",
                    isPassword: false,
                    isEmail: true,
                    icon: FontAwesomeIcons.solidEnvelope,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: passwordController,
                    hintText: "Password",
                    isPassword: true,
                    isEmail: false,
                    icon: FontAwesomeIcons.key,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    isPassword: true,
                    isEmail: false,
                    icon: FontAwesomeIcons.key,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: PrimaryButton(
                      action: () => AuthService().passwordValidation(context, emailController.text,
                          passwordController.text, confirmPasswordController.text),
                      text: "Sign Up",
                      icon: FontAwesomeIcons.userPlus,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: SecondaryButton(
                      action: () => Navigator.pop(context),
                      text: "Back",
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
