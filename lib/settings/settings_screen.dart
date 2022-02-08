import 'package:analyzer_app/auth/reauthentication_screen.dart';
import 'package:analyzer_app/localization/localization_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final _locale = AppLocalizations.of(context);
    final _user = AuthService().user;
    final _themeProvider = Provider.of<ThemeProvider>(context);
    final _localizationProvider = Provider.of<LocalizationProvider>(context);
    final _analyzerListProvider = Provider.of<List<Analyzer>>(context);

    return FutureBuilder(
      future: PackageInfoService().getAppVersion(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData && _user != null) {
          return Scaffold(
            appBar: AppBar(
              title: Text(_locale!.settings),
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
                      subtitle: _localizationProvider.getLocaleToString(),
                      onPressed: () => showLanguageBottomSheet(context),
                    ),
                    const TitleList(title: "Personal info"),
                    SettingsCard(
                      title: "Email",
                      subtitle: _user.email!,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ReauthenticationScreen(changePassword: false),
                          ),
                        );
                      },
                    ),
                    SettingsCard(
                      title: "Password",
                      subtitle: "*******",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ReauthenticationScreen(changePassword: true),
                          ),
                        );
                      },
                    ),
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
