import 'package:analyzer_app/auth/reauthentication_screen.dart';
import 'package:analyzer_app/providers/localization_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/services/auth_service.dart';
import 'package:analyzer_app/services/package_info_service.dart';
import 'package:analyzer_app/settings/language_bottom_sheet.dart';
import 'package:analyzer_app/settings/settings_card.dart';
import 'package:analyzer_app/settings/theme_bottom_sheet.dart';
import 'package:analyzer_app/providers/theme_provider.dart';
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
    final _analyzerListProvider = Provider.of<List<AnalyzerModel>>(context);

    if (_user != null) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleList(title: _locale!.appearance_language),
                  SettingsCard(
                    title: _locale.theme,
                    subtitle: _themeProvider.getThemeToString(_locale),
                    onPressed: () => showBottomSheet(context, const ThemeBottomSheet()),
                    hasIcon: true,
                  ),
                  SettingsCard(
                    title: _locale.language,
                    subtitle: _localizationProvider.getLocaleToString(),
                    onPressed: () => showBottomSheet(context, const LanguageBottomSheet()),
                    hasIcon: true,
                  ),
                  TitleList(title: _locale.personal_info),
                  SettingsCard(
                    title: _locale.change_email,
                    subtitle: _user.email ?? _locale.no_email,
                    onPressed: () => navigateToReauthenticationScreen(context, false),
                    hasIcon: true,
                  ),
                  SettingsCard(
                    title: _locale.change_password,
                    subtitle: "*******",
                    onPressed: () => navigateToReauthenticationScreen(context, true),
                    hasIcon: true,
                  ),
                  TitleList(title: _locale.general_info),
                  SettingsCard(
                    title: _locale.number_of_analyzers,
                    subtitle: _analyzerListProvider.length.toString(),
                    onPressed: () {},
                    hasIcon: false,
                  ),
                  SettingsCard(
                      title: _locale.app_version,
                      subtitle: "${PackageInfoService.version}+${PackageInfoService.build} ",
                      onPressed: () {},
                      hasIcon: false),
                  const SizedBox(height: 10),
                  Center(
                    child: PrimaryButton(
                      action: () => AuthService().signOut(context),
                      text: _locale.sign_out,
                      icon: FontAwesomeIcons.rightFromBracket,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return const LoadingIndicator();
    }
  }

  void navigateToReauthenticationScreen(BuildContext context, bool changePassword) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => ReauthenticationScreen(changePassword: changePassword),
      ),
    );
  }

  void showBottomSheet(BuildContext context, Widget bottomSheet) {
    showModalBottomSheet(context: context, builder: (context) => bottomSheet);
  }
}
