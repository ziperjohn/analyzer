import 'package:analyzer_app/services/auth_service.dart';
import 'package:analyzer_app/services/package_info_service.dart';
import 'package:analyzer_app/settings/settings_card.dart';
import 'package:analyzer_app/settings/theme_bottom_sheet.dart';
import 'package:analyzer_app/widgets/loading_indicator.dart';
import 'package:analyzer_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = AuthService().user;

    return FutureBuilder(
      future: PackageInfoService().getAppVersion(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData && user != null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Settings"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    SettingsCard(title: "Email", subtitle: user.email!, onPressed: () {}),
                    SettingsCard(title: "Password", subtitle: "*******", onPressed: () {}),
                    SettingsCard(
                      title: "Theme",
                      subtitle: "System",
                      onPressed: () => showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                          context: context,
                          builder: (context) => showSheet()),
                    ),
                    SettingsCard(title: "Language", subtitle: "English", onPressed: () {}),
                    SettingsCard(title: "App Version", subtitle: snapshot.data, onPressed: () {}),
                    PrimaryButton(
                      action: () => AuthService().signOut(context),
                      text: "Sign Out",
                      icon: FontAwesomeIcons.signOutAlt,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }

  Widget showSheet() {
    return ThemeBottomSheet();
  }
}
