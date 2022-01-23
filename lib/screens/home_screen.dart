import 'package:analyzer/services/auth_service.dart';
import 'package:analyzer/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: PrimaryButton(
          action: () => AuthService().signOut(context),
          text: "Sign Out",
          icon: FontAwesomeIcons.signOutAlt,
        ),
      ),
    );
  }
}
