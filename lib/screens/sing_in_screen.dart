import 'package:analyzer/services/auth_service.dart';
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
    return Scaffold(
      backgroundColor: Color(0xFF1C1C29),
      // resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/wave.svg",
              alignment: Alignment.topCenter,
            ),
            CustomTextField(controller: emailController, hintText: "Email", isPassword: false),
            CustomTextField(controller: passwordController, hintText: "Password", isPassword: true),
            PrimaryButton(
              action: () => AuthService().signIn(context, emailController.text, passwordController.text),
              text: "Sign In",
              icon: FontAwesomeIcons.signInAlt,
            ),
            const Text("Don't have an account yet?"),
            SecondaryButton(action: () => Navigator.pushNamed(context, '/singUp'), text: "Sign Up")
          ],
        ),
      ),
    );
  }
}
