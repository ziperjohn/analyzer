import 'package:analyzer/services/auth_service.dart';
import 'package:analyzer/theme/colors.dart';
import 'package:analyzer/widgets/custom_text_field.dart';
import 'package:analyzer/widgets/primary_button.dart';
import 'package:analyzer/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingInScreen extends StatelessWidget {
  SingInScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

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
                        TextSpan(text: "\nSign In", style: _textTheme.headline2)
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
                  const SizedBox(height: 20),
                  Center(
                    child: PrimaryButton(
                      action: () =>
                          AuthService().signIn(context, emailController.text, passwordController.text),
                      text: "Sign In",
                      icon: FontAwesomeIcons.signInAlt,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pushNamed(context, "/singIn/forgotPassword"),
                      child: const Text("Forgot Password?"),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: greyColor,
                  ),
                  Center(
                    child: Text("Don't have an account yet?", style: _textTheme.caption),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: SecondaryButton(
                      action: () => Navigator.pushNamed(context, '/singIn/singUp'),
                      text: "Sign Up",
                      icon: FontAwesomeIcons.userPlus,
                    ),
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
