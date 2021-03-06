import 'package:analyzer_app/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/services/services.dart';
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
                PrimaryButton(
                    action: () => AuthService().resetPassword(context, _emailController.text),
                    text: _locale.send_email,
                    icon: FontAwesomeIcons.solidEnvelope),
                const SmallSpacer(),
                SecondaryButton(
                  action: () => Navigator.pop(context),
                  text: _locale.back,
                  icon: FontAwesomeIcons.chevronLeft,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
