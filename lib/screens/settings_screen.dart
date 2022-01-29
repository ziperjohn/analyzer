import 'package:analyzer/services/auth_service.dart';
import 'package:analyzer/widgets/loading_indicator.dart';
import 'package:analyzer/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = AuthService().user;

    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(user.email ?? ""),
              PrimaryButton(
                action: () => AuthService().signOut(context),
                text: "Sign Out",
                icon: FontAwesomeIcons.signOutAlt,
              ),
            ],
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: LoadingIndicator(),
      );
    }
  }
}
