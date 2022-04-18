// ignore_for_file: implementation_imports
import 'package:analyzer_app/providers/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/list/list_screen.dart';
import 'package:analyzer_app/settings/settings.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';

class NavigationWrapper extends StatelessWidget {
  const NavigationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);
    final _navigationProvider = Provider.of<NavigationProvider>(context);

    final _screens = [
      const ListScreen(),
      const SettingsScreen(),
    ];
    return Scaffold(
      body: _screens[_navigationProvider.screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _navigationProvider.setScreenIndex(index),
        currentIndex: _navigationProvider.screenIndex,
        fixedColor: primaryColor,
        items: [
          BottomNavigationBarItem(label: _locale!.list, icon: const Icon(FontAwesomeIcons.solidListAlt)),
          BottomNavigationBarItem(label: _locale.settings, icon: const Icon(FontAwesomeIcons.userCog)),
        ],
      ),
    );
  }
}
