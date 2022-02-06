import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/services/auth_service.dart';
import 'package:analyzer_app/services/package_info_service.dart';
import 'package:analyzer_app/settings/language_bottom_sheet.dart';
import 'package:analyzer_app/settings/settings_card.dart';
import 'package:analyzer_app/settings/theme_bottom_sheet.dart';
import 'package:analyzer_app/theme/theme_provider.dart';
import 'package:analyzer_app/widgets/loading_indicator.dart';
import 'package:analyzer_app/widgets/primary_button.dart';
import 'package:analyzer_app/widgets/title_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = AuthService().user;
    final _themeProvider = Provider.of<ThemeProvider>(context);
    final _analyzerListProvider = Provider.of<List<Analyzer>>(context);

    return FutureBuilder(
      future: PackageInfoService().getAppVersion(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData && _user != null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Settings"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleList(title: "Appearance & language"),
                    SettingsCard(
                      title: "Theme",
                      subtitle: _themeProvider.getThemeToString(),
                      onPressed: () => showThemeBottomSheet(context),
                    ),
                    SettingsCard(
                      title: "Language",
                      subtitle: "English",
                      onPressed: () => showLanguageBottomSheet(context),
                    ),
                    const TitleList(title: "Personal info"),
                    SettingsCard(title: "Email", subtitle: _user.email!, onPressed: () {}),
                    SettingsCard(title: "Password", subtitle: "*******", onPressed: () {}),
                    SettingsCard(
                        title: "Number of analyzers",
                        subtitle: _analyzerListProvider.length.toString(),
                        onPressed: () {}),
                    const SizedBox(height: 10),
                    Center(
                      child: PrimaryButton(
                        action: () => AuthService().signOut(context),
                        text: "Sign Out",
                        icon: FontAwesomeIcons.signOutAlt,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                        child: Text("App version: ${snapshot.data}",
                            style: Theme.of(context).textTheme.caption)),
                    const SizedBox(height: 20),
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

  showThemeBottomSheet(BuildContext context) =>
      showModalBottomSheet(context: context, builder: (context) => const ThemeBottomSheet());

  showLanguageBottomSheet(BuildContext context) =>
      showModalBottomSheet(context: context, builder: (context) => const LanguageBottomSheet());
}
