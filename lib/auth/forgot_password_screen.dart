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

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);
    final _emailController = TextEditingController();

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
                  _locale!.forgot_password,
                  style: Theme.of(context).textTheme.headline2,
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
                Center(
                  child: PrimaryButton(
                      action: () => AuthService().resetPassword(context, _emailController.text),
                      text: _locale.send_email,
                      icon: FontAwesomeIcons.solidEnvelope),
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
          )
        ]),
      ),
    );
  }
}
