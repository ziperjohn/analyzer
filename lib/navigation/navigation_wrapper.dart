// ignore_for_file: implementation_imports
import 'package:analyzer_app/navigation/navigation_provider.dart';
import 'package:analyzer_app/home/home_screen.dart';
import 'package:analyzer_app/settings/settings_screen.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';

class NavigationWrapper extends StatelessWidget {
  const NavigationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screens = [
      const SettingsScreen(),
      const HomeScreen(),
    ];
    final _navigationProvider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      body: _screens[_navigationProvider.screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _navigationProvider.setScreenIndex(index),
        currentIndex: _navigationProvider.screenIndex,
        backgroundColor: surfaceColor,
        fixedColor: primaryColor,
        items: const [
          BottomNavigationBarItem(label: "Settings", icon: Icon(FontAwesomeIcons.userCog)),
          BottomNavigationBarItem(label: "Home", icon: Icon(FontAwesomeIcons.home)),
        ],
      ),
    );
  }
}
