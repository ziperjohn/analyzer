import 'package:analyzer/services/auth_service.dart';
import 'package:analyzer/widgets/custom_text_field.dart';
import 'package:analyzer/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
              child: Column(
                children: [
                  CustomTextField(controller: emailController, hintText: "Email", isPassword: false),
                  CustomTextField(controller: passwordController, hintText: "Password", isPassword: true),
                  CustomTextField(
                      controller: confirmPasswordController, hintText: "Confirm Password", isPassword: true),
                  PrimaryButton(
                    action: () => AuthService().passwordValidation(context, emailController.text,
                        passwordController.text, confirmPasswordController.text),
                    text: "Sign Up!",
                    icon: FontAwesomeIcons.userPlus,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
