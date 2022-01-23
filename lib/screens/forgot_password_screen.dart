import 'package:analyzer/services/auth_service.dart';
import 'package:analyzer/widgets/custom_text_field.dart';
import 'package:analyzer/widgets/primary_button.dart';
import 'package:analyzer/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SvgPicture.asset(
            "assets/wave/wave3.svg",
            alignment: Alignment.topCenter,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forgot Password?",
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  isPassword: false,
                  isEmail: true,
                  icon: FontAwesomeIcons.solidEnvelope,
                ),
                const SizedBox(height: 20),
                Center(
                  child: PrimaryButton(
                      action: () => AuthService().resetPassword(context, emailController.text),
                      text: "Send Email",
                      icon: FontAwesomeIcons.solidEnvelope),
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
          )
        ]),
      ),
    );
  }
}
